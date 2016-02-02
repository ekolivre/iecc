/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3+.                                                         *
*                                                                              *
* Language: (Legacy) Objective-C.                                              *
* Description: Interface to represent data types of any of the IEC 61131-3     *
*   programming languages. This file will also include all the standard types  *
*   defined by the common language.                                            *
********************************************************************************
* Copyright (C) 2015 - Paulo H. Torrens. All rights reserved.                  *
*                                                                              *
* This program is free software: you can redistribute it and/or modify it      *
* under the terms of the GNU General Public License as published by the Free   *
* Software Foundation, either version 3 of the License, or (at your option)    *
* any later version.                                                           *
*                                                                              *
* This program is distributed in the hope that it will be useful, but WITHOUT  *
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        *
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     *
* more details.                                                                *
*                                                                              *
* You should have received a copy of the GNU General Public License along with *
* this program. If not, see <http://www.gnu.org/licenses/>.                    *
*******************************************************************************/
#import <Foundation/Foundation.h>
#import "IECCResource.h"

/**
* This object represents a data type on any of the programming languages.
* 
* This class is abstract and should not be created by itself.
*/
@interface IECCDataType: NSObject
  - (instancetype)init;
@end

// Import generic data types
#include "types/IECCAny.h"
#include "types/IECCAnyBit.h"
#include "types/IECCAnyChar.h"
#include "types/IECCAnyChars.h"
#include "types/IECCAnyDate.h"
#include "types/IECCAnyDerived.h"
#include "types/IECCAnyDuration.h"
#include "types/IECCAnyElementary.h"
#include "types/IECCAnyInt.h"
#include "types/IECCAnyMagnitude.h"
#include "types/IECCAnyNum.h"
#include "types/IECCAnyReal.h"
#include "types/IECCAnySigned.h"
#include "types/IECCAnyString.h"
#include "types/IECCAnyUnsigned.h"

// Import elementary data types
#include "types/IECCBool.h"
#include "types/IECCByte.h"
#include "types/IECCChar.h"
#include "types/IECCDateAndTime.h"
#include "types/IECCDate.h"
#include "types/IECCDInt.h"
#include "types/IECCDWord.h"
#include "types/IECCInt.h"
#include "types/IECCLDateAndTime.h"
#include "types/IECCLInt.h"
#include "types/IECCLReal.h"
#include "types/IECCLTime.h"
#include "types/IECCLTimeOfDay.h"
#include "types/IECCLWord.h"
#include "types/IECCReal.h"
#include "types/IECCSInt.h"
#include "types/IECCString.h"
#include "types/IECCTime.h"
#include "types/IECCTimeOfDay.h"
#include "types/IECCUDInt.h"
#include "types/IECCUInt.h"
#include "types/IECCULInt.h"
#include "types/IECCUSInt.h"
#include "types/IECCWChar.h"
#include "types/IECCWord.h"
#include "types/IECCWString.h"

// Import derived data types
#include "types/IECCNamedType.h"
#include "types/IECCEnum.h"
#include "types/IECCFunctionBlock.h"
#include "types/IECCSubrange.h"
