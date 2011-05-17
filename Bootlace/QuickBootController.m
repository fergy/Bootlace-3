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
	}
    
	return self;
}
/**
 * Enumerate /boot/menu.lst or whatever to populate the launcher
 */
-(void) getBootableOS {
    _launcherView.pages = [NSArray arrayWithObjects:
                           [NSArray arrayWithObjects:
                            [[[TTLauncherItem alloc] initWithTitle:@"Pepparkaka 11.04"
                                                             image:@"bundle://idroid.png"
                                                               URL:@"bl://os" canDelete:YES] autorelease],
                            [[[TTLauncherItem alloc] initWithTitle:@"MoJo 1.0.2"
                                                             image:@"bundle://idroid.png"
                                                               URL:@"bl://os" canDelete:YES] autorelease],
                            [[[TTLauncherItem alloc] initWithTitle:@"iX SHR"
                                                             image:@"bundle://ix.png"
                                                               URL:@"bl://os" canDelete:YES] autorelease],
                            nil],
                           nil];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController

- (void)loadView {
	[super loadView];
	_launcherView = [[TTLauncherView alloc] initWithFrame:self.view.bounds];
	_launcherView.backgroundColor = [UIColor clearColor];
	_launcherView.delegate = self;
    [self getBootableOS];
	[self.view addSubview:_launcherView];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTLauncherViewDelegate
/**
 * Boot the selected OS
 */
- (void)launcherView:(TTLauncherView*)launcher didSelectItem:(TTLauncherItem*)item {
	
}


@end
