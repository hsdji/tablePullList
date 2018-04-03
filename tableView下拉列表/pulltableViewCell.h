//
//  pulltableViewCell.h
//  tableView下拉列表
//
//  Created by 单小飞 on 2018/3/29.
//  Copyright © 2018年 单小飞. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickEvents)(NSInteger section,NSInteger row,UIButton *sender);
@interface pulltableViewCell : UITableViewCell
@property (nonatomic,copy) NSString *TTtext;

@property (nonatomic,copy) clickEvents clickEvents;

-(void)clickEvents:(clickEvents)clickEvents;

@property (nonatomic,assign) NSIndexPath* rindexPath;
@end
