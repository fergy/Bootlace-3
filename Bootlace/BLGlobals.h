//
//  BLGlobals.h
//  Bootlace
//
//  Created by Neonkoala on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"


@interface BLGlobals : NSObject {
    
    //Compatibility vars
    bool deviceCompatible;
    bool oldBootrom;
    
    NSString *device;
}

+ (BLGlobals *)sharedBLGlobals;

@property (nonatomic, assign) bool deviceCompatible;
@property (nonatomic, assign) bool oldBootrom;

@property (nonatomic, retain) NSString *device;

@end
