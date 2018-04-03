//
//  pullContentCollectionViewCell.m
//  tableView下拉列表
//
//  Created by 单小飞 on 2018/3/29.
//  Copyright © 2018年 单小飞. All rights reserved.
//

#import "pullContentCollectionViewCell.h"
@interface pullContentCollectionViewCell()
/**       UIButton *titleBt  */
@property (nonatomic,strong) UIButton *titleBtn;
@end


@implementation pullContentCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width-30)/2.0, 44)];
    titleBtn.layer.masksToBounds = YES;
    titleBtn.layer.cornerRadius = 23;
    titleBtn.layer.borderWidth = 1;
    titleBtn.layer.borderColor = [UIColor redColor].CGColor;
    [titleBtn setTitle:self.title forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.contentView addSubview:titleBtn];
    titleBtn.userInteractionEnabled = NO;
    titleBtn.userInteractionEnabled = NO;
    self.titleBtn = titleBtn;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    [self.titleBtn setTitle:self.title forState:UIControlStateNormal];
}
@end
