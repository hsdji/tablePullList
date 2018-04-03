//
//  titleTableViewCell.m
//  tableView下拉列表
//
//  Created by 单小飞 on 2018/4/2.
//  Copyright © 2018年 单小飞. All rights reserved.
//

#import "titleTableViewCell.h"
#import <Masonry/Masonry.h>



@implementation titleTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

-(void)setUpUI{
    self.styleView = [[headView alloc] init];
    [self.contentView addSubview:self.styleView];
    [self.styleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}
@end
