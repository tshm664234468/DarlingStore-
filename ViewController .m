//
//  ViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "ViewController .h"
#import "CustomDaelingCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
  [self requestCYData:@"http://m.ymall.com/api/goods/search?page=1"];

   // NSArray*array=@[@"1015",@"3305",@"3621",@"1018",@"1017",@"1019",@"1020",@"1021"];
    
   // [self   requestFindData: @"http://m.ymall.com/api/goods/search?id=1015&key=&page=1&tags=%E5%88%9B%E6%84%8F&frontpage=1"];
   
    self.navigationItem.title=@"达令";
   
    
    
    _dataArr=[[NSMutableArray alloc]init];
    
    _titleArray=[[NSArray  alloc]initWithObjects:@"发现",@"创意新闻",@"极致美护",@"全球零食",@"个性配饰",@"包袋手袋",@"冬日之恋",@"本周新品",@"本周热卖", nil];
    _scrollerView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, 44)];
   // _scrollerView.backgroundColor=[UIColor redColor];
    [self.view addSubview:_scrollerView];
    self.automaticallyAdjustsScrollViewInsets=NO;
  
   
    _contentScroller=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 108, 320, self.view.bounds.size.height-64-44-44)];
    
    _contentScroller.contentSize=CGSizeMake(9*320, self.view.bounds.size.height-44-64-44);
    
    [self.view addSubview:_contentScroller];
    
    
    _contentScroller.delegate=self;
    _contentScroller.showsHorizontalScrollIndicator=NO;
    _contentScroller.showsVerticalScrollIndicator=NO;
    _contentScroller.pagingEnabled=YES;
   
    [self createTableView];
    
    [self requestCYData:[NSString stringWithFormat:@""]];
   
 
   
    float sumWidth  = 10 ;
   
   
 
    
    for (double i = 1 ; i <_titleArray.count; i++)
    {
        
         UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
        
         button.tag = i;
        
        float width = [self getWidthByClickedButtonTag:button.tag] ;
        
        
          button.frame = CGRectMake(i*100, 10, width+30, 30);
        
          sumWidth += width + 45;
        
         NSString * title = [_titleArray objectAtIndex:button.tag-1];
        
         [button setTitle:title forState:UIControlStateNormal];
        
         button.titleLabel.font=[UIFont systemFontOfSize:17];
        
         [button addTarget:self action:@selector(changeClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [_scrollerView addSubview:button];
      
        if (i==1)
        {
          
            [self requestFindData:@"http://m.ymall.com/api/home/getFitting?page=1"];
            
          
            _findTableView=[[UITableView alloc]initWithFrame:CGRectMake((i-1)*320,0, 320, self.view.bounds.size.height) style:UITableViewStylePlain];
            
            _findTableView.delegate=self;
            
            _findTableView.dataSource=self;
            
            [_findTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
        
            _findTableView.rowHeight=250;
            
            [_contentScroller  addSubview:_findTableView];
            
     
        }
        
      //  else{
       
            
        //    NSString*string=[array objectAtIndex:i-1];
           
  
           // [self requestCYData:[NSString stringWithFormat:@" http://m.ymall.com/api/goods/search?id=%@&key=&page=1&tags=%E5%88%9B%E6%84%8F&frontpage=1",string]];
            
//       UITableView* _otherTableView=[[UITableView alloc]initWithFrame:CGRectMake((i-1)*320,0, 320, self.view.bounds.size.height) style:UITableViewStylePlain];
//            
//            
//            _otherTableView.delegate=self;
//        
//        _otherTableView.dataSource=self;
//       
//            _otherTableView.tag=100+i;
//
//        [_otherTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
//      
//            _otherTableView.rowHeight=250;
//      
//            [_contentScroller  addSubview:_otherTableView];
        
        
        
        
        
       // }
        
    if (i==1)
    {
        _whiteView=[[UIView alloc]init];
        
        _whiteView.backgroundColor=[UIColor greenColor];
        
        _whiteView.bounds=CGRectMake(sumWidth, 44, width, 30);
        
        [_scrollerView addSubview:_whiteView];
        
    }
        
     
        
        [_findTableView reloadData];
        
        
}
    
    
      _scrollerView.contentSize=CGSizeMake(9*320,44);
    
       _scrollerView.bounces=NO;
    
   


}

-(void)createTableView
{
    
    
     UITableView *_butyTableView=[[UITableView alloc]initWithFrame:CGRectMake(320,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _butyTableView.delegate=self;
    _butyTableView.dataSource=self;
    _butyTableView.tag=102;
    [_butyTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
    _butyTableView.rowHeight=250;
    [_contentScroller  addSubview:_butyTableView];
    [_butyTableView reloadData];
    UITableView *_eatTableView=[[UITableView alloc]initWithFrame:CGRectMake(320*2,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _eatTableView.delegate=self;
    _eatTableView.tag=103;
    _eatTableView.dataSource=self;
    [_eatTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
    _eatTableView.rowHeight=250;
    [_contentScroller  addSubview:_eatTableView];
    
    UITableView *_lifeTableView=[[UITableView alloc]initWithFrame:CGRectMake(320*3,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _lifeTableView.delegate=self;
    _lifeTableView.dataSource=self;
    _lifeTableView.tag=104;
    [_lifeTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
    _lifeTableView.rowHeight=250;
    [_contentScroller  addSubview:_lifeTableView];
    
    UITableView *_styleTableView=[[UITableView alloc]initWithFrame:CGRectMake(320*4,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _styleTableView.delegate=self;
    _styleTableView.dataSource=self;
    _styleTableView.tag=105;
    [_styleTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
     _eatTableView.rowHeight=250;
    [_contentScroller  addSubview:_styleTableView];
    
   UITableView * _boxTableView=[[UITableView alloc]initWithFrame:CGRectMake(320*5,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _boxTableView.delegate=self;
    _boxTableView.dataSource=self;
    _boxTableView.tag=106;
    [_boxTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
    _boxTableView.rowHeight=250;
    [_contentScroller  addSubview:_boxTableView];

    UITableView *_springTableView=[[UITableView alloc]initWithFrame:CGRectMake(320*6,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _springTableView.delegate=self;
    _springTableView.dataSource=self;
    _springTableView.tag=107;
    [_styleTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
    _springTableView.rowHeight=250;
    [_contentScroller  addSubview:_springTableView];
  
    UITableView *_theNewTableView=[[UITableView alloc]initWithFrame:CGRectMake(320*7,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _theNewTableView.delegate=self;
    _theNewTableView.dataSource=self;
    _theNewTableView.tag=108;
    [_theNewTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
    _theNewTableView.rowHeight=250;
    [_contentScroller  addSubview:_theNewTableView];
   
   UITableView * _theHotTableView=[[UITableView alloc]initWithFrame:CGRectMake(320*8,0, 320, self.view.bounds.size.height) style: UITableViewStylePlain];
    _theHotTableView.delegate=self;
    _theHotTableView.dataSource=self;
    _theHotTableView.tag=109;
    [_theHotTableView  registerClass:[CustomDaelingCell  class] forCellReuseIdentifier:@"cell"];
    _theHotTableView.rowHeight=250;
    [_contentScroller  addSubview:_theHotTableView];
    
    
    
    
    
    




}
#pragma mark---DataRequest

-(void)requestFindData:(NSString*)requestWithURL
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
    NSString *stringURL=requestWithURL;
    NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)stringURL, NULL, NULL,  kCFStringEncodingUTF8 );
    [manage GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
      
        baseClass=[ZYBaseClass  modelObjectWithDictionary:responseObject];
      
      
        
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];


}
-(void)requestCYData:(NSString*)requestWithURL
{
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
   
    NSString *stringURL=requestWithURL;
   
    NSString * encodedString = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)stringURL, NULL, NULL,  kCFStringEncodingUTF8 );
  
    [manage GET:encodedString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        cYBaseClass=[CYBaseClass  modelObjectWithDictionary:responseObject];
     
       
      
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        
    }];
    
    
}



-(void)changeClick:(UIButton*)sender
{
    
    
    float width = [self getWidthByClickedButtonTag:sender.tag];
    
    [UIView animateWithDuration:0.2 animations:^
     {
      
         _whiteView.center =CGPointMake(sender.center.x, sender.center.y + 20);
         
         _whiteView.bounds = CGRectMake(0, 0, width, 4);
         
    
     }];
    
    int index=sender.tag;
    
    
    _contentScroller.contentOffset=CGPointMake(index*320,0);
    
    
}




-(float)getWidthByClickedButtonTag:(int)tag
{
   
    NSString * title = [_titleArray objectAtIndex:tag-1];
    
    CGSize  size = [title sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:10] forKey:NSFontAttributeName]];
  
    return size.width ;
}



#pragma mark-- UIScrollViewDelegate



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView==_contentScroller)
    {

     [_scrollerView setContentOffset:(_contentScroller.contentOffset)];
     
    }
    else
    {
    
        [_contentScroller setContentOffset:_scrollerView.contentOffset];
    
    }
        
     
}







 #pragma mark-- UITableViewDelegate



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_findTableView)
    {
        ZYList*list=baseClass.data.list[section];
        
        
        
        return    list.list.count;
    }
      
    if (tableView==(UITableView*)[self.view viewWithTag:102])
    {
  
        
        ZYList*list=baseClass.data.list[section];
        
        
        
        return    list.list.count;
    //return     cYBaseClass.data.list.count;
      
  
    }
        
    return 10;
   
    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomDaelingCell*cell=[tableView  dequeueReusableCellWithIdentifier:@"cell"];
    
    
       cell=[[CustomDaelingCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
   
    if (tableView==_findTableView)
        
    {
        
        ZYList*list=baseClass.data.list[indexPath.section];
        
        NSDictionary*dic=list.list[indexPath.row];
        
      
       
        if (indexPath.section==0||indexPath.section==1||indexPath.section==3)
        {
            NSString*imageURL1=[dic objectForKey:@"cover_image"];
            
            [cell.pageImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",imageURL1]]];
        }else{
        
            
             NSString*imageURL=[dic valueForKey:@"goods_image"];
           
        
            [cell.pageImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",imageURL]]];
          

        
        }
       
        
        cell.titleLabel.text=[list.list[indexPath.row]valueForKey:@"description"];
        cell.name.text=[list.list[indexPath.row]valueForKey:@"goods_name"];
        cell.priceLabel.text=[list.list[indexPath.row]valueForKey:@"price"];
        cell.prefix.text=[list.list[indexPath.row]valueForKey:@"prefix"];
        return cell;
        
       
    }if (tableView==(UITableView*)[self.view viewWithTag:102])
    
    
    {
        
        
        CustomDaelingCell*cell=[tableView  dequeueReusableCellWithIdentifier:@"cell"];
        
        
        cell=[[CustomDaelingCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        

     
   [self  requestCYData: @"http://m.ymall.com/api/home/getFitting?page=1"];
      
        ZYList*list=baseClass.data.list[indexPath.section];
        //ZYList*list=cYBaseClass.data.list[indexPath.section];
        
        NSDictionary*dic=list.list[indexPath.row];
        
        NSString*  _otherImage=[dic  valueForKey:@"cover_image"];
        
        [cell.pageImage  setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_otherImage]]];
        
        cell.titleLabel.text=cell.titleLabel.text=[list.list[indexPath.row]valueForKey:@"description"];
      
        return cell;
    
    
    }
   if (tableView==(UITableView*)[self.view viewWithTag:103])
    {
       
        [self   requestFindData: @"http://m.ymall.com/api/goods/search?id=3305&key=&page=1&tags=%E6%9E%81%E8%87%B4&frontpage=1"];
    
    }
    if (tableView==(UITableView*)[self.view viewWithTag:103])
    {
        [self   requestCYData:  @"http://m.ymall.com/api/goods/search?id=3621&key=&page=1&tags=%E5%85%A8%E7%90%83&frontpage=1"];
    }
    if (tableView==(UITableView*)[self.view viewWithTag:104])
    {
        [self requestFindData:@"http://m.ymall.com/api/goods/search?id=1018&key=&page=1&tags=%E4%B8%AA%E6%80%A7&frontpage=1"];
    }
    if (tableView==(UITableView*)[self.view viewWithTag:105])
    {
        [self requestFindData:@"http://m.ymall.com/api/goods/search?id=1017&key=&page=1&tags=%E5%8C%85%E8%A2%8B&frontpage=1"];
    }
    if (tableView==(UITableView*)[self.view viewWithTag:106])
    {
        [self requestFindData:@"http://m.ymall.com/api/goods/search?id=1019&key=&page=1&tags=%E6%98%A5%E6%97%A5&frontpage=1"];
    }
    if (tableView==(UITableView*)[self.view viewWithTag:107])
    {
        [self requestFindData:@"http://m.ymall.com/api/goods/search?id=1020&sale_type=2&key=&page=1&frontpage=1"];
    }
    if (tableView==(UITableView*)[self.view viewWithTag:108])
    {
        [self requestFindData:@"http://m.ymall.com/api/goods/search?id=1021&sale_type=1&key=&page=1&frontpage=1"];
    }
    
    
    
        
    ZYList*list=baseClass.data.list[indexPath.section];
    
    NSDictionary*dic=list.list[indexPath.row];
   
    NSString*  _otherImage=[dic  valueForKey:@"cover_image"];
    
   [cell.pageImage  setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_otherImage]]];
    
    
    
        
              return cell;
    
    
   
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==_findTableView)
    {
        return 4;
        
    }
    else
    {
    return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{   if(tableView==_findTableView)
  {
    return 70;
   }
    
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView==_findTableView)
    {
                UIView*_titleView;
      
                ZYList *list=baseClass.data.list[section];
        
                _titleView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
                
                _titleView.backgroundColor=[UIColor  whiteColor];
                
                UIImageView*pointImage=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 40, 40)];
                [pointImage  setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",list.icon]]];
             
                 UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(70, 15, 200, 30)];
                
                label.text=list.txt;
                
                [_titleView addSubview:label];
                
                [_titleView addSubview:pointImage];
                
                return _titleView;
        
        
     
     }
    
    
   return nil;
   


    }
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYList*list=baseClass.data.list[indexPath.section];
    
    NSDictionary*dic=list.list[indexPath.row];
 
    NSString*string=[dic valueForKey:@"goods_id"];

      DetailViewController*darling=[[DetailViewController alloc]initWithURL:string];
   
     [self.navigationController  pushViewController:darling animated:YES];

}





-(void)dealloc{
     //  [_firstTableView release];
     //[_secondTableView release];
    [_contentScroller release];
    [_scrollerView release];
    [_dataArr  release];
    [super dealloc];




}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}






@end
