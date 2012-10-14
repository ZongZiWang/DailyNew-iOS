//
//  DNAllViewController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNAllViewController.h"
#import "DNEventsData.h"
#import "DNEventCell.h"
#import "ActionSheetStringPicker.h"
#import "DNDetailViewController.h"

@interface DNAllViewController () <UITableViewDataSource, UITableViewDelegate> {
	BOOL isNibRegistered;
	NSDictionary *selectedEvent;
}

@property (strong, nonatomic) NSArray *events;
@property (strong, nonatomic) NSNumber *university_id;
@property (strong, nonatomic) NSNumber *category_id;
@property (strong, nonatomic) NSNumber *time_id;

@end

@implementation DNAllViewController

- (NSArray *)events
{
	if (_events == nil) {
		_events = [[DNEventsData shared] eventsByUniversityID:self.university_id categoryID:self.category_id timeID:self.time_id];
	}
	return _events;
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
	self.university_id = @1;
	self.category_id = @1;
	self.time_id = @1;
	isNibRegistered = NO;
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"全部" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *identifier = @"DNEventCell";
	if (!isNibRegistered) {
		UINib *nib = [UINib nibWithNibName:@"DNEventCell" bundle:nil];
		[tableView registerNib:nib forCellReuseIdentifier:identifier];
		isNibRegistered = YES;
	}
	DNEventCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	cell.titleLabel.text = [[self.events objectAtIndex:[indexPath row]] objectForKey:@"title"];
	cell.timeLabel.text = [[self.events objectAtIndex:[indexPath row]] objectForKey:@"time"];
	cell.locationLabel.text = [[self.events objectAtIndex:[indexPath row]] objectForKey:@"location"];
	cell.likeLabel.text = [NSString stringWithFormat:@"%@", [[self.events objectAtIndex:[indexPath row]] objectForKey:@"like"]];
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.events count];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
	return 1;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	selectedEvent = [self.events objectAtIndex:[indexPath row]];
	[self performSegueWithIdentifier:@"EventDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"EventDetail"]) {
		DNDetailViewController *destinationVC = (DNDetailViewController *)segue.destinationViewController;
		destinationVC.event = selectedEvent;
	}
}

- (IBAction)changeTime:(id)sender {
	ActionSheetStringPicker *changeTimePicker = [[ActionSheetStringPicker alloc] initWithTitle:@"选择时间" rows:[[DNEventsData shared] timeIntervalNames] initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		self.time_id = [[[[DNEventsData shared] timeIntervals] objectAtIndex:selectedIndex] objectForKey:@"id"];
		[self.timeButton setTitle:selectedValue forState:UIControlStateNormal];
		
		self.events = nil;
		[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender];
	[changeTimePicker showActionSheetPicker];
}
- (IBAction)changeCategory:(id)sender {
	ActionSheetStringPicker *categoryPicker = [[ActionSheetStringPicker alloc] initWithTitle:@"选择类别" rows:[[DNEventsData shared] categoryNames] initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		self.category_id = [[[[DNEventsData shared] categories] objectAtIndex:selectedIndex] objectForKey:@"id"];
		[self.categoryButton setTitle:selectedValue forState:UIControlStateNormal];
		
		self.events = nil;
		[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender];
	[categoryPicker showActionSheetPicker];
}
- (IBAction)changeUniversity:(id)sender {
	ActionSheetStringPicker *universityPicker = [[ActionSheetStringPicker alloc] initWithTitle:@"选择大学" rows:[[DNEventsData shared] universityNames] initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		self.university_id = [[[[DNEventsData shared] universities] objectAtIndex:selectedIndex] objectForKey:@"id"];
		[self.universityButton setTitle:selectedValue forState:UIControlStateNormal];
		
		self.events = nil;
		[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		
	} origin:sender];
	[universityPicker showActionSheetPicker];
}

- (void)viewDidUnload {
	[self setTimeButton:nil];
	[self setCategoryButton:nil];
	[self setUniversityButton:nil];
	[self setTableView:nil];
	[super viewDidUnload];
}
@end
