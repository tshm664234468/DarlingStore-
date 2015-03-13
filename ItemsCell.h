//
//  ItemsCell.h
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface ItemsCell : UITableViewCell

{
    
    
    UIImageView *_imageView;
    UILabel *_titleLabel;
    UILabel*_priceLabel;
    UILabel*_detailsLable;
}

@property (nonatomic,strong) ITEMList*list;

@end
