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
						[@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @432 } mutableCopy],
						[@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @14} mutableCopy],
						[@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @155} mutableCopy],
						[@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @315} mutableCopy],
						[@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @15} mutableCopy],
						[@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @15} mutableCopy],
						[@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @165} mutableCopy],
						[@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @125} mutableCopy],
						[@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @15} mutableCopy],
						[@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @135} mutableCopy]],
						@2 : @[
						[@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @432 } mutableCopy],
						[@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @14} mutableCopy],
						[@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @155} mutableCopy],
						[@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @15} mutableCopy],
						[@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @315} mutableCopy],
						[@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @15} mutableCopy],
						[@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @15} mutableCopy],
						[@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @165} mutableCopy],
						[@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @125} mutableCopy],
						[@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"光华楼",  @"poster" : [UIImage imageNamed:@"poster1"], @"like" : @135} mutableCopy]],
						@3 : @[
					    [@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @432 } mutableCopy],
						[@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @15} mutableCopy],
						[@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @165} mutableCopy],
						[@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @125} mutableCopy],
						[@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @15} mutableCopy],
						[@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @14} mutableCopy],
						[@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @155} mutableCopy],
						[@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @315} mutableCopy],
						[@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @15} mutableCopy],
						[@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"六教",  @"poster" : [UIImage imageNamed:@"page"], @"like" : @135} mutableCopy]]
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
	return [self.hotEvents objectForKey:university_id];
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
