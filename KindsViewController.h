//
//  KindsViewController.h
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface KindsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView*_table;
    
    NSArray             *_imgArray;
    NSArray             *_hImgArray;
    
    int                 _currentSelectRow;
    
    
}
@property(nonatomic,retain) SortData*data;
@end
