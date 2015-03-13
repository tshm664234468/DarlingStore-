//
//  PictureCell.m
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "PictureCell.h"

@implementation PictureCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        for ( int i=0; i<4; i++)
        {
            int x=10+i%2*10;
            int y=10+i%2*10;
            
            UIImageView*ImageView=[[UIImageView alloc]initWithFrame:CGRectMake(x, y, 150, 100)];
            self.imageView=ImageView;
            [self addSubview:ImageView];
            
            UIButton*button=[[UIButton alloc]initWithFrame:CGRectMake(x, y, 150, 100)];
            self.button=button;
            [ImageView addSubview:button];
      
        
        
        }
        
        
        
        
        
        
        
    }

    return self;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

  
}

@end
