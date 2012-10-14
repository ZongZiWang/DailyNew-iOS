//
//  DNAppDelegate.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNAppDelegate.h"

@implementation DNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	[[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation_bg"] forBarMetrics:UIBarMetricsDefault];
    
	NSDictionary *titleTextAttributes = @{ UITextAttributeFont : [UIFont fontWithName:@"STHeitiSC-Medium" size:20], UITextAttributeTextColor : [UIColor colorWithRed:52/255.0 green:162/255.0 blue:232/255.0 alpha:1.0], UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, -1)] };
	[[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
	
	[[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab_bg"]];
	[[UITabBar appearance] setSelectionIndicatorImage:[[UIImage imageNamed:@"tab_button_selected_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 49, 5)]];

	[[UIBarButtonItem appearance] setBackgroundImage:[[UIImage imageNamed:@"navigation_button"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
	[[UIBarButtonItem appearance] setBackgroundImage:[[UIImage imageNamed:@"navigation_button_pressed"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
	
	[[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor colorWithRed:52/255.0 green:162/255.0 blue:232/255.0 alpha:1.0], UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0, -1)]}];
	
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
