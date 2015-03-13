//
//  LoginViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-8.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "LoginViewController.h"
#import "NextLoginView.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

//
    
  
    self.view.backgroundColor = [UIColor whiteColor];
    UIView*headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
  
    headerView.backgroundColor=[UIColor  purpleColor];
    [self.view addSubview:headerView];
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(120, 20, 80, 30)];
    label.text=@"登录注册";
    label.textColor=[UIColor  whiteColor];
    [headerView addSubview:label];
    UIImageView*darlingImage=[[UIImageView alloc]initWithFrame:CGRectMake(120, 84,80,60)];
    darlingImage.image=[UIImage imageNamed:@"AppIcon57x57.png"];
    [self.view addSubview:darlingImage];
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button  addTarget:self  action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(60, 174, 200, 30);
    [button  setTitle:@"登录" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor  purpleColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"i5_baitiaodi.png"] forState:UIControlStateNormal];
    [self.view  addSubview:button];
    UIButton*registBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn  addTarget:self  action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    registBtn.frame=CGRectMake(60, 240, 200, 30);
    [registBtn  setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    [registBtn  addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    registBtn.backgroundColor=[UIColor purpleColor];
    [self.view  addSubview:registBtn];
  
    UIButton*errorBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [errorBtn  addTarget:self  action:@selector(errorClick) forControlEvents:UIControlEventTouchUpInside];
    
    errorBtn.frame=CGRectMake(10, 20, 40, 40);
    
    [errorBtn setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    
    [errorBtn setBackgroundImage:[UIImage imageNamed:@"Cancel.png"] forState:UIControlStateNormal];
    [headerView addSubview:errorBtn];

    
    
    
   
}

-(void)loginClick
{
  
    
    NextLoginView*login=[[NextLoginView alloc] init];

    [self  presentViewController:login animated:YES completion:nil];
 
    [login release];
 

}
-(void)errorClick
{
    
   
    [self dismissViewControllerAnimated:YES completion:nil];
   


}
-(void)registerClick{

  
    NextLoginView*login=[[NextLoginView alloc] init];
    
    [self  presentViewController:login animated:YES completion:nil];
    [login release];
    
   


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
