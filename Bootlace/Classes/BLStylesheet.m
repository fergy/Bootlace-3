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
	return RGBCOLOR(44, 44, 44);
}

-(UIColor*)tabBarTintColor {
	return RGBCOLOR(72,72,72);
}

/*- (UIFont*)font {
	return [UIFont fontWithName:@"AmericanTypewriter" size:14];
}*/

- (UIColor*)toolbarTintColor {
	return RGBCOLOR(72,72,72);
}

- (UIColor*)tableHeaderTintColor {
	return RGBCOLOR(72,72,72);
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
