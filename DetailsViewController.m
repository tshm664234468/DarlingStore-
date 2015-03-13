//
//  DetailsViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
-(id)initWithURL:(NSString*)URL withTitle:(NSString*)titleText
{
    self=[super init];
    if(self)
    {
       
        self.url=URL;
        self.titleText=titleText;
   
    }
  
    return self;

 }
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.navigationItem.title=[NSString stringWithFormat:@"%@",self.titleText];
    
    
    self.view.backgroundColor=[UIColor  whiteColor];
    
   
    UIWebView*web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.bounds.size.height-64)];
    
    
    NSURL *strURL=[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.url]];
    
    NSURLRequest*request=[NSURLRequest requestWithURL:strURL];
    
    [web  loadRequest:request];
    
    [self.view addSubview:web];
   
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
