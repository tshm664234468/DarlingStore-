//
//  SubjectViewController.h
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDataModel.h"
@interface SubjectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{

   
    UIScrollView*scrollView;
    UITableView*_firstTableView;
    UITableView*_secondTableView;
    BaseClass*baseClass;
    //ZYBaseClass*baseClass;
    

}
@end
