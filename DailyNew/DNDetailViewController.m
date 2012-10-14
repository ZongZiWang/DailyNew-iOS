//
//  DNDetailViewController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-14.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNDetailViewController.h"

@interface DNDetailViewController ()

@end

@implementation DNDetailViewController

- (void)setEvent:(NSDictionary *)event
{
	_event = event;
//	self.navigationItem.title = [event objectForKey:@"title"];
//	self.titleLabel.text = [event objectForKey:@"title"];
//	self.timeLabel.text = [event objectForKey:@"time"];
//	self.locationLabel.text = [event objectForKey:@"location"];
//	self.likeLabel.text = [NSString stringWithFormat:@"%@", [self.event objectForKey:@"like"]];
//	self.contentText.text = [event objectForKey:@"content"];
}

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
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.navigationItem.title = [self.event objectForKey:@"title"];
	self.titleLabel.text = [self.event objectForKey:@"title"];
	self.timeLabel.text = [self.event objectForKey:@"time"];
	self.locationLabel.text = [self.event objectForKey:@"location"];
	self.likeLabel.text = [NSString stringWithFormat:@"%@", [self.event objectForKey:@"like"]];
	self.contentText.text = [self.event objectForKey:@"content"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setContentText:nil];
	[self setPoster:nil];
    [super viewDidUnload];
}

@end