//
//  CustomerPublicCell.m
//  DarlingStore
//
//  Created by 123 on 15-3-6.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "CustomerPublicCell.h"

@implementation CustomerPublicCell

- (void)awakeFromNib {
   
   
   
    
    
    
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
    
      
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10,280,180)];
      
        self.pageView=imageView;
        
        [self addSubview:_pageView];
        
       
    }
    return self;


}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
