//
//  RightVC.m
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "RightVC.h"
#import "CollectionCell.h"
#import "NetworkTool.h"
#import "UIButton+WebCache.h"
#import "ItemsVC.h"
@interface RightVC ()

@end

@implementation RightVC

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
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.minimumLineSpacing = 40;
    
    flowLayout.minimumInteritemSpacing = 10;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    flowLayout.itemSize = CGSizeMake(50, 50);
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //collectionView显示时，必须使用一个类UICollectionViewLayout来进行布局
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(80, 120, 240, self.view.frame.size.height-44) collectionViewLayout:flowLayout];
    
    _collectionView.dataSource = self;
    
    _collectionView.delegate = self;
    
    _collectionView.backgroundColor=[UIColor grayColor];
    [_collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"cellID"];
    
    //    [_collectionView registerClass:[CollectionCell class] forCellReuseIdentifier:@"cellID"];
    
    
    
    //    _collectionView.contentInset = UIEdgeInsetsMake(50, 50, 50, 50);
    
    
    
    [self.view addSubview:_collectionView];
    
    
    [NetworkTool requestSortListWithCompletionBlock:^(NSDictionary *dic) {
        
        _baseClass=[SortBaseClass modelObjectWithDictionary:dic];
        
        [self loadRightView];
        
    }];
    
    
    
}

-(void)loadRightView
{
    // int  i=0;
    
    //    _datasourseArray=[[NSMutableArray alloc] init];
    
    
    _datasourseArray = [[_baseClass.data objectAtIndex:_index] list];
    
    //for (SortList*list in _datasourseArray) {
    
    // NSURL*buttonUrl=list.imageUrl;
    
    //_rightArray=
    //  }
    
    
    //    for (SortData*data  in  _baseClass.data)
    //    {
    //        if (!data.title) {
    //            continue;
    //        }
    //
    //        NSArray *listArray=data.list;
    //
    //        [_datasourseArray addObject:listArray];
    //
    ////        NSLog(@"          %d--",_datasourseArray.count);
    //    }
    NSLog(@"+++++++++ %@--",_datasourseArray);
    
    NSLog(@"          %d--",_datasourseArray.count);
    
    [_collectionView reloadData];
    
    // [[[_baseClass.data objectAtIndex:_selectedRow] list] objectAtIndex:indexPath.row]
    //
    //    [_leftArray addObject:[NSNumber numberWithInt:i]];
    //    [_rightArray addObject:[[_baseClass.data objectAtIndex:_index] list]];
    
    // NSLog(@"-------====llll------%@",_leftArray );
    
    //    int j=0;
    //    for (SortList*li) {
    //        <#statements#>
    //    }
    //
    
    
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    NSLog(@"-----------------%d-------",section);
    
    //    NSLog(@"-----------------%d-------",_index);
    //
    //    NSArray *array=[_datasourseArray objectAtIndex:_index];
    //
    //    NSLog(@"----------%@",_datasourseArray);
    
    NSLog(@"-----------%d-----66666",_datasourseArray.count);
    
    return _datasourseArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    
    SortList *list=_datasourseArray[indexPath.row];
    
    
    cell.list=list;
    
    cell.backgroundColor = [UIColor redColor];
    
    // [cell.button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor whiteColor];
    ItemsVC*vc=[[ItemsVC alloc]init];
    
    SortList *alist=_datasourseArray[indexPath.row];
    
    vc.list=alist;
    
    vc.title=[_datasourseArray[indexPath.row] title];
    
    [self.navigationController pushViewController:vc animated:YES];
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
