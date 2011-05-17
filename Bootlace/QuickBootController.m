//
//  QuickBootController.m
//  Bootlace
//
//  Created by Nick on 16/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuickBootController.h"


@implementation QuickBootController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        UIImage* image = [UIImage imageNamed:@"191-collection.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Quick Boot",nil) image:image tag:0] autorelease];
		self.title = NSLocalizedString(@"Quick Boot",nil);
		self.variableHeightRows = YES;
	}
    
	return self;
}

@end
