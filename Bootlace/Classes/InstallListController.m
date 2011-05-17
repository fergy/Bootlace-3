//
//  InstallListController.m
//  Bootlace
//
//  Created by Nick on 16/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InstallListController.h"
#import "NewsDataSource.h"
#import "TTTableViewDelegate+URLAdditions.h"

static NSString* kLoremIpsum = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud\
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

@implementation InstallListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        UIImage* image = [UIImage imageNamed:@"191-collection.png"];
        self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"Packages",nil) image:image tag:0] autorelease];
		self.title = NSLocalizedString(@"Packages",nil);
		self.variableHeightRows = YES;
        CGRect applicationFrame = [UIScreen mainScreen].applicationFrame;
        _listTabs = [[TTTabStrip alloc] initWithFrame:CGRectMake(0, _listTabs.bottom, applicationFrame.size.width, 40)];
        _listTabs.tabItems = [NSArray arrayWithObjects:
                                [[[TTTabItem alloc] initWithTitle:NSLocalizedString(@"Install",nil)] autorelease],
                                [[[TTTabItem alloc] initWithTitle:NSLocalizedString(@"News",nil)] autorelease],
                                [[[TTTabItem alloc] initWithTitle:NSLocalizedString(@"Changelogs",nil)] autorelease],
                                [[[TTTabItem alloc] initWithTitle:NSLocalizedString(@"Something Else",nil)] autorelease],
                                nil];
        _listTabs.delegate = self;
        _listTabs.contentMode = UIViewContentModeScaleToFill;
        self.tableView.tableHeaderView = _listTabs;
	}
    
	return self;
}

-(void) viewDidLoad {
}

- (id<UITableViewDelegate>)createDelegate {
    return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)createModel {
    //self.dataSource = [[[OSDataSource alloc] initWithDevice:@"iPhone1,2"] autorelease];
    
    self.dataSource = [TTSectionedDataSource dataSourceWithObjects:
                       @"iDroid",
                       [TTTableMessageItem itemWithTitle:@"Pepparkaka 11.04" caption:@"Android 2.3.2"
                                                    text:kLoremIpsum timestamp:[NSDate date]
                                                imageURL:@"bundle://idroid.png" URL:@"tt://tableItemTest"],
                       [TTTableMessageItem itemWithTitle:@"MoJo 1.0.4" caption:@"Android 2.2.3"
                                                    text:kLoremIpsum timestamp:[NSDate date]
                                                imageURL:@"bundle://idroid.png" URL:@"tt://tableItemTest"],
                       @"iX",
                       [TTTableMessageItem itemWithTitle:@"iX SHR" caption:@"SHR something"
                                                    text:kLoremIpsum timestamp:[NSDate date]
                                                imageURL:@"bundle://ix.png" URL:@"tt://tableItemTest"],
                       @"OpeniBoot",
                       [TTTableMessageItem itemWithTitle:@"OpeniBoot" caption:@"v0.3"
                                                    text:kLoremIpsum timestamp:[NSDate date]
                                                imageURL:@"bundle://ix.png" URL:@"tt://tableItemTest"],
                       nil];
}


- (void)tabBar:(TTTabBar*)tabBar tabSelected:(NSInteger)selectedIndex {
    [self invalidateModel];
    switch (selectedIndex) {
        case 0:
            self.title = NSLocalizedString(@"Packages",nil);
            break;
        case 1:
            // Change this url to point to the news feed that we havent set up yet - irrelevant one here solely because it is well formed (or at least enough for my code to work!)
            self.title = NSLocalizedString(@"News",nil);
            self.dataSource = [[[NewsDataSource alloc] initWithFeedUrl:@"http://app.thenursewholovedme.com/feed.xml"] autorelease];
            break;
        case 2:
            self.title = NSLocalizedString(@"Changelogs",nil);
            break;
    }
}

@end
