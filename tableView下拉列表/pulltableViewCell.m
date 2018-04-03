//
//  pulltableViewCell.m
//  tableView下拉列表
//
//  Created by 单小飞 on 2018/3/29.
//  Copyright © 2018年 单小飞. All rights reserved.
//

#import "pulltableViewCell.h"
#import "pullContentCollectionViewCell.h"
#import "Masonry.h"
#define KIntervalWidth  ([UIScreen mainScreen].bounds.size.width - 100*2)/3

@interface pulltableViewCell()
{
    UILabel *titleLAb;
    UIButton *btn;
}

@end

@implementation pulltableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    
    
    titleLAb = [[UILabel alloc] init];
    titleLAb.text = self.TTtext;
    [self.contentView addSubview:titleLAb];
    [titleLAb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
    }];
    
    
    btn = [[UIButton alloc] init];
    [self.contentView addSubview:btn];
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    btn.layer.borderWidth = 1;
    btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [btn addTarget:self action:@selector(event:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"    已开通    " forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
    }];
}



-(void)setRindexPath:(NSIndexPath *)rindexPath{
    _rindexPath = rindexPath;
}


-(void)setTTtext:(NSString *)TTtext{
    _TTtext = TTtext;
    titleLAb.text = _TTtext;
}

-(void)event:(UIButton *)sender{
    
    self.clickEvents(_rindexPath.section,_rindexPath.row,sender);
}

-(void)clickEvents:(clickEvents)clickEvents
{
    _clickEvents = clickEvents;
}
@end
