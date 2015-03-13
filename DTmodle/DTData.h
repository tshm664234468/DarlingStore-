//
//  DTData.h
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DTBrands, DTBrand, DTSameBrand, DTComments, DTMoreLove, DTHuodong, DTKeywords;

@interface DTData : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *shares;
@property (nonatomic, retain) NSString *costPrice;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, retain) NSString *titleDesc;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSString *commentsCount;
@property (nonatomic, retain) NSString *viewWishes;
@property (nonatomic, retain) NSString *ifSpecial;
@property (nonatomic, retain) NSArray *moreSale;
@property (nonatomic, retain) NSString *cateName;
@property (nonatomic, retain) NSString *goodsRank;
@property (nonatomic, retain) NSString *recommend;
@property (nonatomic, retain) NSString *sku;
@property (nonatomic, retain) NSString *colorId;
@property (nonatomic, retain) NSString *cateName2;
@property (nonatomic, retain) NSString *cateId1;
@property (nonatomic, retain) NSString *prefix;
@property (nonatomic, assign) id freightTemplateId;
@property (nonatomic, retain) NSString *stock;
@property (nonatomic, retain) NSString *goodsPeak;
@property (nonatomic, retain) NSString *shortGoodsName;
@property (nonatomic, retain) NSString *cateId2;
@property (nonatomic, retain) NSString *cateId;
@property (nonatomic, retain) NSString *activityId;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *activityKinds;
@property (nonatomic, retain) NSString *dataDescription;
@property (nonatomic, retain) NSString *packageImage;
@property (nonatomic, retain) NSArray *moreProperty;
@property (nonatomic, retain) NSString *sentImage;
@property (nonatomic, retain) DTBrands *brands;
@property (nonatomic, retain) NSString *videoUrl;
@property (nonatomic, retain) DTBrand *brand;
@property (nonatomic, retain) NSArray *promise;
@property (nonatomic, retain) NSArray *special;
@property (nonatomic, assign) double price;
@property (nonatomic, retain) NSString *coverImageHeight;
@property (nonatomic, retain) NSString *coverImage;
@property (nonatomic, retain) NSString *homeSort;
@property (nonatomic, retain) NSString *views;
@property (nonatomic, retain) NSString *suffix;
@property (nonatomic, retain) NSString *utime;
@property (nonatomic, retain) NSString *adFooter;
@property (nonatomic, retain) DTSameBrand *sameBrand;
@property (nonatomic, retain) NSString *sales;
@property (nonatomic, retain) NSString *region;
@property (nonatomic, retain) NSString *goodsId;
@property (nonatomic, retain) NSString *defaultThumb;
@property (nonatomic, retain) NSString *country;
@property (nonatomic, retain) NSString *saleTime;
@property (nonatomic, retain) NSString *ifCodpay;
@property (nonatomic, retain) NSString *saleType;
@property (nonatomic, retain) NSString *styleId;
@property (nonatomic, assign) double marketPrice;
@property (nonatomic, retain) NSString *coverImageWidth;
@property (nonatomic, retain) NSString *erpId;
@property (nonatomic, retain) NSString *ctime;
@property (nonatomic, retain) NSString *wishes;
@property (nonatomic, retain) NSString *orders;
@property (nonatomic, retain) NSString *storeId;
@property (nonatomic, retain) NSString *tags;
@property (nonatomic, retain) DTComments *comments;
@property (nonatomic, retain) NSString *homeShow;
@property (nonatomic, retain) NSString *salesMonth;
@property (nonatomic, retain) NSString *utags;
@property (nonatomic, retain) NSString *detailBigImages;
@property (nonatomic, retain) DTMoreLove *moreLove;
@property (nonatomic, retain) NSString *defaultImage;
@property (nonatomic, retain) NSString *shareDesc;
@property (nonatomic, retain) NSString *goodsName;
@property (nonatomic, retain) NSString *sexPoint;
@property (nonatomic, retain) NSString *ifShowBrandGoods;
@property (nonatomic, assign) id sameStyle;
@property (nonatomic, retain) NSString *isOfferPackage;
@property (nonatomic, retain) DTHuodong *huodong;
@property (nonatomic, retain) DTKeywords *keywords;
@property (nonatomic, retain) NSString *isMainGoods;
@property (nonatomic, retain) NSArray *images;
@property (nonatomic, retain) NSString *shareTitle;
@property (nonatomic, retain) NSString *brandName;
@property (nonatomic, assign) id bar;
@property (nonatomic, retain) NSString *canReturn;
@property (nonatomic, assign) BOOL notified;
@property (nonatomic, retain) NSString *cateName1;
@property (nonatomic, retain) NSString *brandId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
