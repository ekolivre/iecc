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
#import "IECCBinder.h"
// Header made by Bison:
#import "./Parser.tmp.h"

//
@implementation IECCBinder
  // Init our object
  - (instancetype)init {
    if((self = super.init)) {
      // Setup variables
      scope = IECCScope.new;
    };
    
    // As always...
    return self;
  };
  
  //
  - (IECCDataType *)declareType: (NSString *)name
                             as: (IECCDataType *)type
                         atLine: (int)line
  {
    return [scope declareType: name as: type atLine: line];
  };
  
  //
  - (__weak IECCDataType *)type: (NSString *)name {
    return [scope type: name];
  };
  
  //
  - (void)setEnumValue: (NSString *)name to: (NSNumber *)value {
    [scope setEnumValue: name to: value];
  };
  
  //
  - (NSArray *)enumValue: (NSString *)name {
    assert("Internal compiler error." && name);
    return [scope enumValue: name];
  };
  
  //
  - (IECCNamedType *)leaveEnum {
    return scope.leaveEnum;
  };
  
  // Cleanup memory
  - (void)dealloc {
    [scope autorelease];
    [super dealloc];
  };
@end
