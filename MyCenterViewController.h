//
//  MyCenterViewController.h
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCenterViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>
{

    UITableView*_tableView;
    NSArray*array;

}
@end
