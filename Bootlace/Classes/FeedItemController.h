//
//  FeedItemController.h
//  Bootlace
//
//  Created by Nick Pack on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FeedItemController : TTTableViewController {
   NSDictionary* article; 
}

@property (nonatomic,retain) NSDictionary* article;

@end
