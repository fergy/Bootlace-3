//
//  NewsDataSource.h
//
//  Created by Nick Pack on 23/12/2010.
//  Copyright 2010 Nikki James Pack. All rights reserved.
//

@class FeedModel;

@interface NewsDataSource : TTListDataSource {
	FeedModel* _feedModel;
}

- (id)initWithFeedUrl:(NSString*)feedUrl;

@end
