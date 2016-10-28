//
//  GraphQLicious.h
//  GraphQLicious
//
//  Created by Felix Dietz on 30/03/16.
//  Copyright © 2016 WeltN24. All rights reserved.
//

#ifdef __APPLE__
  #include "TargetConditionals.h"
  #if TARGET_OS_IPHONE
  // iOS
  #import <UIKit/UIKit.h>
  #elif TARGET_IPHONE_SIMULATOR
  // iOS Simulator
  #import <UIKit/UIKit.h>
  #elif TARGET_OS_MAC
  // Other kinds of Mac OS
  #include <Cocoa/Cocoa.h>
  #else
  // Unsupported platform
  #endif
#endif

//! Project version number for GraphQLicious.
FOUNDATION_EXPORT double GraphQLiciousVersionNumber;

//! Project version string for GraphQLicious.
FOUNDATION_EXPORT const unsigned char GraphQLiciousVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <GraphQLicious/PublicHeader.h>


