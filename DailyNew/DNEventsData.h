//
//  DNEventsData.h
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNEventsData : NSObject

@property (strong, nonatomic) NSMutableArray *hotEvents;
@property (strong, nonatomic) NSMutableArray *universities;
@property (strong, nonatomic) NSDictionary *university;

+ (DNEventsData *)shared;

@end
