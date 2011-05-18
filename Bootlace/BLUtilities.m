//
//  BLUtilities.m
//  Bootlace
//
//  Created by Neonkoala on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BLUtilities.h"


@implementation BLUtilities

- (NSInteger)getDevice {
    BLGlobals *sharedBLGlobals = [BLGlobals sharedBLGlobals];
	
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    sharedBLGlobals.device = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
	
	ALog(@"Device: %@", sharedBLGlobals.device);
	
	/* Catch simulator */
	if ([sharedBLGlobals.device isEqualToString:@"x86_64"] || [sharedBLGlobals.device isEqualToString:@"i386"]) {
		sharedBLGlobals.device = @"iPhone1,2";
        sharedBLGlobals.deviceName = @"iOS Simulator";
	}
    
    /* Device ID */
	if([sharedBLGlobals.device isEqualToString:@"iPhone1,1"]) {
		sharedBLGlobals.deviceName = @"iPhone";
        sharedBLGlobals.deviceType = IPHONE1_1;
	} else if([sharedBLGlobals.device isEqualToString:@"iPhone1,2"]) {
		sharedBLGlobals.deviceName = @"iPhone 3G";
        sharedBLGlobals.deviceType = IPHONE1_2;
    } else if([sharedBLGlobals.device isEqualToString:@"iPhone2,1"]) {
		sharedBLGlobals.deviceName = @"iPhone 3GS";
        sharedBLGlobals.deviceType = IPHONE2_1;
    } else if([sharedBLGlobals.device isEqualToString:@"iPhone3,1"]) {
		sharedBLGlobals.deviceName = @"iPhone 4 (GSM)";
        sharedBLGlobals.deviceType = IPHONE3_1;
    } else if([sharedBLGlobals.device isEqualToString:@"iPhone3,3"]) {
		sharedBLGlobals.deviceName = @"iPhone 4 (CDMA)";
        sharedBLGlobals.deviceType = IPHONE3_3;
	} else if([sharedBLGlobals.device isEqualToString:@"iPod1,1"]) {
		sharedBLGlobals.deviceName = @"iPod Touch";
        sharedBLGlobals.deviceType = IPOD1_1;
	} else if([sharedBLGlobals.device isEqualToString:@"iPod2,1"]) {
		sharedBLGlobals.deviceName = @"iPod Touch (2G)";
        sharedBLGlobals.deviceType = IPOD2_1;
    } else if([sharedBLGlobals.device isEqualToString:@"iPod3,1"]) {
		sharedBLGlobals.deviceName = @"iPod Touch (3G)";
        sharedBLGlobals.deviceType = IPOD3_1;
    } else if([sharedBLGlobals.device isEqualToString:@"iPod4,1"]) {
		sharedBLGlobals.deviceName = @"iPod Touch (4G)";
        sharedBLGlobals.deviceType = IPOD4_1;
    } else if([sharedBLGlobals.device isEqualToString:@"iPad1,1"]) {
		sharedBLGlobals.deviceName = @"iPad";
        sharedBLGlobals.deviceType = IPAD1_1;
    } else if([sharedBLGlobals.device isEqualToString:@"iPad1,1"]) {
		sharedBLGlobals.deviceName = @"iPad 2 (WiFi)";
        sharedBLGlobals.deviceType = IPAD2_1;
    } else if([sharedBLGlobals.device isEqualToString:@"iPad1,1"]) {
		sharedBLGlobals.deviceName = @"iPad 2 (GSM)";
        sharedBLGlobals.deviceType = IPAD2_2;
    } else if([sharedBLGlobals.device isEqualToString:@"iPad1,1"]) {
		sharedBLGlobals.deviceName = @"iPad 2 (CDMA)";
        sharedBLGlobals.deviceType = IPAD2_3;
    } else if([sharedBLGlobals.device isEqualToString:@"iPad1,1"]) {
		sharedBLGlobals.deviceName = @"iPad 2 (CDMA)";
        sharedBLGlobals.deviceType = IPAD2_3;
    } else if([sharedBLGlobals.device isEqualToString:@"AppleTV2,1"]) {
		sharedBLGlobals.deviceName = @"Apple TV (2G)";
        sharedBLGlobals.deviceType = ATV2_1;
	} else {
		sharedBLGlobals.deviceName = @"Unknown Device";
	}
    
    return 0;
}

- (NSString *)getSerial {
    //BLGlobals *sharedBLGlobals = [BLGlobals sharedBLGlobals];
    
    NSString *serial;
    
    kern_return_t   kr;
	io_iterator_t   io_objects;
	io_service_t    io_service;
	
	//CFMutableDictionaryRef child_props;
	CFMutableDictionaryRef service_properties;
	
	kr = IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"), &io_objects);
	
	if(kr != KERN_SUCCESS)
		return nil;
	
	while((io_service= IOIteratorNext(io_objects)))
	{
		kr = IORegistryEntryCreateCFProperties(io_service, &service_properties, kCFAllocatorDefault, kNilOptions);
		if(kr == KERN_SUCCESS)
		{
			NSDictionary *deviceProps = (NSDictionary *)service_properties;
            
            //Extract Serial
            serial = [deviceProps objectForKey:@"serial-number"];
            NSLog(@"Serial: %@", serial);
            
            CFRelease(service_properties);
		}
		IOObjectRelease(io_service);
	}
	IOObjectRelease(io_objects);
    
    return serial;
}

- (BOOL)checkBattery {
	[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
      
	return ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging || [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateFull);
}

@end
