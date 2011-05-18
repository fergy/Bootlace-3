//
//  SettingsController.m
//  Bootlace
//
//  Created by Nick on 16/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsController.h"

@implementation SettingsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        UIImage* image = [UIImage imageNamed:@"158-wrench-2.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Settings",nil) image:image tag:0] autorelease];
		self.title = NSLocalizedString(@"Settings",nil);
		self.variableHeightRows = YES;
	}
    
	return self;
}

@end
