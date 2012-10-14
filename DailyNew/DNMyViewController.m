//
//  DNMyViewController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-14.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNMyViewController.h"
#import "DNEventCell.h"
#import "DNEventsData.h"
#import "DNDetailViewController.h"

@interface DNMyViewController () {
	BOOL likeOrParticipate;
	BOOL isNibRegistered;
	NSDictionary *selectedEvent;
}

@property (strong, nonatomic) NSArray *myLikeEvents;
@property (strong, nonatomic) NSArray *myParticipateEvents;

@end

@implementation DNMyViewController

- (NSArray *)myLikeEvents
{
	if (!_myLikeEvents) {
		_myLikeEvents = [[DNEventsData shared] myLikeEvents];
	}
	return _myLikeEvents;
}

- (NSArray *)myParticipateEvents
{
	if (!_myParticipateEvents) {
		_myParticipateEvents = [[DNEventsData shared] myParticipateEvents];
	}
	return _myParticipateEvents;
}

- (NSArray *)events
{
	if (likeOrParticipate) return self.myLikeEvents;
	else return self.myParticipateEvents;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self.navigationController.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab_icon_selected_mine"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab_icon_mine"]];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	likeOrParticipate = YES;
	isNibRegistered = NO;
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我的" style:UIBarButtonItemStyleBordered target:nil action:nil];
	self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.events count];
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
	cell.poster.image = [[self.events objectAtIndex:[indexPath row]] objectForKey:@"poster"];
	cell.titleLabel.text = [[self.events objectAtIndex:[indexPath row]] objectForKey:@"title"];
	cell.timeLabel.text = [[self.events objectAtIndex:[indexPath row]] objectForKey:@"time"];
	cell.locationLabel.text = [[self.events objectAtIndex:[indexPath row]] objectForKey:@"location"];
	cell.likeLabel.text = [NSString stringWithFormat:@"%d人喜欢", [[[self.events objectAtIndex:[indexPath row]] objectForKey:@"like"] integerValue]];
	cell.participateLabel.text = [NSString stringWithFormat:@"%d人参加", [[[self.events objectAtIndex:[indexPath row]] objectForKey:@"participate"] integerValue]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 160;
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

- (IBAction)onLikeOrParticipateValueChanged:(UISegmentedControl *)sender {
	likeOrParticipate = [sender selectedSegmentIndex] == 0;
	[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
