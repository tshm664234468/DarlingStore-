//
//  OrderViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-8.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView*headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    
    
    headerView.backgroundColor=[UIColor  purpleColor];
    
   
    [self.view addSubview:headerView];
    
  
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(120, 20, 100, 30)];
    
  
    label.text=@"我的订单";
    
  
    label.textColor=[UIColor  whiteColor];
    
  
    [headerView addSubview:label];
   
    UIButton*errorBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
  
    [errorBtn  addTarget:self  action:@selector(errorClick) forControlEvents:UIControlEventTouchUpInside];
    
    
 
    errorBtn.frame=CGRectMake(10, 20, 40, 40);
    
    
  
    [errorBtn setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    
    
   
    [errorBtn setBackgroundImage:[UIImage imageNamed:@"Cancel.png"] forState:UIControlStateNormal];
    
    
    [headerView addSubview:errorBtn];
  

}

-(void)errorClick
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
