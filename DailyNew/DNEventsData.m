//
//  DNEventsData.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNEventsData.h"

static DNEventsData *eventsDataSharedObject = nil;

@interface DNEventsData()

@property (strong, nonatomic) NSMutableDictionary *hotEvents;

@end

@implementation DNEventsData

- (DNEventsData *)init {
    self = [super init];
    if (self) {
    }
    return self;
}

+ (DNEventsData *)shared {
    if (!eventsDataSharedObject) {
        eventsDataSharedObject = [[DNEventsData alloc] init];
    }
    return eventsDataSharedObject;
}

- (NSMutableDictionary *)hotEvents
{
	if (_hotEvents == nil) {
		_hotEvents = [@{
					  @1 : @[
					  [@{@"title" : @"3DayStartup", @"time" : @"10/12-10/14", @"location" : @"光华二楼",  @"poster" : [UIImage imageNamed:@"img4"], @"like" : @115, @"participate" : @30, @"content" : @"You Ready? To be your own Boss。三天内创造的是宏伟的事业！"} mutableCopy],
					  [@{@"title" : @"为你的大学生涯“开帆”", @"time" : @"11月16日 19:00", @"location" : @"理教209",  @"poster" : [UIImage imageNamed:@"img5"], @"like" : @215, @"participate" : @197, @"content" : @"蔡开凡先生谈大学生职业规划！你想构建通往“不可能”的职业幻想的现实路径么？你想与资深顾问探讨你的的职业规划困惑么？"} mutableCopy],
					  [@{@"title" : @"四院联谊舞会", @"time" : @"4月6日 19:30", @"location" : @"二体",  @"poster" : [UIImage imageNamed:@"img6"], @"like" : @326, @"participate" : @238, @"content" : @"信科、语言、政府管理、国际关系学院联谊舞会\nDance tonight! Show yourself!"} mutableCopy],
					  [@{@"title" : @"常用文献检索工具和方法", @"time" : @"10月15日 18:00", @"location" : @"逸夫楼303",  @"poster" : [UIImage imageNamed:@"img1"], @"like" : @186, @"participate" : @324, @"content" : @"文献是学习的基础、研究的阶梯、进步的导师，讲座将讲述最实用的检索工具、最简便的检索方法并教你如何快捷地获得文献！" } mutableCopy],
					  [@{@"title" : @"江淮发展研究会", @"time" : @"9月23日 9:00", @"location" : @"静园",  @"poster" : [UIImage imageNamed:@"img2"], @"like" : @143, @"participate" : @352, @"content" : @"莫愁前路无知己，江淮永远是你家。江淮儿女相约静园，让你结识更多新朋友。" } mutableCopy],
					  [@{@"title" : @"飞跃重洋出国交流讲座", @"time" : @"4月17日 21:30", @"location" : @"理二2129",  @"poster" : [UIImage imageNamed:@"img3"], @"like" : @55, @"participate" : @43, @"content" : @"信息科学技术学院学生会学术部主板的出国交流讲座，有志于出国的同学千万不要错过哦！"} mutableCopy]],
					  @2 : @[
					  [@{@"title" : @"江淮发展研究会", @"time" : @"9月23日 9:00", @"location" : @"静园",  @"poster" : [UIImage imageNamed:@"img2"], @"like" : @143, @"participate" : @352, @"content" : @"莫愁前路无知己，江淮永远是你家。江淮儿女相约静园，让你结识更多新朋友。" } mutableCopy],
					  [@{@"title" : @"飞跃重洋出国交流讲座", @"time" : @"4月17日 21:30", @"location" : @"理二2129",  @"poster" : [UIImage imageNamed:@"img3"], @"like" : @55, @"participate" : @43, @"content" : @"信息科学技术学院学生会学术部主板的出国交流讲座，有志于出国的同学千万不要错过哦！"} mutableCopy],
					  [@{@"title" : @"常用文献检索工具和方法", @"time" : @"10月15日 18:00", @"location" : @"逸夫楼303",  @"poster" : [UIImage imageNamed:@"img1"], @"like" : @186, @"participate" : @324, @"content" : @"文献是学习的基础、研究的阶梯、进步的导师，讲座将讲述最实用的检索工具、最简便的检索方法并教你如何快捷地获得文献！" } mutableCopy],
					  [@{@"title" : @"3DayStartup", @"time" : @"10/12-10/14", @"location" : @"光华二楼",  @"poster" : [UIImage imageNamed:@"img4"], @"like" : @115, @"participate" : @30, @"content" : @"You Ready? To be your own Boss。三天内创造的是宏伟的事业！"} mutableCopy],
					  [@{@"title" : @"为你的大学生涯“开帆”", @"time" : @"11月16日 19:00", @"location" : @"理教209",  @"poster" : [UIImage imageNamed:@"img5"], @"like" : @215, @"participate" : @197, @"content" : @"蔡开凡先生谈大学生职业规划！你想构建通往“不可能”的职业幻想的现实路径么？你想与资深顾问探讨你的的职业规划困惑么？"} mutableCopy],
					  [@{@"title" : @"四院联谊舞会", @"time" : @"4月6日 19:30", @"location" : @"二体",  @"poster" : [UIImage imageNamed:@"img6"], @"like" : @326, @"participate" : @238, @"content" : @"信科、语言、政府管理、国际关系学院联谊舞会\nDance tonight! Show yourself!"} mutableCopy]],
						@3 : @[
					  [@{@"title" : @"常用文献检索工具和方法", @"time" : @"10月15日 18:00", @"location" : @"逸夫楼303",  @"poster" : [UIImage imageNamed:@"img1"], @"like" : @186, @"participate" : @324, @"content" : @"文献是学习的基础、研究的阶梯、进步的导师，讲座将讲述最实用的检索工具、最简便的检索方法并教你如何快捷地获得文献！" } mutableCopy],
					  [@{@"title" : @"3DayStartup", @"time" : @"10/12-10/14", @"location" : @"光华二楼",  @"poster" : [UIImage imageNamed:@"img4"], @"like" : @115, @"participate" : @30, @"content" : @"You Ready? To be your own Boss。三天内创造的是宏伟的事业！"} mutableCopy],
					  [@{@"title" : @"四院联谊舞会", @"time" : @"4月6日 19:30", @"location" : @"二体",  @"poster" : [UIImage imageNamed:@"img6"], @"like" : @326, @"participate" : @238, @"content" : @"信科、语言、政府管理、国际关系学院联谊舞会\nDance tonight! Show yourself!"} mutableCopy],
					  [@{@"title" : @"为你的大学生涯“开帆”", @"time" : @"11月16日 19:00", @"location" : @"理教209",  @"poster" : [UIImage imageNamed:@"img5"], @"like" : @215, @"participate" : @197, @"content" : @"蔡开凡先生谈大学生职业规划！你想构建通往“不可能”的职业幻想的现实路径么？你想与资深顾问探讨你的的职业规划困惑么？"} mutableCopy],
					  [@{@"title" : @"江淮发展研究会", @"time" : @"9月23日 9:00", @"location" : @"静园",  @"poster" : [UIImage imageNamed:@"img2"], @"like" : @143, @"participate" : @352, @"content" : @"莫愁前路无知己，江淮永远是你家。江淮儿女相约静园，让你结识更多新朋友。" } mutableCopy],
					  [@{@"title" : @"飞跃重洋出国交流讲座", @"time" : @"4月17日 21:30", @"location" : @"理二2129",  @"poster" : [UIImage imageNamed:@"img3"], @"like" : @55, @"participate" : @43, @"content" : @"信息科学技术学院学生会学术部主板的出国交流讲座，有志于出国的同学千万不要错过哦！"} mutableCopy]]
					  } mutableCopy];
	}
	return _hotEvents;
}

- (NSArray *)hotEventsByUniversityID:(NSNumber *)university_id
{
	return [self.hotEvents objectForKey:university_id];
}

- (NSArray *)eventsByUniversityID:(NSNumber *)university_id categoryID:(NSNumber *)category_id timeID:(NSNumber *)time_id
{
	NSInteger hash = ([university_id integerValue] + [category_id integerValue] + [time_id integerValue] - 1) % 3 + 1;
	return [self.hotEvents objectForKey:[NSNumber numberWithInteger:hash]];
}

- (NSArray *)myLikeEvents
{
	return [self.hotEvents objectForKey:@1];
}

- (NSArray *)myParticipateEvents
{
	return [self.hotEvents objectForKey:@2];
}

- (NSMutableArray *)universities
{
	if (_universities == nil) {
		_universities = [@[@{@"id" : @1, @"name" : @"全部大学"}, @{@"id" : @2, @"name" : @"北京大学"}, @{@"id" : @3, @"name" : @"清华大学"}] mutableCopy];
	}
	return _universities;
}

- (NSArray *)universityNames
{
	NSMutableArray *universityNames = [@[] mutableCopy];
	for (NSDictionary *university in self.universities) {
		[universityNames addObject:[university objectForKey:@"name"]];
	}
	return universityNames;
}

- (NSArray *)categories
{
	if (_categories == nil) {
		_categories = [@[@{@"id" : @1, @"name" : @"全部类别"}, @{@"id" : @2, @"name" : @"校园招聘"}, @{@"id" : @3, @"name" : @"讲座信息"}, @{@"id" : @4, @"name" : @"演出电影"}, @{@"id" : @5, @"name" :@"聚会"} ] mutableCopy];
	}
	return _categories;
}

- (NSArray *)categoryNames
{
	NSMutableArray *categoryNames = [@[] mutableCopy];
	for (NSDictionary *category in self.categories) {
		[categoryNames addObject:[category objectForKey:@"name"]];
	}
	return categoryNames;
}

- (NSMutableArray *)timeIntervals
{
	if (_timeIntervals == nil) {
		_timeIntervals = [@[@{@"id" : @1, @"name" : @"所有时间"}, @{@"id" : @2, @"name" : @"今天"}, @{@"id" : @3, @"name" : @"明天"}, @{@"id" : @4, @"name" : @"周末"}, @{@"id" : @5, @"name" :@"一周内"} ] mutableCopy];
	}
	return _timeIntervals;
}

- (NSArray *)timeIntervalNames
{
	NSMutableArray *timeIntervalNames = [@[] mutableCopy];
	for (NSDictionary *timeInterval in self.timeIntervals) {
		[timeIntervalNames addObject:[timeInterval objectForKey:@"name"]];
	}
	return timeIntervalNames;
}

- (NSArray *)displayTypes
{
	if (_displayTypes == nil) {
		_displayTypes = @[@"线性", @"旋转", @"反向旋转", @"圆柱", @"反向圆柱", @"轮盘", @"反向轮盘", @"CoverFlow类型一", @"CoverFlow类型二", @"时光机", @"反向时光机"];
	}
	return _displayTypes;
}

- (NSArray *)notificationTimes
{
	if (_notificationTimes == nil) {
		_notificationTimes = @[@"提前10分钟", @"提前1小时", @"提前一天", @"提前一周"];
	}
	return _notificationTimes;
}

- (NSDictionary *)university
{
	if (_university == nil) {
		NSInteger university_id = [[NSUserDefaults standardUserDefaults] integerForKey:@"university_id"];
		for (NSDictionary *university in self.universities) {
			if (university_id == [[university objectForKey:@"id"] integerValue]) {
				_university = university;
				return _university;
			}
		}
		_university = [self.universities objectAtIndex:0];
	}
	return _university;
}

@end
