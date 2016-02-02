/*******************************************************************************
* Project: IECC (IEC 61131-3 Languages Compiler for Arduino).                  *
* Authors: Paulo H. Torrens <paulotorrens AT gnu DOT org>.                     *
* License: GNU GPLv3+.                                                         *
*                                                                              *
* Language: (Legacy) Objective-C.                                              *
* Description:                                                                 *
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
#pragma once
#import <Foundation/Foundation.h>
#import "IECCDataType.h"
#import "IECCScope.h"

/**
 * This class controls name binding throughout a source file.
 *
 * This class can keep track of type and variable declarations in order to
 * know which names are already known and to easely retrieve a declared entity.
 *
 * It also works as The Lexer Hack (http://en.wikipedia.org/wiki/The_lexer_hack)
 * which is needed to parse correctly our languages given the grammar specified
 * by the standard.
 */
@interface IECCBinder: NSObject {
    // Private share
    @private
      IECCScope *scope;
  };
  
  /**
   *
   */
  - (instancetype)init;
  
  /**
   *
   */
  - (IECCDataType *)declareType: (NSString *)name
                             as: (IECCDataType *)type
                         atLine: (int)line;
  
  /**
   *
   */
  - (__weak IECCDataType *)type: (NSString *)name;
  
  //
  - (void)enterEnum;
  
  //
  - (BOOL)insideEnum;
  
  //
  - (void)seemEnumName: (NSString *)name;
  
  //
  - (void)seemEnumValue: (NSNumber *)number;
  
  //
  - (NSArray *)enumValue: (NSString *)name;
  
  //
  - (IECCNamedType *)leaveEnum;
  
  /**
   *
   */
  - (void)dealloc;
@end
