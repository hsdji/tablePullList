//
//  ViewController.m
//  tableView下拉列表
//
//  Created by 单小飞 on 2018/3/29.
//  Copyright © 2018年 单小飞. All rights reserved.
//

#import "ViewController.h"
#import "pulltableViewCell.h"
#import "headView.h"

#define RGBSixteenColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBColor(_R_,_G_,_B_,_alpha_) [UIColor colorWithRed:_R_/255.0 green:_G_/255.0 blue:_B_/255.0 alpha:_alpha_]


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/**       列表  */
@property (nonatomic,strong) UITableView *tableView;;

/**       sectionArr  */
@property (nonatomic,strong) NSMutableArray *sectionDasouceArr;

/**       sectionArrw  */
@property (nonatomic,strong) NSMutableArray *sectionDasouceArrw;


/**       rowArr  */
@property (nonatomic,strong) NSMutableArray <NSMutableArray *>*rowDataSouceArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark ---- LazyLoad-----
-(UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        [_tableView registerClass:[pulltableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView= [UIView new];
        _tableView.backgroundColor = RGBColor(237, 237, 237, 1.0);
    }
    return _tableView;
}

-(NSMutableArray *)sectionDasouceArr
{
    if (!_sectionDasouceArr) {
        _sectionDasouceArr = [[NSMutableArray alloc] init];
        [_sectionDasouceArr addObject:@{@"title":@"微信付",@"isOPen":@"0"}];
    }
    return _sectionDasouceArr;
}




-(NSMutableArray *)sectionDasouceArrw
{
    if (!_sectionDasouceArrw) {
        _sectionDasouceArrw = [[NSMutableArray alloc] init];
        [_sectionDasouceArrw addObject:@{@"title":@"微信付",@"isOPen":@"0"}];
        [_sectionDasouceArrw addObject:@{@"title":@"支付宝",@"isOPen":@"0"}];
//        [_sectionDasouceArrw addObject:@{@"title":@"京东卡",@"isOPen":@"0"}];
//        [_sectionDasouceArrw addObject:@{@"title":@"银行卡",@"isOPen":@"0"}];
//        [_sectionDasouceArrw addObject:@{@"title":@"一网通",@"isOPen":@"0"}];
//        [_sectionDasouceArrw addObject:@{@"title":@"苏宁卡",@"isOPen":@"0"}];
    }
    return _sectionDasouceArrw;
}




-(NSMutableArray *)rowDataSouceArr{
    if (!_rowDataSouceArr) {
        _rowDataSouceArr = [[NSMutableArray alloc] init];
        
        for (int i =0; i<self.sectionDasouceArr.count; i++) {
            NSMutableArray *arr = [NSMutableArray new];
            int num =5;
            for (int i =0; i<num; i++) {
                [arr addObject:[NSString stringWithFormat:@"第%d公交车分公司",i]];
            }
            [_rowDataSouceArr addObject:arr];
        }
    }
    return _rowDataSouceArr;
}

#pragma mark ----   tableViewdeleagte&tableViewDateSouce
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionDasouceArr.count+self.sectionDasouceArrw.count+2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0||section>self.sectionDasouceArr.count) { return 0;}
    NSString *isOpen = [self.sectionDasouceArr[section-1] valueForKey:@"isOPen"];
    if ([isOpen isEqualToString:@"0"]) {
        return 0;
    }else{
        return self.rowDataSouceArr[section-1].count;
    }
}
//根据——rowArr计算返回高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    pulltableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[pulltableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSArray *arr = self.rowDataSouceArr[indexPath.section-1];
    NSString *aa = arr[indexPath.row];
    cell.TTtext = aa;
    cell.rindexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section-1];
    [cell clickEvents:^(NSInteger section, NSInteger row,UIButton *sender) {
        NSLog(@"section:%ld------row:%ld ---%@",section,row,sender.titleLabel.text);
    }];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0||section == self.sectionDasouceArr.count+1) {return nil;}
    
    if (self.sectionDasouceArr.count>=section>0) {
        headView *v = [headView headViewWithTableView:self.tableView];
        v.backgroundColor = [UIColor whiteColor];
        v.title = [self.sectionDasouceArr[section-1] valueForKey:@"title"];
        v.scetion = section-1;
        v.isOpen = [[self.sectionDasouceArr[section-1] valueForKey:@"isOPen"] isEqualToString:@"0"]?NO:YES;
        __weak typeof(self)weakSelf = self;
        
        [v click:^(NSInteger index) {
            __strong typeof(weakSelf)StrongSelf = self;
            for (int i =0; i<_sectionDasouceArr.count; i++) {
                if (i == index) {
                    NSDictionary *dic = _sectionDasouceArr[i];
                    if ([[dic valueForKey:@"isOPen"]isEqual:@"0"]) {
                        [StrongSelf.sectionDasouceArr replaceObjectAtIndex:i withObject:@{@"title":[dic valueForKey:@"title"],@"isOPen":@"1"}];
                        
                    }else{
                        [StrongSelf.sectionDasouceArr replaceObjectAtIndex:i withObject:@{@"title":[dic valueForKey:@"title"],@"isOPen":@"0"}];
                    }
                    
                    [StrongSelf.tableView reloadData];
                    
                }
            }
        }];
        return v;
    }else{
        headView *v = [headView headViewWithTableView:self.tableView];
        v.backgroundColor = [UIColor whiteColor];
        v.title = [self.sectionDasouceArrw[section-2-self.sectionDasouceArr.count] valueForKey:@"title"];
        v.scetion = section-2-self.sectionDasouceArr.count;
        v.isOpen = [[self.sectionDasouceArrw[section-2-self.sectionDasouceArr.count] valueForKey:@"isOPen"] isEqualToString:@"0"]?NO:YES;
        [v click:^(NSInteger index) {
//            for (int i =0; i<_sectionDasouceArrw.count; i++) {
//                if (i == section) {
//                    NSDictionary *dic = _sectionDasouceArr[i];
//                    if ([[dic valueForKey:@"isOPen"]isEqual:@"0"]) {
//                        [self.sectionDasouceArr replaceObjectAtIndex:i withObject:@{@"title":[dic valueForKey:@"title"],@"isOPen":@"1"}];
//
//
//                    }else{
//                        [self.sectionDasouceArr replaceObjectAtIndex:i withObject:@{@"title":[dic valueForKey:@"title"],@"isOPen":@"0"}];
//                    }
//
//                    [self.tableView reloadData];
//
//                }
//            }
        }];
        return v;
    }
    
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"已开通";
    }else
        return @"未开通";
}



@end
