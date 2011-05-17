//
//  InstallListController.m
//  Bootlace
//
//  Created by Nick on 16/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstallListController.h"


@implementation InstallListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        UIImage* image = [UIImage imageNamed:@"191-collection.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Install",nil) image:image tag:0] autorelease];
		self.title = NSLocalizedString(@"Install",nil);
		self.variableHeightRows = YES;
	}
    
	return self;
}

-(void) viewDidLoad:(BOOL)animated {
    
}

@end
