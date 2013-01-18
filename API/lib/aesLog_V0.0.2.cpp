/******************************************************************************
File name: aes_log_V0.0.2.c
===============================================================================
DESCRIPTION

Logging library

===============================================================================
CHANGES

V0.0.1: Original file
V0.0.2: Changing name from aes_Log to aesLog and moving to C++

===============================================================================
NOTES


===============================================================================

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

******************************************************************************/

#include "../include/aesLog_V0.0.2.h"

aesLog::aesLog() {
  createFile("aes_log_file.log");
  logVerb = 0;
}

aesLog::aesLog(int vbs) {
  createFile("aes_log_file.log");
  logVerb = vbs;
}

aesLog::aesLog(string logFile, int vbs) {
  createFile(logFile);
  logVerb = vbs;
}

aesLog::~aesLog() {}

int aesLog::to(string logFile) {
  if (createFile(logFile)) return ERR_CREATING_FILE;
  else return 0;
}

int aesLog::setVerbosity(int verbosity) {logVerb = verbosity; return 0;}

int aesLog::add(string msg, int verbosity) 
{
  int result = 0;
  if (verbosity <= logVerb) {return writeLine(msg, result, verbosity);}
  else return 0;
}

int aesLog::add(string msg, int result, int verbosity) 
{
  if (verbosity <= logVerb) {return writeLine(msg, result, verbosity);}
  else return 0;
}

int aesLog::add(string msg, string result, int verbosity) 
{
  if (verbosity <= logVerb) {return writeLine(msg, result, verbosity);}
  else return 0;
}

template <typename result_tp>
int aesLog::writeLine(string msg, result_tp result, int verbosity) 
{
  string category;
  time_t rawTime;
  struct tm * curTime;
  time (&rawTime);
  curTime = gmtime(&rawTime);

  switch(verbosity) {
  case ERROR_VBS:
    category.assign(ERROR_CAT);
    break;
  case RESULT_VBS:
    category.assign(RESULT_CAT);
    break;
  case NOTE_VBS:
    category.assign(NOTE_CAT);
    break;
  case DEBUG_VBS:
    category.assign(DEBUG_CAT);
    break;
  case NOISE_VBS:
    category.assign(NOISE_CAT);
    break;
  default:
    category.assign("other ");
  }
  
  // Open the log file and check it is actually opened
  lf.open(logFileName.c_str(), fstream::out | fstream::app);
  if (!lf) {cerr << "Cannot open file: " << logFileName << endl; return ERR_OPENING_FILE;}
  // Write to the stream (i.e. the log file) and check the operation succeded
  lf << setfill('0') << "t: " 
     << setw(2) << curTime->tm_hour << ":" 
     << setw(2) << curTime->tm_min << ":" 
     << setw(2) << curTime->tm_sec
     << "; c: " << category << "; v: " << verbosity << "; m: " << msg << "; r: " << result << endl;
  if (lf.bad()) { lf.close(); return 1;}
  else {lf.close(); return 0;}
}

int aesLog::createFile(string logFile) {
  logFileName.assign(logFile);
  // Open the log file and check it is actually opened
  lf.open(logFileName.c_str(), fstream::out);
  if (!lf) {cerr << "Cannot create file: " << logFileName << endl; return ERR_CREATING_FILE;}
  lf.close();
  return 0;
}
