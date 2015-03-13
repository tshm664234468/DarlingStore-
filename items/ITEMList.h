//
//  ITEMList.h
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEMSaleTypeInfo;

@interface ITEMList : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *defaultImage;
@property (nonatomic, retain) NSString *shortGoodsName;
@property (nonatomic, assign) double weight;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, assign) double ifSpecial;
@property (nonatomic, retain) NSArray *saleTypeMaps;
@property (nonatomic, retain) ITEMSaleTypeInfo *saleTypeInfo;
@property (nonatomic, retain) NSString *activityKinds;
@property (nonatomic, retain) NSString *tags;
@property (nonatomic, assign) double activityId;
@property (nonatomic, assign) double marketPrice;
@property (nonatomic, retain) NSString *goodsName;
@property (nonatomic, assign) double stock;
@property (nonatomic, assign) id region;
@property (nonatomic, assign) id country;
@property (nonatomic, retain) NSString *cateName;
@property (nonatomic, assign) double wishes;
@property (nonatomic, assign) double viewWishes;
@property (nonatomic, retain) NSArray *tagsArr;
@property (nonatomic, retain) NSString *prefix;
@property (nonatomic, retain) NSString *titleDesc;
@property (nonatomic, retain) NSString *goodsId;
@property (nonatomic, retain) NSString *defaultThumb;
@property (nonatomic, retain) NSString *brandName;
@property (nonatomic, retain) NSArray *saleType;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *activityTxt;
@property (nonatomic, retain) NSString *coverImage;
@property (nonatomic, retain) NSString *listDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
