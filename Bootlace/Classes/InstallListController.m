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
    self.dataSource = [[TTSectionedDataSource alloc] init];
}


- (void)tabBar:(TTTabBar*)tabBar tabSelected:(NSInteger)selectedIndex {
    [self invalidateModel];
    switch (selectedIndex) {
        case 0:
            self.title = NSLocalizedString(@"Packages",nil);
            break;
        case 1:
            // Change this url to point to the news feed that we havent set up yet
            self.title = NSLocalizedString(@"News",nil);
            self.dataSource = [[[NewsDataSource alloc] initWithFeedUrl:@"http://www.idroidproject.org/forum/.xml/?type=rss"] autorelease];
            break;
        case 2:
            self.title = NSLocalizedString(@"Changelogs",nil);
            break;
    }
}

@end
