//
//  CollectionCell.m
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "CollectionCell.h"
#import "UIButton+WebCache.h"
#import "ItemsVC.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _button=[[UIButton alloc]init];
        _button.frame=self.bounds;
        
        [self addSubview:_button];
        _button.userInteractionEnabled = NO;
        
        //        _button.frame=self.frame;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        
        _titleLabel.frame = CGRectMake(_button.frame.origin.x, _button.frame.origin.y+self.bounds.size.height+10, self.bounds.size.width,20);
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
        
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */


-(void)setList:(SortList *)list
{
    NSLog(@"hnugyf");
    
    _list=list;
    
    [_button setBackgroundImageWithURL:[NSURL URLWithString:_list.imageUrl]];
    
    _titleLabel .text=list.title;
    
    
    _titleLabel.font=[UIFont  systemFontOfSize:10];
    _titleLabel.adjustsFontSizeToFitWidth=YES;
    _titleLabel.textColor=[UIColor blueColor];
    _titleLabel.backgroundColor=[UIColor clearColor];
    
    
    
}
//-(void)btnClick
//{
////    NSLog(@"------jgytftrdnng");
//
//  //  KindsViewController *kindVC=self.delegate;
//
//    ItemsVC*vc=[[ItemsVC alloc]init];
//   // UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:vc];
//  //  [ ]
//     
//    
//}
@end
