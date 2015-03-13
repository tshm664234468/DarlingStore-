//
//  AboutDalingViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "AboutDalingViewController.h"

@interface AboutDalingViewController ()

@end

@implementation AboutDalingViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
   
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UIImageView*imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 120, 120)];
  
    
    imageView.image=[UIImage imageNamed:@"aboutIcon.png"];
  
   
    [self.view addSubview:imageView];
    
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
