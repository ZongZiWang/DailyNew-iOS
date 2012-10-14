//
//  DNNavigationController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-14.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNNavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface DNNavigationController ()

@end

@implementation DNNavigationController

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
	UIImage *shadowImg = [UIImage imageNamed:@"navigation_bg_shadow"];
    UIImageView *shadow_view = [[UIImageView alloc] initWithImage:shadowImg];
    shadow_view.frame = CGRectMake(0, 44, self.view.frame.size.width, shadowImg.size.height);
    shadow_view.layer.shadowOffset = CGSizeMake(0, 100);
    shadow_view.layer.shadowColor = [[UIColor blackColor] CGColor];
    
	UIImage *lightImg = [UIImage imageNamed:@"light"];
    UIImageView *light_view = [[UIImageView alloc] initWithImage:lightImg];
    light_view.frame = CGRectMake(0, 44, self.view.frame.size.width, lightImg.size.height);
    light_view.layer.shadowOffset = CGSizeMake(0, 100);
    light_view.layer.shadowColor = [[UIColor blackColor] CGColor];
    
	self.navigationBar.clipsToBounds = NO;
    [self.navigationBar addSubview:shadow_view];
	[self.navigationBar addSubview:light_view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
