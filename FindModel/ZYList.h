//
//  ZYList.h
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZYShows;

@interface ZYList : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *shares;
@property (nonatomic, retain) NSString *isDisplayBar;
@property (nonatomic, retain) NSString *titleDesc;
@property (nonatomic, assign) double goodsPeak;
@property (nonatomic, retain) NSString *viewWishes;
@property (nonatomic, retain) NSString *ifSpecial;
@property (nonatomic, retain) NSString *cateName;
@property (nonatomic, retain) NSString *goodsRank;
@property (nonatomic, retain) NSString *sku;
@property (nonatomic, retain) NSString *prefix;
@property (nonatomic, retain) NSString *stock;
@property (nonatomic, retain) NSString *shortGoodsName;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *activityId;
@property (nonatomic, retain) NSString *top;
@property (nonatomic, retain) NSString *activityKinds;
@property (nonatomic, retain) NSString *listDescription;
@property (nonatomic, retain) NSString *flashStock;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *newPrice;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSString *goodsImage;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *coverImage;
@property (nonatomic, retain) NSString *views;
@property (nonatomic, retain) NSString *txt;
@property (nonatomic, retain) NSString *sales;
@property (nonatomic, retain) NSString *goodsId;
@property (nonatomic, retain) NSString *defaultThumb;
@property (nonatomic, retain) NSString *oldPrice;
@property (nonatomic, retain) NSString *clickWord;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *saleType;
@property (nonatomic, retain) NSString *marketPrice;
@property (nonatomic, retain) NSString *wishes;
@property (nonatomic, retain) NSString *orders;
@property (nonatomic, retain) NSString *activityTxt;
@property (nonatomic, retain) NSString *erpId;
@property (nonatomic, retain) ZYShows *shows;
@property (nonatomic, retain) NSString *tags;
@property (nonatomic, retain) NSString *salesMonth;
@property (nonatomic, retain) NSString *limitBuyMun;
@property (nonatomic, assign) BOOL next;
@property (nonatomic, retain) NSString *defaultImage;
@property (nonatomic, assign) double shape;
@property (nonatomic, retain) NSString *goodsName;
@property (nonatomic, retain) NSArray *saleTypeMaps;
@property (nonatomic, retain) NSString *icon;
@property (nonatomic, retain) NSString *width;
@property (nonatomic, retain) NSString *brandName;
@property (nonatomic, retain) NSString *iconKey;
@property (nonatomic, retain) NSString *brandId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
