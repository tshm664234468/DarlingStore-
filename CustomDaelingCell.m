//
//  CustomDaelingCell.m
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "CustomDaelingCell.h"

@implementation CustomDaelingCell

- (void)awakeFromNib {
  
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 0,280, 160)];
        self.pageImage=imageView;
        [self addSubview:_pageImage];
        
        
        UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(20, 190, 280, 60)];
        label.numberOfLines=0;
        label.font=[UIFont systemFontOfSize:12];
        self.titleLabel=label;
        [self addSubview:_titleLabel];
        UILabel*prefix=[[UILabel alloc]initWithFrame:CGRectMake(20, 160,120, 30)];
        prefix.font=[UIFont systemFontOfSize:13];
        prefix.textColor=[UIColor purpleColor];
        UILabel *priceLabel=[[UILabel alloc]initWithFrame:CGRectMake(240, 160, 40, 30)];
        priceLabel.font=[UIFont systemFontOfSize:13];
        priceLabel.textColor=[UIColor purpleColor];
        self.priceLabel=priceLabel;
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(140, 160,100, 30)];
        nameLabel.font=[UIFont systemFontOfSize:13];
        nameLabel.textColor=[UIColor purpleColor];
        
        self.name=nameLabel;
        
        self.prefix=prefix;
        
        [self addSubview:priceLabel];
        
        [self addSubview:prefix];
        
        [self addSubview:nameLabel];
        
        
    }
    
    return self;



}



-(void)dealloc
{
    [_name release];
    [_prefix release];
    [_priceLabel release];
    [_titleLabel release];
    [_pageImage release];
    [super dealloc];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
