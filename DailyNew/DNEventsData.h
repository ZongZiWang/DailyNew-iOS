//
//  DNEventsData.h
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNEventsData : NSObject

@property (strong, nonatomic) NSDictionary *university;

@property (strong, nonatomic) NSMutableArray *universities;
@property (strong, nonatomic) NSMutableArray *categories;
@property (strong, nonatomic) NSMutableArray *timeIntervals;

@property (strong, nonatomic) NSArray *notificationTimes;
@property (strong, nonatomic) NSArray *displayTypes;

+ (DNEventsData *)shared;

- (NSArray *)universityNames;
- (NSArray *)categoryNames;
- (NSArray *)timeIntervalNames;

- (NSArray *)hotEventsByUniversityID:(NSNumber *)university_id;

@end
