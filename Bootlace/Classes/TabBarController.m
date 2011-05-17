//
//  TabBarController.m
//  Bootlace
//
//  Created by Nick on 16/05/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TabBarController.h"

@implementation TabBarController

- (void)viewDidLoad {
    [self addCenterButtonWithImage:[UIImage imageNamed:@"centerbutton.png"] highlightImage:[UIImage imageNamed:@"centerbuttonon.png"]];
    [self setTabURLs:[NSArray arrayWithObjects:
                                                @"bl://installList",
                                                @"bl://quickboot",
                                                @"http://www.idroidproject.org",
                      nil]];
}

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateSelected | UIControlStateHighlighted];
    [button addTarget:self action:@selector(quickBoot:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}

-(void) quickBoot:(id) sender {
    [[TTNavigator navigator] openURLAction:[[TTURLAction actionWithURLPath:@"bl://quickboot"] applyAnimated:YES]];
}

@end
