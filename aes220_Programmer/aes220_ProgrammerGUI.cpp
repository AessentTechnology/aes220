/***************************************************************************************************
File name: aes220Programmer.cpp
====================================================================================================
DESCRIPTION

Simple console to program both FPGA and micro-controller on aes220 board.

====================================================================================================
CHANGES

V1.3.1: Fetch information from the device EEPROM and display them as a header
        Allows selection of device depending on its idx (useful if more than
        one device is plugged at the same time).
V1.3.2: Added a check in OnIdxTimer and OnCmbIdx to ensure device information
        is present before trying to display it on the GUI.
V1.4.0: Release version 
V1.4.1: Adding switch to program either aes220a or b requires libaes220.1.5.0 or above
        although doesn't actually use the library but access the C++ files directly
V1.4.2: Switching to using libaes220.so rather than accessing the cpp functions of the API
        directly.
        Modifying the Files menu to display only FPGA .bin and .*** files.
V1.4.3: Changed browse buttons initial variable to open with the last path browsed and added keys
        to the config repository to save the last paths visited with the different browse buttons.
        Reverted to using the source files rather than the dynamic library to make distribution
        easier.

====================================================================================================
NOTES

Compile command:
g++ aes220_ProgrammerGUI.cpp `wx-config --libs` `wx-config --cxxflags` -lusb-1.0
 ../API/lib/aes220Dev.cpp ../API/lib/aesFx2Dev.cpp
 ../API/lib/aesUSB.cpp -o aes220_ProgrammerGUI

For more information on child processes look at wxWidgets exec.cpp example

====================================================================================================
Copyright (C) 2012 Sebastien Saury, Aessent Technology Ltd

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

***************************************************************************************************/

#include<iomanip>

#include "wx/wx.h"
#include "wx/config.h"

#include "wx/progdlg.h"
#include "wx/thread.h"
#include "wx/dynarray.h"
#include "wx/numdlg.h"
#include "wx/notebook.h"

#include <aes220_API.h>

#define SOFT_VER "aes220 Programmer Version 1.4.3"
#define VBS_LEVEL 3
#define RESET_FILE "reset.ihx"

using namespace std;

class ConfigFpgaThread;
class ProgramFpgaThread;
class EraseFpgaThread;

static	wxMutex moduleInUse;
static  wxTextCtrl *m_log;


WX_DEFINE_ARRAY_PTR(wxThread *, wxArrayThread);

class MyApp: public wxApp
{
public:

  MyApp();
  virtual ~MyApp(){};

  virtual bool OnInit();
  virtual int OnExit();

  // all the threads currently alive - as soon as the thread terminates, it's
  // removed from the array
  wxArrayThread m_threads;

  // crit section protects access to all of the arrays below
  wxCriticalSection m_critsect;

  // semaphore used to wait for the threads to exit, see MainFrame::OnQuit()
  wxSemaphore m_semAllDone;

  // the last exiting thread should post to m_semAllDone if this is true
  // (protected by the same m_critsect)
  bool m_waitingUntilAllDone;

};

// Create a new application object
IMPLEMENT_APP(MyApp);

class MainFrame: public wxFrame
{
public:

  MainFrame(const wxString& title);
  virtual ~MainFrame();

  void OnNewProject(wxCommandEvent& event);
  void OnQuit(wxCommandEvent& event);
  void OnAbout(wxCommandEvent& event);
  void OnRadioButtonAes220ID(wxCommandEvent &event);
  void OnRadioButtonFx2lpID(wxCommandEvent &event);
  void OnBrowseBtn1(wxCommandEvent& WXUNUSED(event));
  void OnBrowseBtn2(wxCommandEvent& WXUNUSED(event));
  void OnBrowseBtn3(wxCommandEvent& WXUNUSED(event));
  void OnProgRamBtn(wxCommandEvent& WXUNUSED(event));
  void OnProgEEPBtn(wxCommandEvent& WXUNUSED(event));
  void OnRstEEPBtn(wxCommandEvent& WXUNUSED(event));
  void OnConfFPGABtn(wxCommandEvent& WXUNUSED(event));
  void ConfFPGA();
  void OnProgFPGABtn(wxCommandEvent& WXUNUSED(event));
  void OnEraseFPGABtn(wxCommandEvent& WXUNUSED(event));
  void OnCmbIdx(wxCommandEvent& WXUNUSED(event));
  void OnGaugeTimer(wxTimerEvent& event);
  void OnIdxTimer(wxTimerEvent& event);
  bool StartGaugeTimer();
  bool StartIdxTimer();
  void StopGaugeTimer();
  void CreateGauge();

  //void OnStartConfigFpgaThread(wxCommandEvent& event);
  void OnThreadEvent(wxCommandEvent& event);

  wxTimer *m_gauge_timer;
  wxTimer *m_idx_timer;

private:

  int rv;
  int vid, pid, idx, vbs;
  uint8_t boardInfo[8];
  uint8_t firmwareInfo[3];
  wxStaticText* serialNbText;
  wxStaticText* dateCodeText;
  wxStaticText* boardText;
  wxStaticText* firmText;
  wxBoxSizer* hszIdx;
  wxConfigBase* config_ptr;
  wxTextCtrl* uCRamFileTxtCtrl;
  wxTextCtrl* uCEepFileTxtCtrl;
  wxTextCtrl* fpgaConfFileTxtCtrl;
  wxString fpgaConfFileName;
  wxString fpgaProgFileName;
  wxComboBox* cmbIdx;
  static const int INTERVAL = 300; // milliseconds
  // helper function - creates a new thread (but doesn't run it)
  ConfigFpgaThread *CreateConfigFpgaThread();
  ProgramFpgaThread *CreateProgramFpgaThread();
  EraseFpgaThread *CreateEraseFpgaThread();
  // remember the number of running threads and total number of threads
  size_t m_nRunning, m_nCount;
  // the progress dialog which we show while worker thread is running
  wxProgressDialog *m_dlgProgress;

  wxString lastFpgaDirectory;
  wxString lastRamDirectory;
  wxString lastEepDirectory;

  DECLARE_EVENT_TABLE();
};

enum
  {
    ID_Quit = 1,
    ID_NewProject,
    ID_About,
    wxID_CloseApp,
    wxID_Aes220IDrBtn,
    wxID_Fx2lpIDrBtn,
    wxID_BrowseBtn1,
    wxID_BrowseBtn2,
    wxID_BrowseBtn3,
    wxID_ProgRamBtn,
    wxID_ProgEEPBtn,
    wxID_RstEEPBtn,
    wxID_ConfFPGABtn,
    wxID_ProgFPGABtn,
    wxID_EraseFPGABtn,
    wxID_uCRamFile,
    wxID_uCEepFile,
    wxID_fpgaConfFile,
    wxID_fpgaProgFile,
    wxID_OnGaugeTimer,
    wxID_OnIdxTimer,
    wxID_ThreadEvent,
    wxID_Book,
    wxID_CmbIdx,
  };

class ConfigFpgaThread : public wxThread
{
public:
  ConfigFpgaThread(MainFrame *frame, int vid, int pid, int idx, int vbs, wxString fpgaConfFileName);

  // thread execution starts here
  virtual void *Entry();

  // called when the thread exits - whether it terminates normally or is
  // stopped with Delete() (but not when it is Kill()ed!)
  virtual void OnExit();

public:
  unsigned m_count;
  MainFrame *m_frame;

private:

  int m_vid;
  int m_pid;
  int m_idx;
  int m_vbs;
  wxString m_fpgaConfFileName;
};

ConfigFpgaThread::ConfigFpgaThread(MainFrame *frame, int vid, int pid, int idx, int vbs,
				   wxString fpgaConfFileName) : wxThread()
{
  m_count = 0;
  m_frame = frame;
  m_vid = vid;
  m_pid = pid;
  m_idx = idx;
  m_vbs = vbs;
  m_fpgaConfFileName = fpgaConfFileName;
}

void ConfigFpgaThread::OnExit()
{
  wxCriticalSectionLocker locker(wxGetApp().m_critsect);
  wxArrayThread& threads = wxGetApp().m_threads;
  threads.Remove(this);
  if ( threads.IsEmpty() )
    {
      // signal the main thread that there are no more threads left if it is
      // waiting for us
      if ( wxGetApp().m_waitingUntilAllDone )
        {
	  wxGetApp().m_waitingUntilAllDone = false;
	  wxGetApp().m_semAllDone.Post();
        }
    }
}

void *ConfigFpgaThread::Entry()
{
  // Use a mutex to ensure the device is not being used by another thread when trying to communicate
  // with it.
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    aes220_handle *aes220_ptr = aes220_Open_Device(m_vid, m_pid, m_idx, m_vbs);
    aes220_Configure_FPGA(aes220_ptr, m_fpgaConfFileName.mb_str());
    aes220_Close(aes220_ptr);
    //confFpga(m_vid, m_pid, m_idx, m_fpgaConfFileName.mb_str());
    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Can't unlock the device.\n");
    }
  }
  else {
    *m_log << _T("Can't lock the device.\n");
  }
  wxCommandEvent event( wxEVT_COMMAND_MENU_SELECTED, wxID_ThreadEvent );
  event.SetInt(-1);
  wxPostEvent( m_frame, event );
  return NULL;
}


class ProgramFpgaThread : public wxThread
{
public:
  ProgramFpgaThread(MainFrame *frame, int vid, int pid, int idx, int vbs, 
		    wxString fpgaProgFileName);

  // thread execution starts here
  virtual void *Entry();

  // called when the thread exits - whether it terminates normally or is
  // stopped with Delete() (but not when it is Kill()ed!)
  virtual void OnExit();

public:
  unsigned m_count;
  MainFrame *m_frame;

private:

  int m_vid;
  int m_pid;
  int m_idx;
  int m_vbs;
  wxString m_fpgaProgFileName;
};

ProgramFpgaThread::ProgramFpgaThread(MainFrame *frame, int vid, int pid, int idx, int vbs,
				     wxString fpgaProgFileName) : wxThread()
{
  m_count = 0;
  m_frame = frame;
  m_vid = vid;
  m_pid = pid;
  m_idx = idx;
  m_vbs = vbs;
  m_fpgaProgFileName = fpgaProgFileName;
}

void ProgramFpgaThread::OnExit()
{
  wxCriticalSectionLocker locker(wxGetApp().m_critsect);
  wxArrayThread& threads = wxGetApp().m_threads;
  threads.Remove(this);
  if ( threads.IsEmpty() )
    {
      // signal the main thread that there are no more threads left if it is
      // waiting for us
      if ( wxGetApp().m_waitingUntilAllDone )
        {
	  wxGetApp().m_waitingUntilAllDone = false;
	  wxGetApp().m_semAllDone.Post();
        }
    }
}

void *ProgramFpgaThread::Entry()
{
  // Use a mutex to ensure the device is not being used by another thread when trying to communicate
  // with it.
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    aes220_handle *aes220_ptr = aes220_Open_Device(m_vid, m_pid, m_idx, m_vbs);
    aes220_Program_FPGA(aes220_ptr, m_fpgaProgFileName.mb_str());
    aes220_Close(aes220_ptr);
    //progFpga(m_vid, m_pid, m_idx, m_fpgaProgFileName.mb_str());
    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Can't unlock the device.\n");
    }
  }
  else {
    *m_log << _T("Can't lock the device.\n");
  }
  wxCommandEvent event( wxEVT_COMMAND_MENU_SELECTED, wxID_ThreadEvent );
  event.SetInt(-1);
  wxPostEvent( m_frame, event );
  return NULL;
}


class EraseFpgaThread : public wxThread
{
public:
  EraseFpgaThread(MainFrame *frame, int vid, int pid, int idx, int vbs);

  // thread execution starts here
  virtual void *Entry();

  // called when the thread exits - whether it terminates normally or is
  // stopped with Delete() (but not when it is Kill()ed!)
  virtual void OnExit();

public:
  unsigned m_count;
  MainFrame *m_frame;

private:

  int m_vid;
  int m_pid;
  int m_idx;
  int m_vbs;
};

EraseFpgaThread::EraseFpgaThread(MainFrame *frame, int vid, int pid, int idx, int vbs) : wxThread()
{
  m_count = 0;
  m_frame = frame;
  m_vid = vid;
  m_pid = pid;
  m_idx = idx;
  m_vbs = vbs;
}

void EraseFpgaThread::OnExit()
{
  wxCriticalSectionLocker locker(wxGetApp().m_critsect);

  wxArrayThread& threads = wxGetApp().m_threads;
  threads.Remove(this);

  if ( threads.IsEmpty() )
    {
      // signal the main thread that there are no more threads left if it is
      // waiting for us
      if ( wxGetApp().m_waitingUntilAllDone )
        {
	  wxGetApp().m_waitingUntilAllDone = false;
	  wxGetApp().m_semAllDone.Post();
        }
    }
}

void *EraseFpgaThread::Entry()
{
  // Use a mutex to ensure the device is not being used by another thread when trying to communicate
  // with it.
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    aes220_handle *aes220_ptr = aes220_Open_Device(m_vid, m_pid, m_idx, m_vbs);
    aes220_Erase_FPGA(aes220_ptr);
    aes220_Close(aes220_ptr);
    //eraseFpga(m_vid, m_pid, m_idx);
    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Can't unlock the device.\n");
    }
  }
  else {
    *m_log << _T("Can't lock the device.\n");
  }
  wxCommandEvent event( wxEVT_COMMAND_MENU_SELECTED, wxID_ThreadEvent );
  event.SetInt(-1);
  wxPostEvent( m_frame, event );

  return NULL;
}


// Bind the events to handlers
BEGIN_EVENT_TABLE(MainFrame, wxFrame)

EVT_MENU(ID_NewProject, MainFrame::OnNewProject)
EVT_MENU(ID_Quit,       MainFrame::OnQuit)
EVT_MENU(ID_About,      MainFrame::OnAbout)

EVT_RADIOBUTTON(wxID_Aes220IDrBtn, MainFrame::OnRadioButtonAes220ID)
EVT_RADIOBUTTON(wxID_Fx2lpIDrBtn,  MainFrame::OnRadioButtonFx2lpID)

EVT_BUTTON(wxID_BrowseBtn1,   MainFrame::OnBrowseBtn1)
EVT_BUTTON(wxID_BrowseBtn2,   MainFrame::OnBrowseBtn2)
EVT_BUTTON(wxID_BrowseBtn3,   MainFrame::OnBrowseBtn3)
EVT_BUTTON(wxID_ProgRamBtn,   MainFrame::OnProgRamBtn)
EVT_BUTTON(wxID_ProgEEPBtn,   MainFrame::OnProgEEPBtn)
EVT_BUTTON(wxID_RstEEPBtn,    MainFrame::OnRstEEPBtn)
EVT_BUTTON(wxID_ConfFPGABtn,  MainFrame::OnConfFPGABtn)
EVT_BUTTON(wxID_ProgFPGABtn,  MainFrame::OnProgFPGABtn)
EVT_BUTTON(wxID_EraseFPGABtn, MainFrame::OnEraseFPGABtn)
EVT_BUTTON(wxID_CloseApp,     MainFrame::OnQuit)

EVT_COMBOBOX(wxID_CmbIdx, MainFrame::OnCmbIdx)

EVT_MENU(wxID_ThreadEvent, MainFrame::OnThreadEvent)

EVT_TIMER(wxID_OnGaugeTimer, MainFrame::OnGaugeTimer)
EVT_TIMER(wxID_OnIdxTimer, MainFrame::OnIdxTimer)

END_EVENT_TABLE()


// Application class
//=============================================================================
MyApp::MyApp()
: m_semAllDone()
{
  m_waitingUntilAllDone = false;
}

bool MyApp::OnInit()
{
  // application and vendor name are used by wxConfig to construct the name
  // of the config file/registry key and must be set before the first call
  // to Get() if you want to override the default values (the application
  // name is the name of the executable and the vendor name is the same)
  SetVendorName(_T("aessentTecnology"));
  SetAppName(_T("aes220Programmer")); // not needed, it's the default value

  wxConfigBase* config_ptr = wxConfigBase::Get();
  config_ptr->SetRecordDefaults();

  // Create the main application window
  MainFrame *appFrame = new MainFrame(
				      _("Aessent Technology aes220 Programmer Console"));
  // Show it and tell the application that it's our main window
  appFrame->Show(true);
  SetTopWindow(appFrame);

  return true;
}

int MyApp::OnExit()
{
  // clean up: Set() returns the active config object as Get() does, but unlike
  // Get() it doesn't try to create one if there is none (definitely not what
  // we want here!)
  delete wxConfigBase::Set((wxConfigBase *) NULL);

  return 0;
}


// Main frame
//=============================================================================
MainFrame::MainFrame(const wxString& title)
  : wxFrame(NULL, -1, title, wxDefaultPosition, wxDefaultSize)
    //wxDEFAULT_FRAME_STYLE | wxNO_FULL_REPAINT_ON_RESIZE)
{

  vid = 0x2443;
  pid = 0x00dc;
  vbs = VBS_LEVEL;

  m_nRunning = m_nCount = 0;
  m_dlgProgress = (wxProgressDialog *)NULL;


  // Create a menu bar
  wxMenuBar *menuBar = new wxMenuBar;

  // and add some menus
  wxMenu *menuFile = new wxMenu;
  wxMenu *menuAbout = new wxMenu;

  // Add some items to each menu
  // menu File
  menuFile->Append( ID_NewProject, _("&New Project") );
  menuFile->AppendSeparator();
  menuFile->Append( ID_Quit, _("E&xit") );
  // menu About
  menuAbout->Append( ID_About, _("&About aes220 Programmer Console") );

  // Put the menus on the menu bar
  menuBar->Append( menuFile, _("&File") );
  menuBar->Append( menuAbout, _("&About") );
  SetMenuBar(menuBar);

  // Create a panel to put the controls on
  wxPanel* panel = new wxPanel(this, wxID_ANY);
  // Create a notebook
  wxNotebook* notebook = new wxNotebook(panel, wxID_Book);
  // Create panels for the notebook
  wxPanel* fpgaPanel = new wxPanel(notebook, wxID_ANY);
  wxPanel* advancedPanel = new wxPanel(notebook, wxID_ANY);
  // Add the panels to the notebook
  notebook->AddPage(fpgaPanel, _T("FPGA"), true);
  notebook->AddPage(advancedPanel, _T("Advanced"), false);


  // Create some text
  wxStaticText* swVer = new wxStaticText(panel, wxID_ANY, _T(SOFT_VER));
  uCRamFileTxtCtrl = new wxTextCtrl(advancedPanel, wxID_uCRamFile, _T(""),
				    wxPoint(), wxSize(300,30));
  uCEepFileTxtCtrl = new wxTextCtrl(advancedPanel, wxID_uCEepFile, _T(""),
				    wxPoint(), wxSize(300,30));
  fpgaConfFileTxtCtrl = new wxTextCtrl(fpgaPanel, wxID_fpgaConfFile, _T(""),
				       wxPoint(), wxSize(300,30));
  config_ptr = wxConfigBase::Get();
  config_ptr->SetPath(_T("/paths"));
  uCRamFileTxtCtrl->SetValue(config_ptr->Read(_T("uCRamFile"), _T("")));
  uCEepFileTxtCtrl->SetValue(config_ptr->Read(_T("uCEepFile"), _T("")));
  fpgaConfFileTxtCtrl->SetValue(config_ptr->Read(_T("fpgaConfFile"), _T("")));
  lastRamDirectory = config_ptr->Read(_T("lastRamDirectory"), _T("/home"));
  lastEepDirectory = config_ptr->Read(_T("lastEepDirectory"), _T("/home"));
  lastFpgaDirectory = config_ptr->Read(_T("lastFpgaDirectory"), _T("/home"));

  // Create the application buttons
  // Radio buttons for chosing the device vid/pid
#ifdef _WIN32
#else
  wxRadioButton* aes220IDrbtn = new wxRadioButton(advancedPanel, wxID_Aes220IDrBtn,
						  _("aes220 VID/PID"), wxDefaultPosition,
						  wxDefaultSize, 0,
						  wxDefaultValidator, _T("wxID_rBtn1"));
  wxRadioButton* fx2lpIDrbtn = new wxRadioButton(advancedPanel, wxID_Fx2lpIDrBtn,
						 _("blank device VID/PID"), wxDefaultPosition,
						 wxDefaultSize, 0,
						 wxDefaultValidator, _T("wxID_rBtn2"));
#endif
  // Other Buttons
  wxButton* browsebtn1 = new wxButton(advancedPanel, wxID_BrowseBtn1,
				      wxT("Browse"),
				      wxPoint(), wxSize(60,30));
  wxButton* browsebtn2 = new wxButton(advancedPanel, wxID_BrowseBtn2,
				      wxT("Browse"),
				      wxPoint(), wxSize(60,30));
  wxButton* browsebtn3 = new wxButton(fpgaPanel, wxID_BrowseBtn3,
				      wxT("Browse"),
				      wxPoint(), wxSize(60,30));
  wxButton* confRambtn = new wxButton(advancedPanel, wxID_ProgRamBtn,
				      wxT("Program RAM"),
				      wxPoint(), wxSize(130,30));
  wxButton* progEepbtn = new wxButton(advancedPanel, wxID_ProgEEPBtn,
				      wxT("Program EEPROM"),
				      wxPoint(), wxSize(130,30));
  wxButton* rstEepbtn = new wxButton(advancedPanel, wxID_RstEEPBtn,
				     wxT("Reset EEPROM"),
				     wxPoint(), wxSize(130,30));
  wxButton* confFpgabtn = new wxButton(fpgaPanel, wxID_ConfFPGABtn,
				       wxT("Configure FPGA"),
				       wxPoint(), wxSize(130,30));
  wxButton* progFpgabtn = new wxButton(fpgaPanel, wxID_ProgFPGABtn,
				       wxT("Program FPGA"),
				       wxPoint(), wxSize(130,30));
  wxButton* eraseFpgabtn = new wxButton(fpgaPanel, wxID_EraseFPGABtn,
					wxT("Erase FPGA"),
					wxPoint(), wxSize(130,30));
  wxButton* clsbtn = new wxButton(panel, wxID_CloseApp, wxT("Close"),
				  wxPoint(), wxSize(130,30));

  // Combo box for choosing which device to speak to
  idx = 0;
  StartIdxTimer();
  aes220_handle *aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs);
  aes220_Get_Board_Info(aes220_ptr, boardInfo);
  aes220_Close(aes220_ptr);
  //getBoardInfo(vid, pid, idx, boardInfo);
  wxArrayString idxStrings;
  for (int i = 0; i < 10; i++) {
    idxStrings.Add(wxString::Format(_T("%d"), i));
  }
  cmbIdx = new wxComboBox(panel, wxID_CmbIdx, wxT("0"), wxDefaultPosition,
			  wxSize(60,24), idxStrings, wxCB_DROPDOWN);
  wxStaticText* idxText =
    new wxStaticText(panel, wxID_ANY, _T("Module ID: "));
  wxStaticText* serialNbDescText =
    new wxStaticText(panel, wxID_ANY, _T("Module Serial Number: "));
  wxStaticText* dateCodeDescText =
    new wxStaticText(panel, wxID_ANY, _T("Module Date Code:     "));
  wxStaticText* boardDescText =
    new wxStaticText(panel, wxID_ANY, _T("Module:               "));
  wxStaticText* firmDescText =
    new wxStaticText(panel, wxID_ANY, _T("Firmware Revision:    "));

  serialNbText = new wxStaticText(panel, wxID_ANY, _T(""));
  dateCodeText = new wxStaticText(panel, wxID_ANY, _T(""));
  boardText = new wxStaticText(panel, wxID_ANY, _T(""));
  firmText = new wxStaticText(panel, wxID_ANY, _T(""));

  cmbIdx->SetToolTip(_T("Select the device ID when more than one device is used.\nStarts at 0 and increases when more devices are plugged in."));
  serialNbDescText->SetToolTip(_T("That is the serial number present on the board bottom side."));
  serialNbText->SetLabel(_T("0"));

  // Add a log window
  m_log = new wxTextCtrl( panel, wxID_ANY, _T("Thank you for using aes220 Programmer.\n"),
			  wxPoint(5,5), wxSize(50,50),
			  wxTE_MULTILINE | wxTE_READONLY /* | wxTE_RICH */);

  // Create a stream to the log window
  //ostream stream(m_log);

  // uController RAM programming sizer
  // Use sizer to layout the controls, stacked horizontally
  // Text and buttons for uController RAM programming
  wxBoxSizer* hszuCRam = new wxBoxSizer(wxHORIZONTAL);
  hszuCRam->Add(uCRamFileTxtCtrl, wxSizerFlags(1));
  hszuCRam->Add(browsebtn1);
  hszuCRam->Add(confRambtn);

  // uController EEPROM programming sizer
  // Use sizer to layout the controls, stacked horizontally
  // Text and buttons for uController EEPROM programming
  wxBoxSizer* hszuCEep = new wxBoxSizer(wxHORIZONTAL);
  hszuCEep->Add(uCEepFileTxtCtrl, wxSizerFlags(1));
  hszuCEep->Add(browsebtn2);
  hszuCEep->Add(progEepbtn);

  //Create a vertical sizer for the module info description
  wxBoxSizer* vszModInfoDesc = new wxBoxSizer(wxVERTICAL);
  vszModInfoDesc->Add(serialNbDescText);
  vszModInfoDesc->Add(dateCodeDescText);
  vszModInfoDesc->Add(boardDescText);
  vszModInfoDesc->Add(firmDescText);
  //Create a vertical sizer for the module info itself
  wxBoxSizer* vszModInfo = new wxBoxSizer(wxVERTICAL);
  vszModInfo->Add(serialNbText);
  vszModInfo->Add(dateCodeText);
  vszModInfo->Add(boardText);
  vszModInfo->Add(firmText);
  // Create an horizontal sizer for the module information (static box)
  wxBoxSizer* hszInfo = new wxStaticBoxSizer(new wxStaticBox(panel, wxID_ANY, _T("")),
					     wxHORIZONTAL);
  hszInfo->Add(vszModInfoDesc);
  hszInfo->Add(vszModInfo);
  // Create an horizontal sizer for the Idx combo box
  hszIdx = new wxStaticBoxSizer(new wxStaticBox(panel, wxID_ANY, _T("")), wxHORIZONTAL);
  hszIdx->Add(idxText, wxSizerFlags().Border(wxTOP, 10));
  hszIdx->Add(cmbIdx, wxSizerFlags().Border(wxTOP, 7));
  hszIdx->AddStretchSpacer();
  //hszIdx->AddSpacer(30);
  hszIdx->Add(hszInfo, wxSizerFlags().Border(wxBOTTOM, 5));

  //hszIdx->Add(serialNbDescText, wxSizerFlags().Centre());
  //hszIdx->Add(serialNbText, wxSizerFlags().Centre());
  //hszIdx->Add(serialNbText, wxSizerFlags().Border(wxTOP, 10));

  // radio butttons, text and buttons for  uController
  wxBoxSizer* vszuC = new wxStaticBoxSizer(new wxStaticBox(advancedPanel, wxID_ANY,
					   wxT("uController")), wxVERTICAL);
#ifdef _WIN32
#else
  vszuC->Add(aes220IDrbtn);
  vszuC->Add(fx2lpIDrbtn);
#endif
  vszuC->Add(hszuCRam, wxSizerFlags().Expand());
  vszuC->Add(hszuCEep, wxSizerFlags().Expand());
  vszuC->Add(rstEepbtn, wxSizerFlags().Right());

  // Second static box
  // Text and buttons for  FPGA
  wxBoxSizer* vszFpga = new wxStaticBoxSizer(new wxStaticBox(fpgaPanel, wxID_ANY, wxT("")),
					     wxVERTICAL);
  // Use sizer to layout the controls, stacked horizontally
  // Text and button for FPGA configuration
  wxBoxSizer* hszFpgaConf = new wxBoxSizer(wxHORIZONTAL);
  hszFpgaConf->Add(fpgaConfFileTxtCtrl, wxSizerFlags(1));
  hszFpgaConf->Add(browsebtn3);
  hszFpgaConf->Add(confFpgabtn);
  // Stack the text control box and button vertically with the other Fpga buttons
  vszFpga->Add(hszFpgaConf, wxSizerFlags().Right().Expand());
  vszFpga->Add(progFpgabtn, wxSizerFlags().Right());
  vszFpga->Add(eraseFpgabtn, wxSizerFlags().Right());

  wxBoxSizer* fpgaSizer = new wxBoxSizer(wxVERTICAL);
  fpgaSizer->Add(vszFpga, wxSizerFlags().Right().Expand().Border(wxALL, 5));
  fpgaPanel->SetSizer(fpgaSizer);
  wxBoxSizer* advancedSizer = new wxBoxSizer(wxVERTICAL);
  advancedSizer->Add(vszuC, wxSizerFlags().Right().Expand().Border(wxALL, 5));
  advancedPanel->SetSizer(advancedSizer);

  // Use sizer to layout the controls, stacked horizontally
  // Third row: application buttons
  wxBoxSizer* vszCtrl = new wxBoxSizer( wxVERTICAL );
  vszCtrl->Add(clsbtn, wxSizerFlags(1));

  // Use sizer to layout the controls, stacked vertically
  wxBoxSizer* topSizer = new wxBoxSizer(wxVERTICAL);
  topSizer->Add(swVer, wxSizerFlags().Right().Border(wxALL, 10));
  topSizer->Add(hszIdx, wxSizerFlags().Expand().Border(wxALL, 5));
  topSizer->Add(notebook, wxSizerFlags().Expand().Border(wxALL, 5));
  topSizer->Add(vszCtrl, wxSizerFlags().Right().Border(wxALL, 10));
  topSizer->Add(m_log, 1, wxALL | wxEXPAND, 10);

  CreateStatusBar(2);
  SetStatusText(_("Aessent Technology"));

  panel->SetSizer(topSizer);
  topSizer->SetSizeHints(this);


}

MainFrame::~MainFrame()
{
  // NB: although the OS will terminate all the threads anyhow when the main
  //     one exits, it's good practice to do it ourselves -- even if it's not
  //     completely trivial in this example

  // tell all the threads to terminate: note that they can't terminate while
  // we're deleting them because they will block in their OnExit() -- this is
  // important as otherwise we might access invalid array elements
  wxThread *thread;

  wxGetApp().m_critsect.Enter();

  // check if we have any threads running first
  const wxArrayThread& threads = wxGetApp().m_threads;
  size_t count = threads.GetCount();

  if ( count ) {
    // set the flag for ConfigFpgaThread::OnExit()
    wxGetApp().m_waitingUntilAllDone = true;

    // stop all threads
    while ( ! threads.IsEmpty() )
      {
	thread = threads.Last();
	wxGetApp().m_critsect.Leave();
	thread->Delete();
	wxGetApp().m_critsect.Enter();
      }
  }
  wxGetApp().m_critsect.Leave();
  if ( count )
    {
      // now wait for them to really terminate
      wxGetApp().m_semAllDone.Wait();
    }
  //else: no threads to terminate, no condition to wait for

  wxConfigBase *config_ptr = wxConfigBase::Get();
  if ( config_ptr == NULL )
    return;

  // Save the files' path values to the config
  config_ptr->Write(_T("/paths/uCRamFile"), uCRamFileTxtCtrl->GetValue());
  config_ptr->Write(_T("/paths/uCEepFile"), uCEepFileTxtCtrl->GetValue());
  config_ptr->Write(_T("/paths/fpgaConfFile"), fpgaConfFileTxtCtrl->GetValue());
  config_ptr->Write(_T("/paths/lastRamDirectory"), lastRamDirectory);
  config_ptr->Write(_T("/paths/lastEepDirectory"), lastEepDirectory);
  config_ptr->Write(_T("/paths/lastFpgaDirectory"), lastFpgaDirectory);
}

ConfigFpgaThread *MainFrame::CreateConfigFpgaThread()
{
  ConfigFpgaThread *thread = new ConfigFpgaThread(this, vid, pid, idx, vbs, fpgaConfFileName);

  if ( thread->Create() != wxTHREAD_NO_ERROR )
    {
      wxLogError(wxT("Can't create config Fpga thread!"));
    }

  wxCriticalSectionLocker enter(wxGetApp().m_critsect);
  wxGetApp().m_threads.Add(thread);

  return thread;
}

ProgramFpgaThread *MainFrame::CreateProgramFpgaThread()
{
  ProgramFpgaThread *thread = new ProgramFpgaThread(this, vid, pid, idx, vbs, fpgaProgFileName);

  if ( thread->Create() != wxTHREAD_NO_ERROR )
    {
      wxLogError(wxT("Can't create program Fpga thread!"));
    }

  wxCriticalSectionLocker enter(wxGetApp().m_critsect);
  wxGetApp().m_threads.Add(thread);

  return thread;
}

EraseFpgaThread *MainFrame::CreateEraseFpgaThread()
{
  EraseFpgaThread *thread = new EraseFpgaThread(this, vid, pid, idx, vbs);

  if ( thread->Create() != wxTHREAD_NO_ERROR )
    {
      wxLogError(wxT("Can't create erase Fpga thread!"));
    }

  wxCriticalSectionLocker enter(wxGetApp().m_critsect);
  wxGetApp().m_threads.Add(thread);

  return thread;
}

void MainFrame::OnNewProject(wxCommandEvent& WXUNUSED(event))
{
  wxConfigBase *pConfig = wxConfigBase::Get();
  if ( pConfig == NULL )
    {
      wxLogError(_T("No config to delete!"));
      return;
    }

  if ( pConfig->DeleteAll() )
    {
      wxLogMessage(_T("Config file/registry key successfully deleted."));

      delete wxConfigBase::Set(NULL);
      wxConfigBase::DontCreateOnDemand();
    }
  else
    {
      wxLogError(_T("Deleting config file/registry key failed."));
    }
}

void MainFrame::OnQuit(wxCommandEvent& WXUNUSED(event))
{
  Close(TRUE);
}

void MainFrame::OnAbout(wxCommandEvent& WXUNUSED(event))
{
  wxMessageBox( _(SOFT_VER),
		_("About aes220 Programmer Console"),
		wxOK | wxICON_INFORMATION, this);
}

void MainFrame::OnRadioButtonAes220ID(wxCommandEvent &event)
{
  vid = 0x2443;
  pid = 0x00dc;
  vbs = VBS_LEVEL;
}

void MainFrame::OnRadioButtonFx2lpID(wxCommandEvent &event)
{
  vid = 0x04b4;
  pid = 0x8613;
  vbs = VBS_LEVEL;
}

void MainFrame::OnBrowseBtn1(wxCommandEvent& WXUNUSED(event))
{ // RAM files browse button
  wxFileDialog dlg(this,
		   wxT("Choose File"),
		   lastRamDirectory,
		   wxEmptyString,
		   wxT("Binary files (*.ihx)|*.ihx|All files (*.*)|*.*"),
		   wxFD_OPEN);

  if ( dlg.ShowModal() == wxID_OK )
    {
      uCRamFileTxtCtrl->SetValue(dlg.GetPath());
      lastRamDirectory = dlg.GetDirectory();
    }
}

void MainFrame::OnBrowseBtn2(wxCommandEvent& WXUNUSED(event))
{ // EEPROM files browse button
  wxFileDialog dlg(this,
		   wxT("Choose File"),
		   lastEepDirectory,
		   wxEmptyString,
		   wxT("Binary files (*.iic)|*.iic|All files (*.*)|*.*"),
		   wxFD_OPEN);

  if ( dlg.ShowModal() == wxID_OK )
    {
      uCEepFileTxtCtrl->SetValue(dlg.GetPath());
      lastEepDirectory = dlg.GetDirectory();
    }
}

void MainFrame::OnBrowseBtn3(wxCommandEvent& WXUNUSED(event))
{ // FPGA files browse button
  wxFileDialog dlg(this,
		   wxT("Load binary File:"),
		   lastFpgaDirectory,
		   wxEmptyString,
		   wxT("Binary files (*.bin)|*.bin|All files (*.*)|*.*"),
		   // bit files not supported for the time being:
		   //wxT("Binary files (*.bin;*.bit)|*.bin;*.bit|All files (*.*)|*.*"),
		   wxFD_OPEN);

  if ( dlg.ShowModal() == wxID_OK )
    {
      fpgaConfFileTxtCtrl->SetValue(dlg.GetPath());
      lastFpgaDirectory = dlg.GetDirectory();
    }
}

void MainFrame::OnProgRamBtn(wxCommandEvent& WXUNUSED(event))
{
  //wxStreamToTextRedirector redirect(m_log);
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    aes220_handle *aes220_ptr =  aes220_Open_Device(vid, pid, idx, vbs);
    aes220_Program_MC_RAM(aes220_ptr, uCRamFileTxtCtrl->GetValue().mb_str());
    aes220_Close(aes220_ptr);
    //progUCRam(vid, pid, idx, uCRamFileTxtCtrl->GetValue().mb_str());
    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Cannot unlock the module.\n");
    }
  }
  else {
    *m_log << _T("Module busy, please try again.\n");
  }
}

void MainFrame::OnProgEEPBtn(wxCommandEvent& WXUNUSED(event))
{
  //wxStreamToTextRedirector redirect(m_log);
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    wxStopWatch sw;
    aes220_handle *aes220_ptr =  aes220_Open_Device(vid, pid, idx, vbs);
    aes220_Program_MC_EEPROM(aes220_ptr, uCEepFileTxtCtrl->GetValue().mb_str());
    aes220_Close(aes220_ptr);
    //progUCEep(vid, pid, idx, uCEepFileTxtCtrl->GetValue().mb_str());
    sw.Pause();
    *m_log << _T("Time to complete the EEPROM write: ") << (sw.Time()/1000) << _T("s\n");
    // cout << "Time to complete the EEPROM write: " << setprecision(2) << (sw.Time()/1000) << "s"
    // 		 << endl;
    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Cannot unlock the module.\n");
    }
  }
  else {
    *m_log << _T("Module busy, please try again.\n");
  }
}

void MainFrame::OnRstEEPBtn(wxCommandEvent& WXUNUSED(event))
{
  //wxStreamToTextRedirector redirect(m_log);
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    aes220_handle *aes220_ptr = aes220_Open_Device(vid, pid, idx, vbs);
    aes220_Program_MC_RAM(aes220_ptr, RESET_FILE);
    aes220_Close(aes220_ptr);
    //rstUCEep(vid, pid, idx);
    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Cannot unlock the module.\n");
    }
  }
  else {
    *m_log << _T("Module busy, please try again.\n");
  }
}

void MainFrame::OnConfFPGABtn(wxCommandEvent& WXUNUSED(event))
{
  //wxStreamToTextRedirector redirect(m_log);
  StartGaugeTimer();
  CreateGauge();
  fpgaConfFileName = fpgaConfFileTxtCtrl->GetValue();
  *m_log << _T("Configuring FPGA with: ") << fpgaConfFileName << _T("\n");
  ConfigFpgaThread *thread = CreateConfigFpgaThread();
  if ( thread->Run() != wxTHREAD_NO_ERROR )
    {
      wxLogError(wxT("Can't start thread!"));
    }
}

void MainFrame::OnProgFPGABtn(wxCommandEvent& WXUNUSED(event))
{
  //wxStreamToTextRedirector redirect(m_log);
  StartGaugeTimer();
  CreateGauge();

  fpgaProgFileName = fpgaConfFileTxtCtrl->GetValue();
  *m_log << _T("Programming FPGA Flash with: ") << fpgaProgFileName << _T("\n");
  ProgramFpgaThread *thread = CreateProgramFpgaThread();
  if ( thread->Run() != wxTHREAD_NO_ERROR )
    {
      wxLogError(wxT("Can't start thread!"));
    }
}

void MainFrame::OnEraseFPGABtn(wxCommandEvent& WXUNUSED(event))
{
  //wxStreamToTextRedirector redirect(m_log);
  StartGaugeTimer();
  CreateGauge();

  EraseFpgaThread *thread = CreateEraseFpgaThread();
  if ( thread->Run() != wxTHREAD_NO_ERROR )
    {
      wxLogError(wxT("Can't start thread!"));
    }
}

void MainFrame::OnThreadEvent(wxCommandEvent& event)
{
  int n = event.GetInt();
  if ( n == -1 ) {
    m_dlgProgress->Destroy();
    m_dlgProgress = (wxProgressDialog *)NULL;

    // the dialog is aborted because the event came from another thread, so
    // we may need to wake up the main event loop for the dialog to be
    // really closed
    wxWakeUpIdle();
    StopGaugeTimer();
  }
  else {
    m_dlgProgress->Pulse();
  }
}

void MainFrame::OnGaugeTimer(wxTimerEvent& event)
{
  //wxStreamToTextRedirector redirect(m_log);
  m_dlgProgress->Pulse();
}

void MainFrame::CreateGauge()
{
  m_dlgProgress = new wxProgressDialog
    (
     _T("Progress dialog"),
     _T("Wait until the thread terminates or press [Cancel]"),
     100,
     this,
     //wxPD_CAN_ABORT |
     wxPD_APP_MODAL |
     wxPD_ELAPSED_TIME
     //wxPD_ESTIMATED_TIME |
     //wxPD_REMAINING_TIME
     );
}

bool MainFrame::StartGaugeTimer()
{
  //static const int INTERVAL = 300;

  m_gauge_timer = new wxTimer(this, wxID_OnGaugeTimer);
  m_gauge_timer->Start(INTERVAL);

  return m_gauge_timer->IsRunning();
}

void MainFrame::StopGaugeTimer()
{
  m_gauge_timer->Stop();
  delete m_gauge_timer;
  m_gauge_timer = NULL;
}

void MainFrame::OnIdxTimer(wxTimerEvent& event)
{
  // Use a mutex to ensure the device is not being used by another thread when trying to communicate
  // with it (as would be the case when configuring or programming the FPGA).
  // Important here as the timer will most likely trigger before the FPGA is programmed.
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
    int rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
    //if (getBoardInfo(vid, pid, idx, boardInfo) == 0) {
    if (rv == 0) {
      //if (getBoardInfo(vid, pid, idx, boardInfo) == 0) {
      //getFirmwareInfo(vid, pid, idx, firmwareInfo);
      aes220_Get_Firmware_Info(aes220_ptr, firmwareInfo);
    }
    else {
      for (int i = 0 ; i < 8 ; i++) { // board info is 8 bytes long
	boardInfo[i] = 0;
	if (i < 3) { firmwareInfo[i] = 0; };
      }
    }
    boardText->SetLabel(wxString::Format(_T("aes220%c Rev%c.%d"),
					 boardInfo[1],
					 boardInfo[2],
					 boardInfo[3]));
    serialNbText->SetLabel(wxString::Format(_T("%02d"), boardInfo[4]));
    dateCodeText->SetLabel(wxString::Format(_T("%02d/%02d/20%02d"),
					    boardInfo[5],
					    boardInfo[6],
					    boardInfo[7]));
    firmText->SetLabel(wxString::Format(_T("%d.%d.%d"),
					firmwareInfo[0],
					firmwareInfo[1],
					firmwareInfo[2]));
    hszIdx->Layout();
    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Can't unlock the device.\n");
    }
    aes220_Close(aes220_ptr);
  }
}

bool MainFrame::StartIdxTimer()
{
  const int IDX_INTERVAL = 2000; // 2 seconds interval

  m_idx_timer = new wxTimer(this, wxID_OnIdxTimer);
  m_idx_timer->Start(IDX_INTERVAL);

  return m_idx_timer->IsRunning();
}

void MainFrame::OnCmbIdx(wxCommandEvent& WXUNUSED(event))
{
  // Use a mutex to ensure the device is not being used by another thread when trying to communicate
  // with it (as would be the case when configuring or programming the FPGA).
  // Academic in this case as this function is activated by the user.
  if (moduleInUse.TryLock() == wxMUTEX_NO_ERROR) {
    idx = cmbIdx->GetSelection();
    aes220_handle *aes220_ptr = aes220_Open(idx, vbs);
    int rv = aes220_Get_Board_Info(aes220_ptr, boardInfo);
    //if (getBoardInfo(vid, pid, idx, boardInfo) == 0) {
    if (rv == 0) {
    }
    else {
      for (int i = 0 ; i < 8 ; i++) { // board info is 8 bytes long
	boardInfo[i] = 0;
	if (i < 3) { firmwareInfo[i] = 0; };
      }
    }
    aes220_Get_Firmware_Info(aes220_ptr, firmwareInfo);
    //getFirmwareInfo(vid, pid, idx, firmwareInfo);
    boardText->SetLabel(wxString::Format(_T("aes220%c Rev%c.%d"),
					 boardInfo[1],
					 boardInfo[2],
					 boardInfo[3]));
    serialNbText->SetLabel(wxString::Format(_T("%02d"), boardInfo[4]));
    dateCodeText->SetLabel(wxString::Format(_T("%02d/%02d/20%02d"),
					    boardInfo[5],
					    boardInfo[6],
					    boardInfo[7]));
    firmText->SetLabel(wxString::Format(_T("%d.%d.%d"),
					firmwareInfo[0],
					firmwareInfo[1],
					firmwareInfo[2]));
    hszIdx->Layout();

    if (moduleInUse.Unlock() != wxMUTEX_NO_ERROR) {
      *m_log << _T("Can't unlock the device.\n");
    }
    aes220_Close(aes220_ptr);
  }
}
