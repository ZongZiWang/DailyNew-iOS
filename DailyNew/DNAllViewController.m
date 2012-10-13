//
//  DNAllViewController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNAllViewController.h"
#import "DNEventsData.h"
#import "ActionSheetStringPicker.h"

@interface DNAllViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation DNAllViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
	return 0;
}
- (IBAction)changeTime:(id)sender {
	ActionSheetStringPicker *changeTimePicker = [[ActionSheetStringPicker alloc] initWithTitle:@"选择时间" rows:[[DNEventsData shared] timeIntervalNames] initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[self.timeButton setTitle:selectedValue forState:UIControlStateNormal];
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender];
	[changeTimePicker showActionSheetPicker];
}
- (IBAction)changeCategory:(id)sender {
	ActionSheetStringPicker *categoryPicker = [[ActionSheetStringPicker alloc] initWithTitle:@"选择类别" rows:[[DNEventsData shared] categoryNames] initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[self.categoryButton setTitle:selectedValue forState:UIControlStateNormal];
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender];
	[categoryPicker showActionSheetPicker];
}
- (IBAction)changeUniversity:(id)sender {
	ActionSheetStringPicker *universityPicker = [[ActionSheetStringPicker alloc] initWithTitle:@"选择大学" rows:[[DNEventsData shared] universityNames] initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[self.universityButton setTitle:selectedValue forState:UIControlStateNormal];
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender];
	[universityPicker showActionSheetPicker];
}

- (void)viewDidUnload {
	[self setTimeButton:nil];
	[self setCategoryButton:nil];
	[self setUniversityButton:nil];
	[super viewDidUnload];
}
@end
