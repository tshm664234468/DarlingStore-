//
//  ViewController.h
//  DarlingStore
//
//  Created by 123 on 15-3-5.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDataModel.h"
#import "GXDataModels.h"
@interface ViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
   
       NSArray *_titleArray;
       UIScrollView* _scrollerView;
       UIView* _whiteView;
       UITableView *_findTableView;
    

    //       UITableView *_butyTableView;
//       UITableView*_eatTableView;
//       UITableView*_lifeTableView;
//       UITableView *_styleTableView;
//       UITableView*_boxTableView;
//       UITableView *_springTableView;
//       UITableView*_theNewTableView;
//       UITableView *_theHotTableView;
       UIScrollView *_contentScroller;
   
    
    
       NSMutableArray*_dataArr;
    
       ZYBaseClass*baseClass;
       CYBaseClass*cYBaseClass;
     
   
    
    
}
@end
