//
//  SearchVC.m
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "SearchVC.h"
#import "SearchCell.h"
@interface SearchVC ()

@end

@implementation SearchVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField* searchField=[[UITextField alloc]initWithFrame:CGRectMake(20, 70, 200, 30)];
    [searchField setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    
    searchField.placeholder = @"搜索";
    
    [self.view addSubview:searchField];
    
    UIButton*searchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame=CGRectMake(250, 70, 40, 30);
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    //searchBtn.backgroundColor=[UIColor whiteColor];
    [searchBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.minimumLineSpacing = 10;
    
    flowLayout.minimumInteritemSpacing = 10;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    flowLayout.itemSize = CGSizeMake(50, 30);
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //collectionView显示时，必须使用一个类UICollectionViewLayout来进行布局
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 120, 320, 150) collectionViewLayout:flowLayout];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor=[UIColor clearColor];
    
    // _collectionView.layer.cornerRadius = 10;
    //[_collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"cellID"];
    
    [_collectionView registerClass:[SearchCell class] forCellWithReuseIdentifier:@"cellID"];
    [self.view addSubview:_collectionView];
    
    _searchArray=[[NSArray alloc]initWithObjects:@"手表",@"打火机",@"双肩包",@"移动电源",@"耳钉",@"5s手机壳",@"手链",@"耳机",@"戒指",@"手机壳",@"钱包",nil];
    
    // NSArray*array=self.navigationController.viewControllers;
    UIBarButtonItem*leftItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bt_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItem=leftItem;
    
    
}


-(void)backClick
{
    
    [self.navigationController  popViewControllerAnimated:YES];
}


-(void)searchBtnClick
{
    
    NSLog(@"fdd-------");
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _searchArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SearchCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    //    if (!cell) {
    //
    //        cell=[[UICollectionViewCell alloc]init];
    //
    //    }
    cell.backgroundColor=[UIColor blueColor ];
    cell.layer.cornerRadius = 15;
    cell.titleLabel.font=[UIFont systemFontOfSize:10];
    cell.titleLabel.text=[NSString stringWithFormat:@"%@",_searchArray[indexPath.row]];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
