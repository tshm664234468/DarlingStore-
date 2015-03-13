//
//  DTList.h
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DTList : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *coverImage;
@property (nonatomic, retain) NSString *shortGoodsName;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *defaultImage;
@property (nonatomic, retain) NSString *ifSpecial;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *goodsName;
@property (nonatomic, retain) NSString *commentsTime;
@property (nonatomic, assign) id images;
@property (nonatomic, retain) NSArray *replyList;
@property (nonatomic, retain) NSString *gradeDesc;
@property (nonatomic, retain) NSString *grade;
@property (nonatomic, retain) NSString *prefix;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *width;
@property (nonatomic, retain) NSString *defaultThumb;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSString *goodsId;
@property (nonatomic, retain) NSString *nickName;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *avator;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *imageUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
