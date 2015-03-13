//
//  RightVC.h
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface RightVC : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

{
    
    UICollectionView*_collectionView;
    // NSMutableArray*_rightArray;
    // NSMutableArray*_leftArray;
    SortBaseClass*_baseClass;
    
    
    //数据源大数组
    NSArray *_datasourseArray;
    
}


@property (nonatomic,assign)int index;


@end
