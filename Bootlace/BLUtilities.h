//
//  BLUtilities.h
//  Bootlace
//
//  Created by Neonkoala on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <sys/sysctl.h> // This shuts up a warning about sysctlbyname
#import <IOKit/IOKitLib.h>
#import "BLGlobals.h"


@interface BLUtilities : NSObject {
    
}

- (NSInteger)getDevice;
- (NSString *)getSerial;
- (BOOL)checkBattery;

@end
