//
//  CustomerMyCenter.m
//  DarlingStore
//
//  Created by 123 on 15-3-8.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "CustomerMyCenter.h"

@implementation CustomerMyCenter

- (void)awakeFromNib {
 
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
         UIImageView*bgImageView=[[UIImageView   alloc]initWithFrame:CGRectMake(0, 10, 320, 60)];
        self.bgImageView=bgImageView;
        [self addSubview:bgImageView];
        UIImageView*image=[[UIImageView   alloc]initWithFrame:CGRectMake(20, 0, 30, 30)];
      
        self.pictureImage=image;
        
        [bgImageView addSubview:image];
        
        UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(70, 0, 60, 40)];
        label.font=[UIFont systemFontOfSize:14];
        self.label=label;
        [bgImageView addSubview:label];
         UIImageView*signImageView=[[UIImageView   alloc]initWithFrame:CGRectMake(290, 10, 10, 10)];
       
        self.signImageView=signImageView;
        
        [bgImageView addSubview:signImageView];
        
        
    }

    return self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
