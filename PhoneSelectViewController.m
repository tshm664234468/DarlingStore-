//
//  PhoneSelectViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-8.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "PhoneSelectViewController.h"
#import "OrderViewController.h"
@interface PhoneSelectViewController ()

@end

@implementation PhoneSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor=[UIColor whiteColor];
   
    UIView*headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 64)];
    
  
    headerView.backgroundColor=[UIColor  purpleColor];
   
    [self.view addSubview:headerView];
   
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(120, 20, 100, 30)];
   
    label.text=@"手机号查询";
  
    label.textColor=[UIColor  whiteColor];
  
    [headerView addSubview:label];
    
    UIButton*errorBtn=[UIButton buttonWithType:UIButtonTypeCustom];
   
    [errorBtn  addTarget:self  action:@selector(errorClick) forControlEvents:UIControlEventTouchUpInside];
    
   
    errorBtn.frame=CGRectMake(10, 20, 40, 40);
    
   
    [errorBtn setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    
    
    [errorBtn setBackgroundImage:[UIImage imageNamed:@"Cancel.png"] forState:UIControlStateNormal];
   
    [headerView addSubview:errorBtn];
    
     filed=[[UITextField alloc]initWithFrame:CGRectMake(20,64+10, 280, 30)];
     filed.placeholder=@"请输入下单时使用的手机号";
     filed.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:filed];
    
    UITextField*sureFiled=[[UITextField alloc]initWithFrame:CGRectMake(20,64+10+40, 160, 30)];
    sureFiled.placeholder=@"请输入验证码";
    sureFiled.borderStyle=UITextBorderStyleRoundedRect;
    [self.view addSubview:sureFiled];
    UIButton*sureButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [sureButton setTitle:@"获取验证码" forState: UIControlStateNormal];
    [sureButton  setTitleColor:[UIColor  purpleColor] forState:UIControlStateNormal];
    [sureButton  addTarget:self action:@selector(sureButtonClick) forControlEvents: UIControlEventTouchUpInside];
    sureButton.frame=CGRectMake(170, 64+10+40, 320-170-10, 30);
   
    [self.view addSubview:sureButton];
    
    UIButton*loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"登录" forState: UIControlStateNormal];
    [loginButton  setTitleColor:[UIColor  whiteColor] forState:UIControlStateNormal];
    [loginButton  addTarget:self action:@selector(loginButtonClick) forControlEvents: UIControlEventTouchUpInside];
    loginButton.backgroundColor=[UIColor  purpleColor];
    loginButton.frame=CGRectMake(20, 64+10+40+30, 280, 30);
    
    [self.view addSubview:loginButton];
    
    
}
-(void)errorClick
{
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
-(void)loginButtonClick
{
   
    if (filed.text.length==0)
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"号码不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert show];
    }else{
    
    
        OrderViewController*order=[[OrderViewController alloc]init];
        
      [self  presentViewController:order animated:YES completion:nil];
    
    
    }
    


}

-(void)sureButtonClick{
   
    if (filed.text.length==0)
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"号码不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert show];
    }


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
