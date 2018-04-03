//
//  CorrectTitleHeaderView.m
//  评论和评分
//
//  Created by chen on 2017/7/5.
//  Copyright © 2017年 lzh. All rights reserved.
//


#define KWidth  [UIScreen mainScreen].bounds.size.width
#define KHeight  [UIScreen mainScreen].bounds.size.height


//自定义颜色
#define RGBSixteenColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBColor(_R_,_G_,_B_,_alpha_) [UIColor colorWithRed:_R_/255.0 green:_G_/255.0 blue:_B_/255.0 alpha:_alpha_]

#import "headView.h"
#import <Masonry/Masonry.h>
@interface headView ()

@property (strong, nonatomic) UIButton *titleBtn;//

@property (nonatomic,strong) UILabel *lineLabel;//底部的线条


@end


@implementation headView

+ (instancetype)headViewWithTableView:(UITableView *)tableView{
    
    
    headView *headiew;
    if (headiew == nil) {
        headiew = [[headView alloc] init];
    }
    return headiew;
}

- (id)init{
    
    if (self = [super init]) {
        
        [self createUI];
    }
    return self;
    
}
- (void)createUI{
    
    //加一个空白Label
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10)];
//    label.backgroundColor = RGBColor(237, 237, 237, 1.0);
//    [self addSubview:label];

    //按钮加文字
  __block  UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setImage:[UIImage imageNamed:@"con_btn_open"] forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    titleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    titleBtn.imageView.contentMode = UIViewContentModeCenter;
    titleBtn.imageView.clipsToBounds = NO;
    titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //上   左   下   右
    titleBtn.contentEdgeInsets = UIEdgeInsetsMake(30, KWidth-30, 30, 0);
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(10, -KWidth+30, 0, 50);
    [titleBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:titleBtn];
    self.titleBtn = titleBtn;
    self.titleBtn.selected = NO;
    self.lineLabel = [[UILabel alloc]init];
    self.lineLabel.backgroundColor = RGBColor(216, 216, 216, 1.0);
    [self addSubview:self.lineLabel];
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    //给分组头添加名称
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
}

#pragma mark - 下拉箭头的点击事件
- (void)headBtnClick:(UIButton *)sender{
    [UIView animateWithDuration:0.22 animations:^{
        self.titleBtn.imageView.transform = !self.titleBtn.selected ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
        self.titleBtn.selected = !self.titleBtn.selected;
    } completion:^(BOOL finished) {
            self.click(self.scetion);
    }];
    
}


-(void)click:(clickBtn)click{
    _click = click;
}



- (void)didMoveToSuperview{
    [self.titleBtn setTitle:self.title forState:UIControlStateNormal];
    self.titleBtn.imageView.transform = self.isOpen ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
    }];
    
    self.lineLabel.frame = CGRectMake(10, self.frame.size.height-0.5, self.frame.size.width - 20 , 0.5);
}



@end

