//
//  DNAppDelegate.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNAppDelegate.h"

#define ColorTheme1 [UIColor colorWithRed:52/255.0 green:162/255.0 blue:232/255.0 alpha:1.0]
#define ColorTheme2 [UIColor colorWithRed:234/255.0 green:152/255.0 blue:0/255.0 alpha:1.0]

@implementation DNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation_bg"] forBarMetrics:UIBarMetricsDefault];
    
	NSDictionary *navBarTitleTextAttributes = @{ UITextAttributeFont : [UIFont fontWithName:@"STHeitiSC-Medium" size:20], UITextAttributeTextColor : ColorTheme1, UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, -1)] };
	[[UINavigationBar appearance] setTitleTextAttributes:navBarTitleTextAttributes];
	
	[[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab_bg"]];
	[[UITabBar appearance] setSelectionIndicatorImage:[[UIImage imageNamed:@"tab_button_selected_bg+light"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 0, 10, 0)]];

	[[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundImage:[[UIImage imageNamed:@"navigation_button"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundImage:[[UIImage imageNamed:@"navigation_button_pressed"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	[[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackButtonBackgroundImage:[[UIImage imageNamed:@"navigation_button_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setBackButtonBackgroundImage:[[UIImage imageNamed:@"navigation_button_back_pressed"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	[[UISegmentedControl appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundImage:[[UIImage imageNamed:@"navigation_button"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[[UISegmentedControl appearanceWhenContainedIn:[UINavigationBar class], nil] setBackgroundImage:[[UIImage imageNamed:@"navigation_button_pressed"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	[[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateHighlighted rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	[[UISegmentedControl appearance] setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateHighlighted rightSegmentState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	NSDictionary *tabBarTitleTextAttributes = @{ UITextAttributeFont : [UIFont fontWithName:@"STHeitiSC-Medium" size:11], UITextAttributeTextColor : ColorTheme1, UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, -1)] };
	[[UITabBarItem appearance] setTitleTextAttributes:tabBarTitleTextAttributes forState:UIControlStateNormal];
	NSDictionary *tabBarHighlightedTitleTextAttributes = @{ UITextAttributeFont : [UIFont fontWithName:@"STHeitiSC-Medium" size:11], UITextAttributeTextColor : ColorTheme2, UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, -1)] };
	[[UITabBarItem appearance] setTitleTextAttributes:tabBarHighlightedTitleTextAttributes forState:UIControlStateHighlighted];
	
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
