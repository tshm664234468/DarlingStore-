//
//  CollectionCell.h
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
#import "KindsViewController.h"

@interface CollectionCell : UICollectionViewCell

{
    
    UIButton*_button;
    UILabel *_titleLabel;
    
    
}



@property (nonatomic,retain) SortList*list ;

@end
