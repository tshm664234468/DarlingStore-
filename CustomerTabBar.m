//
//  CustomerTabBar.m
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "CustomerTabBar.h"

#import "ViewController .h"
#import "KindsViewController.h"
#import "SubjectViewController.h"
#import "MyCenterViewController.h"
@implementation CustomerTabBar

-(void)viewDidLoad{
    [super viewDidLoad];
    tabArray=[[NSArray alloc]initWithObjects:@"达令",@"分类",@"专题",@"我的", nil];
   
    ViewController*darlingView=[[ViewController alloc]init];
   // darlingView.view.backgroundColor=[UIColor   redColor];
     
    UINavigationController*darlingNavigation=[[UINavigationController alloc]initWithRootViewController:darlingView];

    KindsViewController*kindsView=[[KindsViewController alloc]init];
    UINavigationController *kindsNavigation=[[UINavigationController alloc]initWithRootViewController:kindsView];
    
    SubjectViewController*subjectView=[[SubjectViewController alloc]init];
   
    UINavigationController *subjectNavigation=[[UINavigationController alloc]initWithRootViewController:subjectView];
    
    
    MyCenterViewController*centerView=[[MyCenterViewController alloc]init];
   
    UINavigationController *centerNavigation=[[UINavigationController alloc]initWithRootViewController:centerView];
    
    NSArray*navigationArray=@[darlingNavigation,kindsNavigation,subjectNavigation,centerNavigation];
  
    [self setViewControllers:navigationArray];
    
    
    [self  customTabBar];
    
    [darlingView release];
    [darlingNavigation release];
    [kindsView release];
    [kindsNavigation release];
    [subjectView release];
    [subjectNavigation release];
    [centerView release];
    [centerNavigation release];


}
-(void)customTabBar
{
    _tabBarBackgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-49, self.view.bounds.size.width, 49)];
    [self.view addSubview:_tabBarBackgroundView];
    int intervalX=self.view.bounds.size.width/4;
    for (int i=0; i<4; i++)
    {
        UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(15+intervalX*i, 25, 64, 20)];
        label.text=[tabArray  objectAtIndex:i];
        label.textColor=[UIColor  purpleColor];
        label.font=[UIFont systemFontOfSize:10];
        [_tabBarBackgroundView addSubview:label];
        
     
        UIImageView*imageView=[[UIImageView  alloc]initWithFrame:CGRectMake(intervalX*i+15, 5, 20, 20)];
       
      
        imageView.tag=i+11;
        
    if (i==0)
       {
           
    [imageView  setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab%dH.png",i+1]]];
        }else{
      
            [imageView  setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab%d.png",i+1]]];
        
        
        }
        
        
        [_tabBarBackgroundView   addSubview:imageView];
        [imageView  release];
        
        
    }

    for (int i = 0; i < 4; i++)
    {
       
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(intervalX*i, 0, intervalX , 49);
        btn.tag = i+1;
      
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarBackgroundView addSubview:btn];
        
      
        
    }
  
    
    

}

-(void)btnClick:(UIButton*)sender{
    static  int selectBtn=1;
    self.selectedIndex=sender.tag-1;
    
    if (selectBtn==sender.tag)
    {
        return;
    }
    UIImageView *btn1 = (UIImageView *)[self.view viewWithTag:sender.tag + 10];
    
    [btn1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab%dH",sender.tag]] ];

    UIImageView *btn = (UIImageView *)[self.view viewWithTag:selectBtn + 10];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab%d",selectBtn]] ];
    
    selectBtn =sender.tag;
  

}



-(void)dealloc
{
    
  //  [tabArray release];
  //  [_tabBarBackgroundView release];
    [super dealloc];


}
@end
