//
//  BLUtilities.h
//  Bootlace
//
//  Created by Neonkoala on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <sys/sysctl.h> // This shuts up a warning about sysctlbyname
#import <sys/mount.h>
#import <sys/param.h>
#import <sys/types.h>
#import <sys/reboot.h>
#import <sys/sysctl.h>
#import <unistd.h>
#import <notify.h>
#import <dlfcn.h>
#import <IOKit/IOKitLib.h>
#import "BLGlobals.h"


@interface BLUtilities : NSObject {
    
}

- (NSInteger)getDevice;
- (NSString *)getSerial;
- (float)getFirmwareVersion;
- (BOOL)checkBattery;
- (void)toggleAirplaneMode;


@end
