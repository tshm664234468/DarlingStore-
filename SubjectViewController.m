//
//  SubjectViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "SubjectViewController.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "CustomerPublicCell.h"
#import "DetailsViewController.h"

@interface SubjectViewController ()

@end

@implementation SubjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    
    [self requestFindData];
    
    
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 25, 320, self.view.bounds.size.height)];
    
    scrollView.contentSize=CGSizeMake(320*2,0);
    //scrollView.showsHorizontalScrollIndicator=NO;
   // scrollView.showsVerticalScrollIndicator=NO;
      scrollView.pagingEnabled=YES;
     scrollView.bounces=NO;
    [self.view addSubview:scrollView];
    
    
    self.navigationItem.title=@"专题";

    for (int i=0; i<2; i++)
    {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(i*80, 64, 80, 30);
        if (i==0)
        {
            [btn setTitle:@"全部专题" forState: UIControlStateNormal];
            _firstTableView=[[UITableView alloc]initWithFrame:CGRectMake(i*320, 0, 300, self.view.bounds.size.height-44) style:UITableViewStylePlain];
            
            [_firstTableView registerClass:[CustomerPublicCell class] forCellReuseIdentifier:@"cell"];
            
             _firstTableView.delegate=self;
            
            _firstTableView.dataSource=self;
            
            _firstTableView.rowHeight=200;
            
            [scrollView addSubview:_firstTableView];
          
            
        }
        else
        {
            
           [btn setTitle:@"礼物精选" forState: UIControlStateNormal];
        
        }
        [btn  addTarget:self action:@selector(goodsClick:) forControlEvents:UIControlEventTouchUpInside];
      
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      
        [self.view addSubview:btn];
        
        btn.tag=i+1;
        
       
        _secondTableView=[[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, self.view.bounds.size.height-44-64-30) style:UITableViewStylePlain];
       
        [_secondTableView registerClass:[CustomerPublicCell class] forCellReuseIdentifier:@"cell"];
        
       
        
        _secondTableView.delegate=self;
        
        _secondTableView.dataSource=self;
        
        _secondTableView.rowHeight=200;
        
        [scrollView addSubview:_secondTableView];
      
    
    
    }
    
    
   
    
}
-(void)requestFindData
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
   
    NSString *stringURL=@"http://m.ymall.com/api/specialty/lists?page=1&kind=0";
    
    NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)stringURL, NULL, NULL,  kCFStringEncodingUTF8 );
    
    [manage GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        baseClass=[BaseClass  modelObjectWithDictionary:responseObject];
      
      
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
        
    }];
    
    
}
-(void)requestChangeData
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
    
    NSString *stringURL=@"http://m.ymall.com/api/specialty/lists?page=1&kind=1";
    
    NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)stringURL, NULL, NULL,  kCFStringEncodingUTF8 );
    
    [manage GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        baseClass=[BaseClass  modelObjectWithDictionary:responseObject];
      
  
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
     }];
    
    
}


-(void)goodsClick:(UIButton*)sender
{
    NSLog(@"%d",sender.tag);
    
    if (sender==(UIButton*)[self.view viewWithTag:1])
    {
        scrollView.contentOffset=CGPointMake(0, 0);
    }
    else{
    
      scrollView.contentOffset=CGPointMake(320, 0);
    
    
    }

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_firstTableView)
    {
    return baseClass.data.list.count;
    }
    
    else{
    
    
    return  baseClass.data.list.count;
    
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    CustomerPublicCell*cell=[tableView  dequeueReusableCellWithIdentifier:@"cell"];
    
    
    cell=[[CustomerPublicCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    

        if (tableView==_firstTableView)
    {
      
        NSDictionary*dic=baseClass.data.list[indexPath.row];
        
        [cell.pageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"cover"]]]];
       
        return cell;
  
    }
        else
        {
            
         
            NSDictionary*dic=baseClass.data.list[indexPath.row];
            
            [cell.pageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[dic valueForKey:@"cover"]]]];
            
            return  cell;
        
        
        
        }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSDictionary*dic=baseClass.data.list[indexPath.row];
  
    NSString*str=[dic  valueForKey:@"url"];
   
    NSString*titleText=[dic valueForKey:@"title"];
    
    DetailsViewController *detailsViewController=[[DetailsViewController alloc]initWithURL:str withTitle:titleText];
  
    [self.navigationController   pushViewController:detailsViewController animated:YES];


}
-(void)dealloc
{
  
    [_firstTableView release];
    [_secondTableView release];
    [scrollView release];
    [super dealloc];



}
- (void)didReceiveMemoryWarning
{
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
