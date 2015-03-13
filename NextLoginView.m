//
//  NextLoginView.m
//  DarlingStore
//
//  Created by 123 on 15-3-8.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "NextLoginView.h"

@interface NextLoginView ()

@end

@implementation NextLoginView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIView*headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    
    headerView.backgroundColor=[UIColor  purpleColor];
    [self.view addSubview:headerView];
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(140, 20, 80, 30)];
    label.text=@"登录";
    label.textColor=[UIColor  whiteColor];
    [headerView addSubview:label];
   
    UIButton*backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
 
    
    backBtn.frame=CGRectMake(10, 20, 40, 40);
    
    
    [backBtn setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"bt_back.png"] forState:UIControlStateNormal];
   
    [headerView addSubview:backBtn];
    
    UIImageView*bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(60, 100, 200, 100)];
    bgImage.image=[UIImage imageNamed:@"i5_baitiaodi.png"];
    [self.view addSubview:bgImage];
    
    
    UILabel*nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 40, 50) ];
  
    nameLabel.text=@"账号:";
   
    [bgImage addSubview:nameLabel];
  
    UILabel*passLabel=[[UILabel alloc]initWithFrame:CGRectMake(5, 50, 40, 50) ];
    
    passLabel.text=@"密码:";
   
    
    [bgImage addSubview:passLabel];
   
    UITextField*nameFiled=[[UITextField alloc]initWithFrame:CGRectMake(50, 5, 150, 40)];
    nameFiled.userInteractionEnabled=YES;
   
    nameFiled.backgroundColor=[UIColor redColor];
    
    [bgImage addSubview:nameFiled];
    
    
    UITextField*passFiled=[[UITextField alloc]initWithFrame:CGRectMake(50, 50, 150, 50)];
   
    [bgImage addSubview:passFiled];
   
    UIButton*loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    
    loginBtn.frame=CGRectMake(200, 220, 60, 30);
    
    
    [loginBtn setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
   
    [loginBtn setTitle:@"登录" forState: UIControlStateNormal];
    loginBtn.backgroundColor=[UIColor  purpleColor];
   
    [headerView addSubview:loginBtn];




}

-(void)loginClick
{




}
-(void)backClick
{


    [self dismissViewControllerAnimated:YES completion:nil];


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
