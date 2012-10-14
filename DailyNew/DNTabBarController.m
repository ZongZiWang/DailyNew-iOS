//
//  DNTabBarController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-14.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNTabBarController.h"
#import <QuartzCore/QuartzCore.h>

@interface DNTabBarController ()

@end

@implementation DNTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	UIImage *shadowImg = [UIImage imageNamed:@"tab_bg_shadow"];
    UIImageView *shadow_view = [[UIImageView alloc] initWithImage:shadowImg];
    shadow_view.frame = CGRectMake(0, -shadowImg.size.height, self.view.frame.size.width, shadowImg.size.height);
    shadow_view.layer.shadowOffset = CGSizeMake(0, -100);
    shadow_view.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.tabBar.clipsToBounds = NO;
    [self.tabBar addSubview:shadow_view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
