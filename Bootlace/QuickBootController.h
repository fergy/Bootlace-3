//
//  QuickBootController.h
//  Bootlace
//
//  Created by Nick on 16/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@interface QuickBootController : TTViewController <TTLauncherViewDelegate, TTActionSheetControllerDelegate> {
    TTLauncherView* _launcherView;
}

-(void) getBootableOS;

@end
