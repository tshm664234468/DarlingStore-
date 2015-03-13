//
//  ItemsVC.m
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "ItemsVC.h"
#import "NetworkTool.h"
#import "ItemsCell.h"
#import "DetailViewController.h"
#import "AllDataModel.h"
@interface ItemsVC ()

@end

@implementation ItemsVC

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
    _itemsTable=[[UITableView alloc]init];
    
    _itemsTable.delegate=self;
    _itemsTable.dataSource=self;
    
    _itemsTable.frame=self.view.frame;
    
    [_itemsTable registerClass:[ ItemsCell class] forCellReuseIdentifier:@"cellID"];
    
    [self.view addSubview:_itemsTable];
    
    NSLog(@"555555");
    
    //[NetworkTool requestStartUrl:_list.  completionBlock:<#^(NSDictionary *dic)block#>]
    
    [NetworkTool requestListUrl:_list.url andListId:_list.listIdentifier completionBlock:^(NSDictionary *dic) {
        
        _class=[ITEMBaseClass modelObjectWithDictionary:dic];
        
        _listArray=[[NSMutableArray alloc]initWithArray:_class.data.list];
        
        [_itemsTable reloadData];
        // NSLog(@"-------------98999999999999999--------------%@",dic);
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    NSLog(@"888888888===========--------%d",_listArray.count);
    
    return _listArray.count;
    
    NSLog(@"-----llll=====--------------------------%d",_listArray.count);
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemsCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath  ];
    
    ITEMList*list=_listArray[indexPath.row];
    cell.list=list;
    
    return cell;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 270;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailViewController*vc=[[DetailViewController alloc]init];
    
    
    ITEMList*aList= _listArray[indexPath.row];
    
    vc.iList=[aList retain];
    [self.navigationController pushViewController:vc animated:YES];
    
  
    
   // ItemsVC*vc=[[ItemsVC alloc]init];
    
//    SortList *alist=_datasourseArray[indexPath.row];
//    
//    vc.list=alist;
//    vc.title=[_datasourseArray[indexPath.row] title];
//    
//    [self.navigationController pushViewController:vc animated:
    
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
