//
//  MyCenterViewController.m
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "MyCenterViewController.h"
#import "CustomerMyCenter.h"
#import "LoginViewController.h"
#import "CollectViewController.h"
#import "OrderViewController.h"
#import "MoreViewController.h"
#import "PhoneSelectViewController.h"
@interface MyCenterViewController ()

@end

@implementation MyCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    NSArray*pictureImageArr=@[@"myInfo_fav.png",@"myInfo_order.png",@"myInfo_purse.png",@"myInfo_shopCar.png",@"myInfo_more.png"];
   
    self.navigationItem.title=@"我的中心";
    
    for (int i=0; i<5; i++)
    {
       
        UIView*bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 74+i*(50+10), 320,50)];
        bgview.backgroundColor=[UIColor grayColor];
        [self.view addSubview:bgview];
     
        UIImageView*priceImage=[[UIImageView  alloc]initWithFrame:CGRectMake(20, 5, 30, 30)];
        priceImage.image=[UIImage imageNamed:[pictureImageArr objectAtIndex:i]];
      
       
        
        [bgview addSubview:priceImage];
        UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 60, 30)];
      
        if (i==0)
        {
            label.text=@"收藏";
        }
        if (i==1)
        {
            label.text=@"订单";
        }
        if (i==2)
        {
            label.text=@"钱包";
        }
        if (i==3)
        {
            label.text=@"购物车";
        }
        if (i==4)
        {
            label.text=@"更多";
        }
        
     
        
        [bgview addSubview:label];
        
        UIImageView*signImage=[[UIImageView  alloc]initWithFrame:CGRectMake(280, 20, 15, 15)];
        
        signImage.image=[UIImage imageNamed:@"orderConfirmTriangle.png"];
      
        [bgview addSubview:signImage];
        UIButton*Allbutton=[UIButton buttonWithType:UIButtonTypeCustom];
        Allbutton.frame=CGRectMake(0,0, 320,50);
        Allbutton.tag=i+1;
        Allbutton.backgroundColor=[UIColor clearColor];
        [Allbutton  addTarget:self action:@selector(pushClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgview addSubview:Allbutton];
        
        
        
        [label release];
        [priceImage release];
        [signImage release];
        [bgview release];
        
        
        
        
    }
    
   
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(80,400, 260, 30);
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
  
    
    
    
    
}
-(void)pushClick:(UIButton*)sender
{
  

    if (sender==(UIButton*)[self.view viewWithTag:1])
    {
        CollectViewController*collec=[[CollectViewController alloc]init];
        [self.navigationController pushViewController:collec animated:YES];
        [collec release];
   
    }if (sender==(UIButton*)[self.view viewWithTag:2])
    {
        UIActionSheet*action=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"手机号查询",@"登录查询", nil];
        [action  showInView:self.view];
        

    }
    
    if (sender==(UIButton*)[self.view viewWithTag:3])
    {
        
        LoginViewController*login=[[LoginViewController alloc] init];
        [self  presentViewController:login animated:YES completion:nil];
        [login release];
        
    }if (sender==(UIButton*)[self.view viewWithTag:4])
    {
                                
                                
}if (sender==(UIButton*)[self.view viewWithTag:5])
    {
        MoreViewController*controller=[[MoreViewController alloc]init];
       
        [self.navigationController  pushViewController:controller animated:YES];
        
        
    }
   

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    if (buttonIndex==0)
    {
        PhoneSelectViewController*phone=[[PhoneSelectViewController alloc]init];
   
        [self presentViewController:phone animated:YES completion:nil];
   
    }else{
    
    
        LoginViewController*login=[[LoginViewController alloc]init];
        [self  presentViewController:login animated:YES completion:nil];
    
    }



}
-(void)buttonClick{
   
    LoginViewController*login=[[LoginViewController alloc]init];

    [self presentViewController:login animated:YES completion:nil];
    


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 5;

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
   
       CustomerMyCenter*cell=[tableView  dequeueReusableCellWithIdentifier:@"cell"];
   
       cell=[[CustomerMyCenter alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    
        cell.signImageView.image=[UIImage imageNamed:@"orderConfirmTriangle.png"];
    
        if (indexPath.row==0)
          {
            
            cell.label.text=@"我的收藏";
              
            cell.pictureImage.image=[UIImage imageNamed:@"myInfo_fav.png"];
            
            
            
        }
        if (indexPath.row==1)
        {
            
            cell.label.text=@"我的订单";
            cell.pictureImage.image=[UIImage imageNamed:@"myInfo_order.png"];
            
            
            
        }
        if (indexPath.row==2)
        {
            
            cell.label.text=@"我的钱包";
            cell.pictureImage.image=[UIImage imageNamed:@"myInfo_purse.png"];
            
            
            
        }
    
        if (indexPath.row==3)
        {
            
            cell.label.text=@"购物车";
            
            cell.pictureImage.image=[UIImage imageNamed:@"myInfo_shopCar.png"];
            
            
        }
        if (indexPath.row==4)
        {
            
            cell.label.text=@"更多";
            
            cell.pictureImage.image=[UIImage imageNamed:@"myInfo_more.png"];
            
            
            
        }
    
    
    
    
    
    
    
   
    
   
    return cell;



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
