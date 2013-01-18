/******************************************************************************
File name: aesLog_V0.0.2.h
===============================================================================
DESCRIPTION

Logging library

===============================================================================
CHANGES

V0.0.1: Original file
V0.0.2: Changing name from aes_Log to aesLog and moving to C++

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
#ifndef AESLOG_H
#define AESLOG_H

#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <time.h> 

#define ERROR_CAT  "error "
#define RESULT_CAT "result"
#define NOTE_CAT   "note  "
#define DEBUG_CAT  "debug "
#define NOISE_CAT  "noise "
#define OTHER_CAT  "other "

#define MUTE_VBS   0
#define ERROR_VBS  1
#define RESULT_VBS 3
#define NOTE_VBS   5
#define DEBUG_VBS  7
#define NOISE_VBS  9

#define ERR_CREATING_FILE 1
#define ERR_OPENING_FILE  2

using namespace std;

class aesLog {

 public:
  aesLog();
  aesLog(int vbs);
  aesLog(string logFile, int vbs);
  ~aesLog();

  int to(string logFile);
  int setVerbosity(int verbosity);
  int add(string msg, int verbosity);
  int add(string msg, int result, int verbosity);
  int add(string msg, string result, int verbosity);

 private:
  fstream lf;
  string logFileName;
  int logVerb;
  int createFile(string logFile);

template <typename result_tp>
  int writeLine(string msg, result_tp result, int verbosity);
};

#endif // AESLOG_H
