//
//  DetailsViewController.h
//  DarlingStore
//
//  Created by 123 on 15-3-9.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController
@property(nonatomic,retain)NSString*url;
@property(nonatomic,retain)NSString*titleText;
-(id)initWithURL:(NSString*)URL withTitle:(NSString*)titleText;

@end
