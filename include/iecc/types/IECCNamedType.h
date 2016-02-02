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
//
#import <Foundation/Foundation.h>

//
#ifndef __IECC_INCLUDE_IECC_TYPES_NAMED_TYPE_INCLUDE__
  #define __IECC_INCLUDE_IECC_TYPES_NAMED_TYPE_INCLUDE__
  #include "types/IECCAnyDerived.h"
  #include "types/IECCAnyElementary.h"
#endif

//
#ifndef __IECC_INCLUDE_IECC_TYPES_NAMED_TYPE_DEFINE__
  #ifdef __IECC_INCLUDE_IECC_TYPES_ANY_DERIVED_DEFINE__
    #ifdef __IECC_INCLUDE_IECC_TYPES_ANY_ELEMENTARY_DEFINE__
      #define __IECC_INCLUDE_IECC_TYPES_NAMED_TYPE_DEFINE__
      
      //
      @interface IECCNamedType: IECCAnyDerived<NSFastEnumeration>
        - (instancetype)initWithValues: (NSDictionary *)values; 
        - (void)setElementType: (IECCAnyElementary *)type;
      @end
    #endif
  #endif
#endif
