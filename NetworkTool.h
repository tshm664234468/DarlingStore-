//
//  NetworkTool.h
//  DarlingStore
//
//  Created by User on 15-3-6.
//  Copyright (c) 2015年 王文波 And 武 艳飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkTool : NSObject


+ (void)requestSortListWithCompletionBlock:(void(^)(NSDictionary *dic))block;

+(void)requestListUrl:(NSString*)urlstr andListId:(NSString*)listid completionBlock:(void(^)(NSDictionary *dic))block;

+(void)requestStartUrl:(NSString*)urlTags andId:(NSString*)exId completionBlock:(void(^)(NSDictionary *dic))block;

+(void)requestDetailsUrl:(NSString*)goods_id completionBlock:(void(^)(NSDictionary *dic))block;
@end
