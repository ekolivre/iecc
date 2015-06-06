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
#ifndef __IECC_INCLUDE_IECC_TYPES_DATE_AND_TIME_INCLUDE__
  #define __IECC_INCLUDE_IECC_TYPES_DATE_AND_TIME_INCLUDE__
  #include "types/IECCAnyDate.h"
#endif

//
#ifndef __IECC_INCLUDE_IECC_TYPES_DATE_AND_TIME_DEFINE__
  #ifdef __IECC_INCLUDE_IECC_TYPES_ANY_DATE_DEFINE__
    #define __IECC_INCLUDE_IECC_TYPES_DATE_AND_TIME_DEFINE__
    
    //
    @interface IECCDateAndTime: IECCAnyDate
      
    @end
  #endif
#endif
