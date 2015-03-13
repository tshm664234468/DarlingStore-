//
//  SearchCell.m
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.frame = CGRectMake(5,5,40,20);
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

@end
