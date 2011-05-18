//
//  BLGlobals.h
//  Bootlace
//
//  Created by Neonkoala on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SynthesizeSingleton.h"
#import "BLDeviceType.h"

@interface BLGlobals : NSObject {
    
    //Compatibility vars
    BOOL deviceCompatible;
    BOOL oldBootrom;
    
    NSString *device;
    NSString *deviceName;
    BLDeviceType deviceType;
}

+ (BLGlobals *)sharedBLGlobals;

@property (nonatomic, assign) BOOL deviceCompatible;
@property (nonatomic, assign) BOOL oldBootrom;

@property (nonatomic, retain) NSString *device;
@property (nonatomic, retain) NSString *deviceName;
@property (nonatomic, assign) BLDeviceType deviceType;

@end
