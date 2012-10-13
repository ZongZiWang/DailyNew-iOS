//
//  DNPreferencesViewController.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNPreferencesViewController.h"
#import "ActionSheetStringPicker.h"

@interface DNPreferencesViewController ()

@property (strong, nonatomic) NSArray *notificationTimes;
@property (strong, nonatomic) NSArray *displayTypes;

@end

@implementation DNPreferencesViewController

#pragma mark - Setter and Getter Methods

- (void)setQuickDialogTableView:(QuickDialogTableView *)aQuickDialogTableView {
    [super setQuickDialogTableView:aQuickDialogTableView];
	[self.quickDialogTableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-TableView"]]];
}

#pragma mark - View Lifecycle

- (id)init
{
	self = [super init];
	if (self) {
		[self _init];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self _init];
	}
	return self;
}

- (void)_init
{
	self.root = [[QRootElement alloc] init];
	self.root.title = @"偏好设置";
	self.root.grouped = YES;
	
	self.notificationTimes = @[@"提前10分钟", @"提前1小时", @"提前一天", @"提前一周"];
	self.displayTypes = @[@"线性", @"旋转", @"反向旋转", @"圆柱", @"反向圆柱", @"轮盘", @"反向轮盘", @"CoverFlow类型一", @"CoverFlow类型二", @"时光机", @"反向时光机"];
	
	QSection *userInfoSection = [[QSection alloc] init];
	[self.root addSection:userInfoSection];
	
	QLabelElement *usernameLabel = [[QLabelElement alloc] initWithTitle:@"用户名" Value:@"三日初创"];
	[userInfoSection addElement:usernameLabel];
	
	QLabelElement *weiboLabel = [[QLabelElement alloc] initWithTitle:@"微博绑定" Value:@"3DayStartup"];
	[userInfoSection addElement:weiboLabel];
	
	QSection *settingsLabel = [[QSection alloc] init];
	[self.root addSection:settingsLabel];
	
	QLabelElement *notifiyLabel = [[QLabelElement alloc] initWithTitle:@"活动提醒" Value:[self.notificationTimes objectAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:@"notification_time"]]];
	[settingsLabel addElement:notifiyLabel];
	notifiyLabel.controllerAction = @"changeNotificationTime:";
	
	QLabelElement *displayLabel = [[QLabelElement alloc] initWithTitle:@"首页显示" Value:[self.displayTypes objectAtIndex:[[NSUserDefaults standardUserDefaults] integerForKey:@"display_type"]]];
	[settingsLabel addElement:displayLabel];
	displayLabel.controllerAction = @"changeDisplayType:";
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

- (void)changeNotificationTime:(id)sender
{
	ActionSheetStringPicker *notificationTimePicker = [[ActionSheetStringPicker alloc] initWithTitle:@"修改提醒时间" rows:self.notificationTimes initialSelection:[[NSUserDefaults standardUserDefaults] integerForKey:@"notification_time"] doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[[NSUserDefaults standardUserDefaults] setInteger:selectedIndex forKey:@"notification_time"];
		[[NSUserDefaults standardUserDefaults] synchronize];
		
		[(QLabelElement *)sender setValue:selectedValue];
		[self.quickDialogTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
	
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		[self.quickDialogTableView deselectRowAtIndexPath:[self.quickDialogTableView indexPathForSelectedRow] animated:YES];
	} origin:self.view];
	[notificationTimePicker showActionSheetPicker];
}

- (void)changeDisplayType:(id)sender
{
	ActionSheetStringPicker *displayTypePicker = [[ActionSheetStringPicker alloc] initWithTitle:@"修改首页显示方式" rows:self.displayTypes initialSelection:[[NSUserDefaults standardUserDefaults] integerForKey:@"display_type"] doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
		
		[[NSUserDefaults standardUserDefaults] setInteger:selectedIndex forKey:@"display_type"];
		[[NSUserDefaults standardUserDefaults] synchronize];
		
		[(QLabelElement *)sender setValue:selectedValue];
		[self.quickDialogTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
		
	} cancelBlock:^(ActionSheetStringPicker *picker) {
		[self.quickDialogTableView deselectRowAtIndexPath:[self.quickDialogTableView indexPathForSelectedRow] animated:YES];
	} origin:self.view];
	[displayTypePicker showActionSheetPicker];
}

@end
