//
//  CollectionViewController.h
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYDataModels.h"
@interface CollectionViewController : UICollectionViewController
{

    ZYBaseClass*baseClass;

}
@property (nonatomic, assign) int index;
@property(nonatomic,assign)UICollectionViewFlowLayout*layout;
@property(nonatomic,retain)NSMutableArray*_dataArray;
@property (nonatomic, strong) id delegate;

@end




@protocol CollectionViewControllerDelegate <NSObject>

- (void)CollectionView:(UICollectionView *)collectionView scrollDirection:(BOOL)isDown;


@end
