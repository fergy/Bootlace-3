//
//  BLUtilities.h
//  Bootlace
//
//  Created by Neonkoala on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOKit/IOKitLib.h>
#import "BLGlobals.h"


@interface BLUtilities : NSObject {
    
}

- (int)getDevice;
- (NSString *)getSerial;
- (BOOL)checkBattery;

@end
