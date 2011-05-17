//
//  NewsDataSource.m
//
//  Created by Nick Pack on 23/12/2010.
//  Copyright 2010 Nikki James Pack. All rights reserved.
//

#import "NewsDataSource.h"
#import "FeedModel.h"
#import "FeedItem.h"
#import <Three20Core/NSDateAdditions.h>
#import <Three20Core/NSStringAdditions.h>

@implementation NewsDataSource

- (id)initWithFeedUrl:(NSString*)feedUrl {
	if ((self = [super init])) {
		_feedModel = [[FeedModel alloc] initWithFeedUrl:feedUrl];
	}

	return self;
}

- (void)dealloc {
	TT_RELEASE_SAFELY(_feedModel);

	[super dealloc];
}

- (id<TTModel>)model {
	return _feedModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
	NSMutableArray* items = [[NSMutableArray alloc] init];

	for (FeedItem* item in _feedModel.items) {
		// Todo: change the image here with something better, check values so that we dont display (null)		
		NSString* body = [[item.description stringByRemovingHTMLTags] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		TTTableMessageItem* tableRow = [TTTableMessageItem itemWithTitle:item.title 
                                                                 caption:[NSString stringWithFormat:@"Posted by: %@",item.poster]
																	text:body 
                                                               timestamp:item.posted
																imageURL:@"bundle://idroid.png" URL:@"bl://viewfeeditem"];
		
        NSDictionary* rowInfo = [NSDictionary dictionaryWithObjectsAndKeys:
								 item.title,
								 @"title",
								 item.poster,
								 @"postedBy",
								 item.body,
								 @"articleBody",
								 item.posted,
								 @"timestamp",
								 item.link,
								 @"original",
								 nil];
		tableRow.userInfo = rowInfo;
		[items addObject:tableRow];
	}

	self.items = items;

	TT_RELEASE_SAFELY(items);
}

- (NSString *)titleForLoading:(BOOL)reloading {
    if (reloading) {
        return NSLocalizedString(@"Reloading news feed...",nil);
    } else {
        return NSLocalizedString(@"Loading news feed...",nil);
    }
}

- (NSString *)titleForEmpty {
    return NSLocalizedString(@"Apparently, there is no news!",nil);
}

- (NSString *)titleForError:(NSError *)error {
    return NSLocalizedString(@"An error occurred fetching the news feed.",nil);
}

@end
