//
//  ItemsCell.m
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "ItemsCell.h"
#import "UIImageView+WebCache.h"
@implementation ItemsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _imageView = [[UIImageView alloc] init];
        _imageView.frame=CGRectMake(10, 0, 300, 200);
        _imageView.layer.cornerRadius = 50;
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textColor = [UIColor purpleColor ];
        _titleLabel.font=[UIFont  systemFontOfSize:12];
        
        _titleLabel.frame=CGRectMake(10, 200, 260, 20);
        [self addSubview:_titleLabel];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.backgroundColor = [UIColor whiteColor];
        _priceLabel.textColor = [UIColor blackColor];
        _priceLabel.textColor=[UIColor redColor];
        _priceLabel.font=[UIFont  systemFontOfSize:12];
        
        _priceLabel.frame=CGRectMake(250, 200, 50, 30);
        [self addSubview:_priceLabel];
        
        _detailsLable = [[UILabel alloc] init];
        _detailsLable.backgroundColor = [UIColor whiteColor];
        _detailsLable.textColor = [UIColor blackColor];
        _detailsLable.font=[UIFont  systemFontOfSize:12];
        _detailsLable.tintColor=[UIColor blackColor];
        _detailsLable.frame=CGRectMake(10, 230, 300, 30);
        _detailsLable.numberOfLines=0;
        [self addSubview:_detailsLable];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setList:(ITEMList *)list
{
    
    _list=list;
    [_imageView setImageWithURL:[NSURL URLWithString:_list.coverImage]];
    
    _titleLabel.text=[NSString stringWithFormat:@"%@%@",_list.prefix,_list.shortGoodsName];
    _priceLabel.text=[NSString stringWithFormat:@"￥%@",_list.price];
    
    _detailsLable.text=[NSString stringWithFormat:@"%@",_list.listDescription];
    
    
    
    //  _titleLabel.font=[UIFont  systemFontOfSize:10];
    
    
    //_imageView.frame=CGRectMake(0, 0, 320, 200);
    
    // _titleLabel.frame=CGRectMake(0, 200, 300, 30);
    
}

@end
