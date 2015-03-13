//
//  DetailViewController.h
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllDataModel.h"
#import "DataModels.h"
@interface DetailViewController : UIViewController
{
    
 
    DTBaseClass*_baseClass;
    
    UIScrollView*_scrollView;
    
}


@property(nonatomic,retain)ITEMList *iList;

@property(nonatomic,retain)NSString*string;

-(id)initWithURL:(NSString*)string;




//@property(nonatomic,retain)DTData*data;
@end
