//
//  MoreViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "MoreViewController.h"
#import "AboutDalingViewController.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor=[UIColor whiteColor];
    NSArray*array=@[@"more_bt_aboutUs.png",@"more_bt_appCommend.png",@"more_bt_checkVersion.png",@"more_bt_feedBack.png",@"more_bt_inviteFriends.png",@"more_bt_setting.png"];
    
    
    for (int i=0; i<6; i++)
    {
        int x=10+i%4*80;
        int y=64+20+i/4*90;
        
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(x, y, 70, 70)];
       
         NSString*string=[array objectAtIndex:i];
        
         btn.tag=i+1;
        
        [btn setBackgroundImage:[UIImage imageNamed:[NSString  stringWithFormat:@"%@",string]] forState:  UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
    
    
    
    
}
-(void)btnClick:(UIButton*)sender
{
    if (sender==(UIButton*)[self.view viewWithTag:1])
    {
        AboutDalingViewController*about=[[AboutDalingViewController alloc]init];
        [self.navigationController  pushViewController:about animated:YES];
    
    
    }if(sender==(UIButton*)[self.view viewWithTag:2])
      
    {
    
    }if (sender==(UIButton*)[self.view viewWithTag:3])
    {
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"发现新版本" message:@"1.增加了商品评价功能口碑好更放心\n 2. 达令新年第一版，更多惊喜等你发现" delegate:self cancelButtonTitle:@"以后再说" otherButtonTitles:@"现在升级", nil];
       
        [alert show];
        
    
    }


}

- (void)didReceiveMemoryWarning
{
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
