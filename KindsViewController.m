//
//  KindsViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "KindsViewController.h"
#import "RightVC.h"
#import "SearchVC.h"
@interface KindsViewController ()
{
    UIButton*_searchBtn;
}
@end

@implementation KindsViewController

- (void)viewDidLoad
{
  
    [super viewDidLoad];
    
    
    
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 120, 80, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _table.dataSource = self;
    _table.delegate = self;
    _table.backgroundColor = [UIColor clearColor];
    _table.bounces=NO;
    _table.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    [self.view addSubview:_table];
    _imgArray = [[NSArray alloc] initWithObjects:@"推荐分类",@"创意生活",@"极致美护",@"全球零食",@"个性配饰",@"包袋手袋", @"品牌精选",nil];
    
    // _hImgArray = [[NSArray alloc] initWithObjects:@"hzctj.png",@"hcp.png",@"hlc.png",@"hrc.png",@"htl.png",@"hzs.png",@"hjsyl.png", nil];
    
    
    for (int i = 0; i<7; i++) {
        RightVC *vc = nil;
        
        
        vc= [[RightVC alloc] init];
        
        
        //vc.indexLabel.text = [NSString stringWithFormat:@"点击了第%d行",i];
        vc.index = i;
        
        //添加子视图控制器
        [self addChildViewController:vc];
        
        if (i == 0) {
            [self.view addSubview:vc.view];
            [self.view bringSubviewToFront:_table];
        }
        
        [vc release];
    }
    
    
    _searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _searchBtn.frame=CGRectMake(0, 74, 320, 40);
    [_searchBtn setImage:[UIImage imageNamed:@"img_searchBar.png"] forState:UIControlStateNormal];
    _searchBtn.backgroundColor=[UIColor clearColor];
    [_searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchBtn];
    
}

-(void)searchBtnClick
{
    
    NSLog(@"af--------------");
    
    SearchVC*vc=[[SearchVC alloc]init];
    
    vc.title=@"搜索";
    //    UIWindow*window=[[UIApplication sharedApplication]keyWindow];
    //
    //    window.rootViewController=vc;
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    //    UIBarButtonItem*rightItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bt_search.png"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    //    self.navigationItem.rightBarButtonItem=rightItem;
    
    //    NSArray*array=self.navigationController.viewControllers;
    //    UIBarButtonItem*backItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bt_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    //    self.navigationItem.backBarButtonItem=backItem;
    //
    
}

//-(void)rightClick
//{
//
//    SearchVC*vc=[[SearchVC alloc]init];
//
//    vc.title=@"搜索";
//
//    [self.navigationController pushViewController:vc animated:YES];
//
//
//
//}

//-(void)backClick
//{
//
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _imgArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        
        cell.textLabel.font=[UIFont  systemFontOfSize:12];
        
    }
    
    cell.textLabel.textColor=[UIColor blueColor];
    
    cell.textLabel.text=[_imgArray  objectAtIndex:indexPath.row];
    
    
    
    if (indexPath.row == _currentSelectRow) {
        
        
        cell.textLabel.textColor=[UIColor purpleColor];
        
        
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RightVC *lastVC = [[self childViewControllers] objectAtIndex:_currentSelectRow];
    [lastVC.view removeFromSuperview];
    _currentSelectRow = indexPath.row;
    [_table reloadData];
    RightVC *vc = [[self childViewControllers] objectAtIndex:indexPath.row];
    [self.view addSubview:vc.view];
    //把tableview提前响应
    [self.view bringSubviewToFront:_table];
    //再把btn提前响应。。
    [self.view bringSubviewToFront:_searchBtn];
    
}



- (void)dealloc {
    [_imgArray release];
    [_hImgArray release];
    [_table release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
