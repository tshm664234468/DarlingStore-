//
//  SearchVC.h
//  DarlingStore
//
//  Created by User on 15-3-10.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

{
    
    UICollectionView*_collectionView;
    NSArray*_searchArray;
}

@end
