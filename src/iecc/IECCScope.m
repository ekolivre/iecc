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
      declaring_enum = NO;
      last_name = nil;
      last_value = @(0);
      enum_data = NSMutableDictionary.new;
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
  - (void)enterEnum {
    assert("Internal compiler error." && declaring_enum == NO);
    declaring_enum = YES;
  };
  
  //
  - (BOOL)insideEnum {
    return declaring_enum;
  };
  
  //
  - (void)pushEnumName: (NSString *)name {
    
    assert("Internal compiler error." && name);
    
    [self privateUpdateEnumData];
    
    last_name = name;
  };
  
  //
  - (void)pushEnumValue: (NSNumber *)number {
    assert("Internal compiler error." && declaring_enum);
    assert("Internal compiler error." && last_name);
    
    // Keep track of this value
    last_value = number;
    
    // If we've set manually a value, we are NOT in an enum
    is_enumeration = NO;
  };
  
  //
  - (void)privateUpdateEnumData {
    if(last_name) {
      assert("Internal compiler error." &&
        [enum_data objectForKey: last_name.uppercaseString] == nil);
      
      printf("Binding %s to value %s\n",
        last_name.uppercaseString.UTF8String,
        last_value.description.UTF8String);
      
      [enum_data setObject: last_value forKey: last_name.uppercaseString];
      
      last_name = nil;
      
      last_value = @(last_value.intValue + 1);
      
    };
  };
  
  //
  - (NSArray *)enumValue: (NSString *)name {
    
    [self privateUpdateEnumData];
    
    NSMutableArray *result = NSMutableArray.new.autorelease;
    
    if(declaring_enum) {
      NSNumber *current = [enum_data objectForKey: name.uppercaseString];
      if(current) {
        printf("We have found our key [%s]!\n", name.description.UTF8String);
        [result addObject: current];
      };
    };
    
    return result;
  };
  
  //
  - (IECCNamedType *)leaveEnum {
    
    assert(declaring_enum == YES);
    [self privateUpdateEnumData];
    
    IECCNamedType *result = nil;
    
    // The type will take care of freeing the dictionary, hopefully
    if(is_enumeration) {
      result = [IECCEnum.alloc initWithValues: enum_data];
    } else {
      result = [IECCNamedType.alloc initWithValues: enum_data];
    };
    
    declaring_enum = NO;
    is_enumeration = YES;
    enum_data = NSMutableDictionary.new;
    
    return result;
  };
  
  // Cleanup memory
  - (void)dealloc {
    [types autorelease];
    [enum_data autorelease];
    [super dealloc];
  };
@end
