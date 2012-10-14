//
//  DNEventCell.h
//  DailyNew
//
//  Created by ZongZiWang on 12-10-14.
//  Copyright (c) 2012年 3DayStartup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNEventCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *participateLabel;

@end
