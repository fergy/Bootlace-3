//
//  BLUtilities.m
//  Bootlace
//
//  Created by Neonkoala on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BLUtilities.h"


@implementation BLUtilities

- (NSString *)getDevice {
    
}

- (BOOL)checkBattery {
	[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
      
	return ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging || [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateFull);
}

@end
