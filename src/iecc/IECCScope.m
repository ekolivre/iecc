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
#import "IECCScope.h"

//
@implementation IECCScope
  // Init our object
  - (instancetype)init {
    if((self = super.init)) {
      // Setup variables
      types = NSMutableDictionary.new;
      enum_data = NSMutableDictionary.new;
      last_value = @(0);
      is_enumeration = YES;
    };
    
    // As always...
    return self;
  };
  
  //
  - (IECCDataType *)declareType: (NSString *)name
                             as: (IECCDataType *)type
                         atLine: (int)line
  {
    assert("Internal compiler error." && name && type);
    assert("Internal compiler error." &&
      [type isKindOfClass: IECCDataType.class]);
    [types setObject: @[type, @(line)] forKey: name.uppercaseString];
    return type;
  };
  
  //
  - (__weak IECCDataType *)type: (NSString *)name {
    id obj = [[types objectForKey: name.uppercaseString]
               objectAtIndex: 0
             ];
    
    if([obj isKindOfClass: IECCDataType.class]) {
      return obj;
    };
    
    return nil;
  };
  
  //
  - (void)setEnumValue: (NSString *)name to: (NSNumber *)value {
    
    if(value) {
      last_value = value;
    };
    
    [enum_data setObject: last_value forKey: name.uppercaseString];
    
    last_value = @(last_value.intValue + 1);
    
  };
  
  //
  - (NSArray *)enumValue: (NSString *)name {
    
    //~ [self privateUpdateEnumData];
    
    NSMutableArray *result = NSMutableArray.new.autorelease;
    
    NSNumber *current = [enum_data objectForKey: name.uppercaseString];
    if(current) {
      [result addObject: current];
    };
    
    return result;
  };
  
  //
  - (IECCNamedType *)leaveEnum {
    
    //~ assert(declaring_enum == YES);
    //~ [self privateUpdateEnumData];
    
    IECCNamedType *result = nil;
    
    // The type will take care of freeing the dictionary, hopefully
    if(is_enumeration) {
      result = [IECCEnum.alloc initWithValues: enum_data];
    } else {
      result = [IECCNamedType.alloc initWithValues: enum_data];
    };
    
    is_enumeration = YES;
    enum_data = NSMutableDictionary.new;
    last_value = @(0);
    
    return result;
  };
  
  // Cleanup memory
  - (void)dealloc {
    [types autorelease];
    [enum_data autorelease];
    [super dealloc];
  };
@end
