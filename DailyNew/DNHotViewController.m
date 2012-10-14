//
//  DNHotViewController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNHotViewController.h"
#import "Coffeepot.h"
#import "ActionSheetStringPicker.h"
#import "DNEventsData.h"
#import "DNDetailViewController.h"

@interface DNHotViewController () <iCarouselDelegate> {
	NSDictionary *selectedEvent;
}

@property (strong, nonatomic) NSArray *hotEvents;

@end

@implementation DNHotViewController

- (NSArray *)hotEvents
{
	if (_hotEvents == nil) {
		_hotEvents = [[DNEventsData shared] hotEventsByUniversityID:[[[DNEventsData shared] university] objectForKey:@"id"]];
	}
	return _hotEvents;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self.navigationController.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab_icon_selected_hot"] withFinishedUnselectedImage:[UIImage imageNamed:@"tab_icon_hot"]];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[self carouselCurrentItemIndexDidChange:self.carousel];
	self.navigationItem.title = [NSString stringWithFormat:@"一周热点@%@", [[[DNEventsData shared] university] objectForKey:@"name"]];
	self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"热点" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	NSNumber *carouselType = [[NSUserDefaults standardUserDefaults] objectForKey:@"display_type"];
	if (!carouselType) self.carousel.type = iCarouselTypeCoverFlow2;
	else self.carousel.type = [carouselType integerValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [self.hotEvents count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
		((UIImageView *)view).image = [[self.hotEvents objectAtIndex:index] objectForKey:@"poster"];
        if (!((UIImageView *)view).image) ((UIImageView *)view).image = [UIImage imageNamed:@"page"];
		view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:40];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
//    label.text = [[self.hotEvents objectAtIndex:index] objectForKey:@"title"];
    
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
	NSInteger index = [self.carousel currentItemIndex];
	self.titleLabel.text = [[self.hotEvents objectAtIndex:index] objectForKey:@"title"];
	self.timeLabel.text = [[self.hotEvents objectAtIndex:index] objectForKey:@"time"];
	self.locationLabel.text = [[self.hotEvents objectAtIndex:index] objectForKey:@"location"];
	self.likeLabel.text = [NSString stringWithFormat:@"%d人喜欢", [[[self.hotEvents objectAtIndex:index] objectForKey:@"like"] integerValue]];
	self.participateLabel.text = [NSString stringWithFormat:@"%d人参加", [[[self.hotEvents objectAtIndex:index] objectForKey:@"participate"] integerValue]];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
	selectedEvent = [self.hotEvents objectAtIndex:index];
	[self performSegueWithIdentifier:@"EventDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"EventDetail"]) {
		DNDetailViewController *destinationVC = (DNDetailViewController *)segue.destinationViewController;
		destinationVC.event = selectedEvent;
	}
}

#pragma mark - IBAction

- (IBAction)likeEvent:(id)sender {
	NSInteger index = self.carousel.currentItemIndex;
	[[self.hotEvents objectAtIndex:index] setObject:[NSNumber numberWithInteger:[[[self.hotEvents objectAtIndex:index] objectForKey:@"like"] integerValue] + 1] forKey:@"like"];
	
	self.likeLabel.text = [NSString stringWithFormat:@"%@", [[self.hotEvents objectAtIndex:index] objectForKey:@"like"]];
}

- (IBAction)changeUniversity:(id)sender {
	ActionSheetStringPicker *universityPicker =
	[[ActionSheetStringPicker alloc] initWithTitle:@"选择学校"
											  rows:[[DNEventsData shared] universityNames]
								  initialSelection:[[DNEventsData shared].universities indexOfObject:[[DNEventsData shared] university]]
										 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
											 
											 [[NSUserDefaults standardUserDefaults] setObject:[[[DNEventsData shared].universities objectAtIndex:selectedIndex] objectForKey:@"id"] forKey:@"university_id"];
											 [[NSUserDefaults standardUserDefaults] synchronize];
											 
											 [[DNEventsData shared] setUniversity:[[DNEventsData shared].universities objectAtIndex:selectedIndex]];
											 self.navigationItem.title = [NSString stringWithFormat:@"一周热点@%@", selectedValue];
											 
											 self.hotEvents = [[DNEventsData shared] hotEventsByUniversityID:[[[DNEventsData shared] university] objectForKey:@"id"]];
											 [self.carousel reloadData];
											 [self carouselCurrentItemIndexDidChange:self.carousel];
											 
										 }
									   cancelBlock:^(ActionSheetStringPicker *picker) {
										 
									   }
											origin:sender];
	
	[universityPicker showActionSheetPicker];
}

- (void)viewDidUnload {
	[self setParticipateLabel:nil];
	[super viewDidUnload];
}
@end
