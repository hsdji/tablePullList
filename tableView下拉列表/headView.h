//
//  headView.h
//  tableView下拉列表
//
//  Created by 单小飞 on 2018/3/29.
//  Copyright © 2018年 单小飞. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickBtn)(NSInteger index);
@interface headView : UIView
/**       标题  */
@property (nonatomic,copy) NSString *title;


@property (nonatomic,assign) NSInteger scetion;

@property (nonatomic,copy) clickBtn click;
+ (instancetype)headViewWithTableView:(UITableView *)tableView;
-(void)click:(clickBtn)click;

@property (nonatomic,assign) BOOL isOpen;
@end
