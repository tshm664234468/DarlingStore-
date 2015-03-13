//
//  CustomerAlertView.m
//  DarlingStore
//
//  Created by 123 on 15-3-8.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "CustomerAlertView.h"
#import "PhoneSelectViewController.h"
@implementation CustomerAlertView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self)
    {
        
        alertView=[[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height-50, 320, 70)];
       
        for (int i=0; i<3; i++)
        {
            UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
                         
            
            btn.frame=CGRectMake(0, i*(20+5),320, 20);
            btn.tag=i+1;
            [btn addTarget:self action:@selector(alertClick:) forControlEvents:UIControlEventTouchUpInside];
            [alertView addSubview:btn];
                          
        }
        [self addSubview:alertView];
    }
    

    return self;

}
-(void)alertClick:(UIButton*)sender
{
    if (sender==(UIButton*)[self  viewWithTag:1])
    {
        PhoneSelectViewController*phone=[[PhoneSelectViewController alloc] init];
   
        
        
    }




}

@end
