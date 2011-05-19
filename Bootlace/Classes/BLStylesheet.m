//
//  BLStylesheet.m
//  Bootlace
//
//  Created by Nick Pack on 17/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BLStylesheet.h"


@implementation BLStylesheet

- (UIColor*)navigationBarTintColor {
	return RGBCOLOR(69, 83, 114);
}

-(UIColor*)tabBarTintColor {
	return RGBCOLOR(69, 83, 114);
}

/*- (UIFont*)font {
	return [UIFont fontWithName:@"AmericanTypewriter" size:14];
}*/

- (UIColor*)toolbarTintColor {
	return RGBCOLOR(69, 83, 114);
}

- (UIColor*)tableHeaderTintColor {
	return RGBCOLOR(69, 83, 114);
}

- (UIColor*)tableHeaderTextColor {
	return [UIColor whiteColor];
}

- (UIColor*)tableSubTextColor {
	return [UIColor grayColor];
}

- (UITableViewCellSelectionStyle)tableSelectionStyle {
	return UITableViewCellSelectionStyleGray;
}


@end
