//
//  DishClassViewController.m
//  PoKitchen
//
//  Created by 李英 on 16/11/24.
//  Copyright © 2016年 李英 All rights reserved.
//

#import "DishClassViewController.h"
#import "DishClassModel+NetWork.h"
#import "DishClassCell.h"

@interface DishClassViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger page;//控制显示的页码

@end

@implementation DishClassViewController
-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64,SCREEN_W,SCREEN_H - (64 + 49)) style:UITableViewStylePlain];
        //隐藏竖直方向的滚动条
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"DishClassCell" bundle:nil] forCellReuseIdentifier:@"DishClassCell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //留出顶端一排图标的高度
        _tableView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
        //下拉刷新
        
        //上拉加载更多
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.page ++;
            [self loadDishListData];
        }];
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.page = 1;
    [self loadDishListData];
    
}
//获取食课列表数据
-(void)loadDishListData{
    
    [HDManager startLoading];//开始加载数据，显示加载指示器
    [DishClassModel loadDishClassListWithPage:self.page callBack:^(NSArray *array, NSError *error) {
        
        if(!error){
            
            if (self.page == 1) {
                
                [self.dataArray removeAllObjects];
            }
            //添加数据源
            [self.dataArray addObjectsFromArray:array];
            //刷新TableView
            [self.tableView reloadData];
            //结束上拉加载更多
            [self.tableView.footer endRefreshing];
        }
        [HDManager stopLoading];//结束加载，隐藏加载指示器
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView 协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  [self.dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellId = @"DishClassCell";
    //这个方法处理创建新的cell 和cell 复用
    DishClassCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    //取出对应行的模型对象
    DishClassModel *model = self.dataArray[indexPath.row];
    [cell.dishImage sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    [cell.albumLogo sd_setImageWithURL:[NSURL URLWithString:model.albumLogo]];
    NSArray *array = [model.seriesName componentsSeparatedByString:@"#"];
    cell.nameL.text = [array lastObject];
    cell.updateL.text = [NSString stringWithFormat:@"更新至%@集",model.episode];
    cell.numL.text = [NSString stringWithFormat:@"上课人数:%@",model.play];
    cell.albumL.text = model.album;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}



@end
