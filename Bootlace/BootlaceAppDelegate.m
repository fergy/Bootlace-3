//
//  BootlaceAppDelegate.m
//  Bootlace
//
//  Created by Nick on 16/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BootlaceAppDelegate.h"
#import "BLStylesheet.h"
#import "TabBarController.h"
#import "InstallListController.h"
#import "QuickBootController.h"
#import "SettingsController.h"
#import "FeedItemController.h"
#import "BLGlobals.h"

@implementation BootlaceAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [TTStyleSheet setGlobalStyleSheet:[[[BLStylesheet alloc] init] autorelease]];
    TTNavigator* navigator = [TTNavigator navigator];
	navigator.persistenceMode = TTNavigatorPersistenceModeAll;
    
	TTURLMap* map = navigator.URLMap;
    
	[map from:@"*" toViewController:[TTWebController class]];
    [map from:@"bl://tabBar" toSharedViewController:[TabBarController class]];
    [map from:@"bl://installList" toSharedViewController:[InstallListController class]];
    [map from:@"bl://quickboot" toSharedViewController:[QuickBootController class]];
    [map from:@"bl://settings" toSharedViewController:[SettingsController class]];
    [map from:@"bl://viewfeeditem" toSharedViewController:[FeedItemController class]];
    
    // Check pre-requisites here - show wizard if compatible & firstrun, if incompatible show canhaznot screen, otherwise run the condition below
    BLGlobals *sharedGlobals = [BLGlobals sharedGlobals];
    
    sharedGlobals.deviceCompatible = [[NSUserDefaults standardUserDefaults] boolForKey:@"DeviceCompatible"];
    
    if(!NO) {
        //Do checks
    } else if([[NSUserDefaults standardUserDefaults] boolForKey:@"DeviceCompatible"] && [[NSUserDefaults standardUserDefaults] boolForKey:@"OldBootrom"]) {
        //Check kernel is still patched
    }
    
    if (![navigator restoreViewControllers]) {
		[navigator openURLAction:[TTURLAction actionWithURLPath:@"bl://tabBar"]];
	}
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [super dealloc];
}

@end
