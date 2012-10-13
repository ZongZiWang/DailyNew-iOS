//
//  DNHotViewController.h
//  DailyNew
//
//  Created by ZongZiWang on 12-10-13.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface DNHotViewController : UIViewController

@property (strong, nonatomic) IBOutlet iCarousel *hotEvents;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
