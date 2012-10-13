//
//  DNEventsData.m
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import "DNEventsData.h"

static DNEventsData *eventsDataSharedObject = nil;

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

- (NSMutableArray *)hotEvents
{
	if (_hotEvents == nil) {
		_hotEvents = [@[
						  [@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"光华楼", @"like" : @432 } mutableCopy],
						  [@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"光华楼", @"like" : @14} mutableCopy],
						  [@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"光华楼", @"like" : @155} mutableCopy],
						  [@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"光华楼", @"like" : @315} mutableCopy],
						  [@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"光华楼", @"like" : @15} mutableCopy],
						  [@{@"title" : @"三日初创", @"time" : @"这两天", @"location" : @"光华楼", @"like" : @15} mutableCopy],
						  [@{@"title" : @"测试数据2", @"time" : @"这三天", @"location" : @"光华楼", @"like" : @165} mutableCopy],
						  [@{@"title" : @"啦啦啦啦", @"time" : @"噗噗", @"location" : @"光华楼", @"like" : @125} mutableCopy],
						  [@{@"title" : @"试试看", @"time" : @"嘿嘿", @"location" : @"光华楼", @"like" : @15} mutableCopy],
						  [@{@"title" : @"牛", @"time" : @"一二三", @"location" : @"光华楼", @"like" : @135} mutableCopy]]
					  mutableCopy ];
	}
	return _hotEvents;
}

- (NSMutableArray *)universities
{
	if (_universities == nil) {
		_universities = [@[@{@"id" : @1, @"name" : @"北京大学"}, @{@"id" : @1, @"name" : @"清华大学"}] mutableCopy];
	}
	return _universities;
}

- (NSDictionary *)university
{
	if (_university == nil) {
		_university = [self.universities objectAtIndex:0];
	}
	return _university;
}

@end
