//
//  DTData.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTData.h"
#import "DTMoreSale.h"
#import "DTMoreProperty.h"
#import "DTBrands.h"
#import "DTBrand.h"
#import "DTPromise.h"
#import "DTSpecial.h"
#import "DTSameBrand.h"
#import "DTComments.h"
#import "DTMoreLove.h"
#import "DTHuodong.h"
#import "DTKeywords.h"
#import "DTImages.h"


NSString *const kDTDataShares = @"shares";
NSString *const kDTDataCostPrice = @"cost_price";
NSString *const kDTDataLiked = @"liked";
NSString *const kDTDataTitleDesc = @"title_desc";
NSString *const kDTDataSex = @"sex";
NSString *const kDTDataCommentsCount = @"comments_count";
NSString *const kDTDataViewWishes = @"view_wishes";
NSString *const kDTDataIfSpecial = @"if_special";
NSString *const kDTDataMoreSale = @"more_sale";
NSString *const kDTDataCateName = @"cate_name";
NSString *const kDTDataGoodsRank = @"goods_rank";
NSString *const kDTDataRecommend = @"recommend";
NSString *const kDTDataSku = @"sku";
NSString *const kDTDataColorId = @"color_id";
NSString *const kDTDataCateName2 = @"cate_name_2";
NSString *const kDTDataCateId1 = @"cate_id_1";
NSString *const kDTDataPrefix = @"prefix";
NSString *const kDTDataFreightTemplateId = @"freight_template_id";
NSString *const kDTDataStock = @"stock";
NSString *const kDTDataGoodsPeak = @"goods_peak";
NSString *const kDTDataShortGoodsName = @"short_goods_name";
NSString *const kDTDataCateId2 = @"cate_id_2";
NSString *const kDTDataCateId = @"cate_id";
NSString *const kDTDataActivityId = @"activity_id";
NSString *const kDTDataStatus = @"status";
NSString *const kDTDataActivityKinds = @"activity_kinds";
NSString *const kDTDataDescription = @"description";
NSString *const kDTDataPackageImage = @"package_image";
NSString *const kDTDataMoreProperty = @"more_property";
NSString *const kDTDataSentImage = @"sent_image";
NSString *const kDTDataBrands = @"brands";
NSString *const kDTDataVideoUrl = @"video_url";
NSString *const kDTDataBrand = @"brand";
NSString *const kDTDataPromise = @"promise";
NSString *const kDTDataSpecial = @"special";
NSString *const kDTDataPrice = @"price";
NSString *const kDTDataCoverImageHeight = @"cover_image_height";
NSString *const kDTDataCoverImage = @"cover_image";
NSString *const kDTDataHomeSort = @"home_sort";
NSString *const kDTDataViews = @"views";
NSString *const kDTDataSuffix = @"suffix";
NSString *const kDTDataUtime = @"utime";
NSString *const kDTDataAdFooter = @"ad_footer";
NSString *const kDTDataSameBrand = @"same_brand";
NSString *const kDTDataSales = @"sales";
NSString *const kDTDataRegion = @"region";
NSString *const kDTDataGoodsId = @"goods_id";
NSString *const kDTDataDefaultThumb = @"default_thumb";
NSString *const kDTDataCountry = @"country";
NSString *const kDTDataSaleTime = @"sale_time";
NSString *const kDTDataIfCodpay = @"if_codpay";
NSString *const kDTDataSaleType = @"sale_type";
NSString *const kDTDataStyleId = @"style_id";
NSString *const kDTDataMarketPrice = @"market_price";
NSString *const kDTDataCoverImageWidth = @"cover_image_width";
NSString *const kDTDataErpId = @"erp_id";
NSString *const kDTDataCtime = @"ctime";
NSString *const kDTDataWishes = @"wishes";
NSString *const kDTDataOrders = @"orders";
NSString *const kDTDataStoreId = @"store_id";
NSString *const kDTDataTags = @"tags";
NSString *const kDTDataComments = @"comments";
NSString *const kDTDataHomeShow = @"home_show";
NSString *const kDTDataSalesMonth = @"sales_month";
NSString *const kDTDataUtags = @"utags";
NSString *const kDTDataDetailBigImages = @"detail_big_images";
NSString *const kDTDataMoreLove = @"more_love";
NSString *const kDTDataDefaultImage = @"default_image";
NSString *const kDTDataShareDesc = @"share_desc";
NSString *const kDTDataGoodsName = @"goods_name";
NSString *const kDTDataSexPoint = @"sex_point";
NSString *const kDTDataIfShowBrandGoods = @"if_show_brand_goods";
NSString *const kDTDataSameStyle = @"same_style";
NSString *const kDTDataIsOfferPackage = @"is_offer_package";
NSString *const kDTDataHuodong = @"huodong";
NSString *const kDTDataKeywords = @"keywords";
NSString *const kDTDataIsMainGoods = @"is_main_goods";
NSString *const kDTDataImages = @"images";
NSString *const kDTDataShareTitle = @"share_title";
NSString *const kDTDataBrandName = @"brand_name";
NSString *const kDTDataBar = @"bar";
NSString *const kDTDataCanReturn = @"can_return";
NSString *const kDTDataNotified = @"notified";
NSString *const kDTDataCateName1 = @"cate_name_1";
NSString *const kDTDataBrandId = @"brand_id";


@interface DTData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTData

@synthesize shares = _shares;
@synthesize costPrice = _costPrice;
@synthesize liked = _liked;
@synthesize titleDesc = _titleDesc;
@synthesize sex = _sex;
@synthesize commentsCount = _commentsCount;
@synthesize viewWishes = _viewWishes;
@synthesize ifSpecial = _ifSpecial;
@synthesize moreSale = _moreSale;
@synthesize cateName = _cateName;
@synthesize goodsRank = _goodsRank;
@synthesize recommend = _recommend;
@synthesize sku = _sku;
@synthesize colorId = _colorId;
@synthesize cateName2 = _cateName2;
@synthesize cateId1 = _cateId1;
@synthesize prefix = _prefix;
@synthesize freightTemplateId = _freightTemplateId;
@synthesize stock = _stock;
@synthesize goodsPeak = _goodsPeak;
@synthesize shortGoodsName = _shortGoodsName;
@synthesize cateId2 = _cateId2;
@synthesize cateId = _cateId;
@synthesize activityId = _activityId;
@synthesize status = _status;
@synthesize activityKinds = _activityKinds;
@synthesize dataDescription = _dataDescription;
@synthesize packageImage = _packageImage;
@synthesize moreProperty = _moreProperty;
@synthesize sentImage = _sentImage;
@synthesize brands = _brands;
@synthesize videoUrl = _videoUrl;
@synthesize brand = _brand;
@synthesize promise = _promise;
@synthesize special = _special;
@synthesize price = _price;
@synthesize coverImageHeight = _coverImageHeight;
@synthesize coverImage = _coverImage;
@synthesize homeSort = _homeSort;
@synthesize views = _views;
@synthesize suffix = _suffix;
@synthesize utime = _utime;
@synthesize adFooter = _adFooter;
@synthesize sameBrand = _sameBrand;
@synthesize sales = _sales;
@synthesize region = _region;
@synthesize goodsId = _goodsId;
@synthesize defaultThumb = _defaultThumb;
@synthesize country = _country;
@synthesize saleTime = _saleTime;
@synthesize ifCodpay = _ifCodpay;
@synthesize saleType = _saleType;
@synthesize styleId = _styleId;
@synthesize marketPrice = _marketPrice;
@synthesize coverImageWidth = _coverImageWidth;
@synthesize erpId = _erpId;
@synthesize ctime = _ctime;
@synthesize wishes = _wishes;
@synthesize orders = _orders;
@synthesize storeId = _storeId;
@synthesize tags = _tags;
@synthesize comments = _comments;
@synthesize homeShow = _homeShow;
@synthesize salesMonth = _salesMonth;
@synthesize utags = _utags;
@synthesize detailBigImages = _detailBigImages;
@synthesize moreLove = _moreLove;
@synthesize defaultImage = _defaultImage;
@synthesize shareDesc = _shareDesc;
@synthesize goodsName = _goodsName;
@synthesize sexPoint = _sexPoint;
@synthesize ifShowBrandGoods = _ifShowBrandGoods;
@synthesize sameStyle = _sameStyle;
@synthesize isOfferPackage = _isOfferPackage;
@synthesize huodong = _huodong;
@synthesize keywords = _keywords;
@synthesize isMainGoods = _isMainGoods;
@synthesize images = _images;
@synthesize shareTitle = _shareTitle;
@synthesize brandName = _brandName;
@synthesize bar = _bar;
@synthesize canReturn = _canReturn;
@synthesize notified = _notified;
@synthesize cateName1 = _cateName1;
@synthesize brandId = _brandId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.shares = [self objectOrNilForKey:kDTDataShares fromDictionary:dict];
            self.costPrice = [self objectOrNilForKey:kDTDataCostPrice fromDictionary:dict];
            self.liked = [[self objectOrNilForKey:kDTDataLiked fromDictionary:dict] boolValue];
            self.titleDesc = [self objectOrNilForKey:kDTDataTitleDesc fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kDTDataSex fromDictionary:dict];
            self.commentsCount = [self objectOrNilForKey:kDTDataCommentsCount fromDictionary:dict];
            self.viewWishes = [self objectOrNilForKey:kDTDataViewWishes fromDictionary:dict];
            self.ifSpecial = [self objectOrNilForKey:kDTDataIfSpecial fromDictionary:dict];
    NSObject *receivedDTMoreSale = [dict objectForKey:kDTDataMoreSale];
    NSMutableArray *parsedDTMoreSale = [NSMutableArray array];
    if ([receivedDTMoreSale isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDTMoreSale) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDTMoreSale addObject:[DTMoreSale modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDTMoreSale isKindOfClass:[NSDictionary class]]) {
       [parsedDTMoreSale addObject:[DTMoreSale modelObjectWithDictionary:(NSDictionary *)receivedDTMoreSale]];
    }

    self.moreSale = [NSArray arrayWithArray:parsedDTMoreSale];
            self.cateName = [self objectOrNilForKey:kDTDataCateName fromDictionary:dict];
            self.goodsRank = [self objectOrNilForKey:kDTDataGoodsRank fromDictionary:dict];
            self.recommend = [self objectOrNilForKey:kDTDataRecommend fromDictionary:dict];
            self.sku = [self objectOrNilForKey:kDTDataSku fromDictionary:dict];
            self.colorId = [self objectOrNilForKey:kDTDataColorId fromDictionary:dict];
            self.cateName2 = [self objectOrNilForKey:kDTDataCateName2 fromDictionary:dict];
            self.cateId1 = [self objectOrNilForKey:kDTDataCateId1 fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kDTDataPrefix fromDictionary:dict];
            self.freightTemplateId = [self objectOrNilForKey:kDTDataFreightTemplateId fromDictionary:dict];
            self.stock = [self objectOrNilForKey:kDTDataStock fromDictionary:dict];
            self.goodsPeak = [self objectOrNilForKey:kDTDataGoodsPeak fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kDTDataShortGoodsName fromDictionary:dict];
            self.cateId2 = [self objectOrNilForKey:kDTDataCateId2 fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kDTDataCateId fromDictionary:dict];
            self.activityId = [self objectOrNilForKey:kDTDataActivityId fromDictionary:dict];
            self.status = [self objectOrNilForKey:kDTDataStatus fromDictionary:dict];
            self.activityKinds = [self objectOrNilForKey:kDTDataActivityKinds fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kDTDataDescription fromDictionary:dict];
            self.packageImage = [self objectOrNilForKey:kDTDataPackageImage fromDictionary:dict];
    NSObject *receivedDTMoreProperty = [dict objectForKey:kDTDataMoreProperty];
    NSMutableArray *parsedDTMoreProperty = [NSMutableArray array];
    if ([receivedDTMoreProperty isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDTMoreProperty) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDTMoreProperty addObject:[DTMoreProperty modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDTMoreProperty isKindOfClass:[NSDictionary class]]) {
       [parsedDTMoreProperty addObject:[DTMoreProperty modelObjectWithDictionary:(NSDictionary *)receivedDTMoreProperty]];
    }

    self.moreProperty = [NSArray arrayWithArray:parsedDTMoreProperty];
            self.sentImage = [self objectOrNilForKey:kDTDataSentImage fromDictionary:dict];
            self.brands = [DTBrands modelObjectWithDictionary:[dict objectForKey:kDTDataBrands]];
            self.videoUrl = [self objectOrNilForKey:kDTDataVideoUrl fromDictionary:dict];
            self.brand = [DTBrand modelObjectWithDictionary:[dict objectForKey:kDTDataBrand]];
    NSObject *receivedDTPromise = [dict objectForKey:kDTDataPromise];
    NSMutableArray *parsedDTPromise = [NSMutableArray array];
    if ([receivedDTPromise isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDTPromise) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDTPromise addObject:[DTPromise modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDTPromise isKindOfClass:[NSDictionary class]]) {
       [parsedDTPromise addObject:[DTPromise modelObjectWithDictionary:(NSDictionary *)receivedDTPromise]];
    }

    self.promise = [NSArray arrayWithArray:parsedDTPromise];
    NSObject *receivedDTSpecial = [dict objectForKey:kDTDataSpecial];
    NSMutableArray *parsedDTSpecial = [NSMutableArray array];
    if ([receivedDTSpecial isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDTSpecial) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDTSpecial addObject:[DTSpecial modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDTSpecial isKindOfClass:[NSDictionary class]]) {
       [parsedDTSpecial addObject:[DTSpecial modelObjectWithDictionary:(NSDictionary *)receivedDTSpecial]];
    }

    self.special = [NSArray arrayWithArray:parsedDTSpecial];
            self.price = [[self objectOrNilForKey:kDTDataPrice fromDictionary:dict] doubleValue];
            self.coverImageHeight = [self objectOrNilForKey:kDTDataCoverImageHeight fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kDTDataCoverImage fromDictionary:dict];
            self.homeSort = [self objectOrNilForKey:kDTDataHomeSort fromDictionary:dict];
            self.views = [self objectOrNilForKey:kDTDataViews fromDictionary:dict];
            self.suffix = [self objectOrNilForKey:kDTDataSuffix fromDictionary:dict];
            self.utime = [self objectOrNilForKey:kDTDataUtime fromDictionary:dict];
            self.adFooter = [self objectOrNilForKey:kDTDataAdFooter fromDictionary:dict];
            self.sameBrand = [DTSameBrand modelObjectWithDictionary:[dict objectForKey:kDTDataSameBrand]];
            self.sales = [self objectOrNilForKey:kDTDataSales fromDictionary:dict];
            self.region = [self objectOrNilForKey:kDTDataRegion fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kDTDataGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kDTDataDefaultThumb fromDictionary:dict];
            self.country = [self objectOrNilForKey:kDTDataCountry fromDictionary:dict];
            self.saleTime = [self objectOrNilForKey:kDTDataSaleTime fromDictionary:dict];
            self.ifCodpay = [self objectOrNilForKey:kDTDataIfCodpay fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kDTDataSaleType fromDictionary:dict];
            self.styleId = [self objectOrNilForKey:kDTDataStyleId fromDictionary:dict];
            self.marketPrice = [[self objectOrNilForKey:kDTDataMarketPrice fromDictionary:dict] doubleValue];
            self.coverImageWidth = [self objectOrNilForKey:kDTDataCoverImageWidth fromDictionary:dict];
            self.erpId = [self objectOrNilForKey:kDTDataErpId fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kDTDataCtime fromDictionary:dict];
            self.wishes = [self objectOrNilForKey:kDTDataWishes fromDictionary:dict];
            self.orders = [self objectOrNilForKey:kDTDataOrders fromDictionary:dict];
            self.storeId = [self objectOrNilForKey:kDTDataStoreId fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kDTDataTags fromDictionary:dict];
            self.comments = [DTComments modelObjectWithDictionary:[dict objectForKey:kDTDataComments]];
            self.homeShow = [self objectOrNilForKey:kDTDataHomeShow fromDictionary:dict];
            self.salesMonth = [self objectOrNilForKey:kDTDataSalesMonth fromDictionary:dict];
            self.utags = [self objectOrNilForKey:kDTDataUtags fromDictionary:dict];
            self.detailBigImages = [self objectOrNilForKey:kDTDataDetailBigImages fromDictionary:dict];
            self.moreLove = [DTMoreLove modelObjectWithDictionary:[dict objectForKey:kDTDataMoreLove]];
            self.defaultImage = [self objectOrNilForKey:kDTDataDefaultImage fromDictionary:dict];
            self.shareDesc = [self objectOrNilForKey:kDTDataShareDesc fromDictionary:dict];
            self.goodsName = [self objectOrNilForKey:kDTDataGoodsName fromDictionary:dict];
            self.sexPoint = [self objectOrNilForKey:kDTDataSexPoint fromDictionary:dict];
            self.ifShowBrandGoods = [self objectOrNilForKey:kDTDataIfShowBrandGoods fromDictionary:dict];
            self.sameStyle = [self objectOrNilForKey:kDTDataSameStyle fromDictionary:dict];
            self.isOfferPackage = [self objectOrNilForKey:kDTDataIsOfferPackage fromDictionary:dict];
            self.huodong = [DTHuodong modelObjectWithDictionary:[dict objectForKey:kDTDataHuodong]];
            self.keywords = [DTKeywords modelObjectWithDictionary:[dict objectForKey:kDTDataKeywords]];
            self.isMainGoods = [self objectOrNilForKey:kDTDataIsMainGoods fromDictionary:dict];
    NSObject *receivedDTImages = [dict objectForKey:kDTDataImages];
    NSMutableArray *parsedDTImages = [NSMutableArray array];
    if ([receivedDTImages isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDTImages) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDTImages addObject:[DTImages modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDTImages isKindOfClass:[NSDictionary class]]) {
       [parsedDTImages addObject:[DTImages modelObjectWithDictionary:(NSDictionary *)receivedDTImages]];
    }

    self.images = [NSArray arrayWithArray:parsedDTImages];
            self.shareTitle = [self objectOrNilForKey:kDTDataShareTitle fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kDTDataBrandName fromDictionary:dict];
            self.bar = [self objectOrNilForKey:kDTDataBar fromDictionary:dict];
            self.canReturn = [self objectOrNilForKey:kDTDataCanReturn fromDictionary:dict];
            self.notified = [[self objectOrNilForKey:kDTDataNotified fromDictionary:dict] boolValue];
            self.cateName1 = [self objectOrNilForKey:kDTDataCateName1 fromDictionary:dict];
            self.brandId = [self objectOrNilForKey:kDTDataBrandId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.shares forKey:kDTDataShares];
    [mutableDict setValue:self.costPrice forKey:kDTDataCostPrice];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kDTDataLiked];
    [mutableDict setValue:self.titleDesc forKey:kDTDataTitleDesc];
    [mutableDict setValue:self.sex forKey:kDTDataSex];
    [mutableDict setValue:self.commentsCount forKey:kDTDataCommentsCount];
    [mutableDict setValue:self.viewWishes forKey:kDTDataViewWishes];
    [mutableDict setValue:self.ifSpecial forKey:kDTDataIfSpecial];
    NSMutableArray *tempArrayForMoreSale = [NSMutableArray array];
    for (NSObject *subArrayObject in self.moreSale) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMoreSale addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMoreSale addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMoreSale] forKey:kDTDataMoreSale];
    [mutableDict setValue:self.cateName forKey:kDTDataCateName];
    [mutableDict setValue:self.goodsRank forKey:kDTDataGoodsRank];
    [mutableDict setValue:self.recommend forKey:kDTDataRecommend];
    [mutableDict setValue:self.sku forKey:kDTDataSku];
    [mutableDict setValue:self.colorId forKey:kDTDataColorId];
    [mutableDict setValue:self.cateName2 forKey:kDTDataCateName2];
    [mutableDict setValue:self.cateId1 forKey:kDTDataCateId1];
    [mutableDict setValue:self.prefix forKey:kDTDataPrefix];
    [mutableDict setValue:self.freightTemplateId forKey:kDTDataFreightTemplateId];
    [mutableDict setValue:self.stock forKey:kDTDataStock];
    [mutableDict setValue:self.goodsPeak forKey:kDTDataGoodsPeak];
    [mutableDict setValue:self.shortGoodsName forKey:kDTDataShortGoodsName];
    [mutableDict setValue:self.cateId2 forKey:kDTDataCateId2];
    [mutableDict setValue:self.cateId forKey:kDTDataCateId];
    [mutableDict setValue:self.activityId forKey:kDTDataActivityId];
    [mutableDict setValue:self.status forKey:kDTDataStatus];
    [mutableDict setValue:self.activityKinds forKey:kDTDataActivityKinds];
    [mutableDict setValue:self.dataDescription forKey:kDTDataDescription];
    [mutableDict setValue:self.packageImage forKey:kDTDataPackageImage];
    NSMutableArray *tempArrayForMoreProperty = [NSMutableArray array];
    for (NSObject *subArrayObject in self.moreProperty) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMoreProperty addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMoreProperty addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMoreProperty] forKey:kDTDataMoreProperty];
    [mutableDict setValue:self.sentImage forKey:kDTDataSentImage];
    [mutableDict setValue:[self.brands dictionaryRepresentation] forKey:kDTDataBrands];
    [mutableDict setValue:self.videoUrl forKey:kDTDataVideoUrl];
    [mutableDict setValue:[self.brand dictionaryRepresentation] forKey:kDTDataBrand];
    NSMutableArray *tempArrayForPromise = [NSMutableArray array];
    for (NSObject *subArrayObject in self.promise) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPromise addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPromise addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPromise] forKey:kDTDataPromise];
    NSMutableArray *tempArrayForSpecial = [NSMutableArray array];
    for (NSObject *subArrayObject in self.special) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSpecial addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSpecial addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSpecial] forKey:kDTDataSpecial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kDTDataPrice];
    [mutableDict setValue:self.coverImageHeight forKey:kDTDataCoverImageHeight];
    [mutableDict setValue:self.coverImage forKey:kDTDataCoverImage];
    [mutableDict setValue:self.homeSort forKey:kDTDataHomeSort];
    [mutableDict setValue:self.views forKey:kDTDataViews];
    [mutableDict setValue:self.suffix forKey:kDTDataSuffix];
    [mutableDict setValue:self.utime forKey:kDTDataUtime];
    [mutableDict setValue:self.adFooter forKey:kDTDataAdFooter];
    [mutableDict setValue:[self.sameBrand dictionaryRepresentation] forKey:kDTDataSameBrand];
    [mutableDict setValue:self.sales forKey:kDTDataSales];
    [mutableDict setValue:self.region forKey:kDTDataRegion];
    [mutableDict setValue:self.goodsId forKey:kDTDataGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kDTDataDefaultThumb];
    [mutableDict setValue:self.country forKey:kDTDataCountry];
    [mutableDict setValue:self.saleTime forKey:kDTDataSaleTime];
    [mutableDict setValue:self.ifCodpay forKey:kDTDataIfCodpay];
    [mutableDict setValue:self.saleType forKey:kDTDataSaleType];
    [mutableDict setValue:self.styleId forKey:kDTDataStyleId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kDTDataMarketPrice];
    [mutableDict setValue:self.coverImageWidth forKey:kDTDataCoverImageWidth];
    [mutableDict setValue:self.erpId forKey:kDTDataErpId];
    [mutableDict setValue:self.ctime forKey:kDTDataCtime];
    [mutableDict setValue:self.wishes forKey:kDTDataWishes];
    [mutableDict setValue:self.orders forKey:kDTDataOrders];
    [mutableDict setValue:self.storeId forKey:kDTDataStoreId];
    [mutableDict setValue:self.tags forKey:kDTDataTags];
    [mutableDict setValue:[self.comments dictionaryRepresentation] forKey:kDTDataComments];
    [mutableDict setValue:self.homeShow forKey:kDTDataHomeShow];
    [mutableDict setValue:self.salesMonth forKey:kDTDataSalesMonth];
    [mutableDict setValue:self.utags forKey:kDTDataUtags];
    [mutableDict setValue:self.detailBigImages forKey:kDTDataDetailBigImages];
    [mutableDict setValue:[self.moreLove dictionaryRepresentation] forKey:kDTDataMoreLove];
    [mutableDict setValue:self.defaultImage forKey:kDTDataDefaultImage];
    [mutableDict setValue:self.shareDesc forKey:kDTDataShareDesc];
    [mutableDict setValue:self.goodsName forKey:kDTDataGoodsName];
    [mutableDict setValue:self.sexPoint forKey:kDTDataSexPoint];
    [mutableDict setValue:self.ifShowBrandGoods forKey:kDTDataIfShowBrandGoods];
    [mutableDict setValue:self.sameStyle forKey:kDTDataSameStyle];
    [mutableDict setValue:self.isOfferPackage forKey:kDTDataIsOfferPackage];
    [mutableDict setValue:[self.huodong dictionaryRepresentation] forKey:kDTDataHuodong];
    [mutableDict setValue:[self.keywords dictionaryRepresentation] forKey:kDTDataKeywords];
    [mutableDict setValue:self.isMainGoods forKey:kDTDataIsMainGoods];
    NSMutableArray *tempArrayForImages = [NSMutableArray array];
    for (NSObject *subArrayObject in self.images) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForImages addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForImages addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForImages] forKey:kDTDataImages];
    [mutableDict setValue:self.shareTitle forKey:kDTDataShareTitle];
    [mutableDict setValue:self.brandName forKey:kDTDataBrandName];
    [mutableDict setValue:self.bar forKey:kDTDataBar];
    [mutableDict setValue:self.canReturn forKey:kDTDataCanReturn];
    [mutableDict setValue:[NSNumber numberWithBool:self.notified] forKey:kDTDataNotified];
    [mutableDict setValue:self.cateName1 forKey:kDTDataCateName1];
    [mutableDict setValue:self.brandId forKey:kDTDataBrandId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.shares = [aDecoder decodeObjectForKey:kDTDataShares];
    self.costPrice = [aDecoder decodeObjectForKey:kDTDataCostPrice];
    self.liked = [aDecoder decodeBoolForKey:kDTDataLiked];
    self.titleDesc = [aDecoder decodeObjectForKey:kDTDataTitleDesc];
    self.sex = [aDecoder decodeObjectForKey:kDTDataSex];
    self.commentsCount = [aDecoder decodeObjectForKey:kDTDataCommentsCount];
    self.viewWishes = [aDecoder decodeObjectForKey:kDTDataViewWishes];
    self.ifSpecial = [aDecoder decodeObjectForKey:kDTDataIfSpecial];
    self.moreSale = [aDecoder decodeObjectForKey:kDTDataMoreSale];
    self.cateName = [aDecoder decodeObjectForKey:kDTDataCateName];
    self.goodsRank = [aDecoder decodeObjectForKey:kDTDataGoodsRank];
    self.recommend = [aDecoder decodeObjectForKey:kDTDataRecommend];
    self.sku = [aDecoder decodeObjectForKey:kDTDataSku];
    self.colorId = [aDecoder decodeObjectForKey:kDTDataColorId];
    self.cateName2 = [aDecoder decodeObjectForKey:kDTDataCateName2];
    self.cateId1 = [aDecoder decodeObjectForKey:kDTDataCateId1];
    self.prefix = [aDecoder decodeObjectForKey:kDTDataPrefix];
    self.freightTemplateId = [aDecoder decodeObjectForKey:kDTDataFreightTemplateId];
    self.stock = [aDecoder decodeObjectForKey:kDTDataStock];
    self.goodsPeak = [aDecoder decodeObjectForKey:kDTDataGoodsPeak];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kDTDataShortGoodsName];
    self.cateId2 = [aDecoder decodeObjectForKey:kDTDataCateId2];
    self.cateId = [aDecoder decodeObjectForKey:kDTDataCateId];
    self.activityId = [aDecoder decodeObjectForKey:kDTDataActivityId];
    self.status = [aDecoder decodeObjectForKey:kDTDataStatus];
    self.activityKinds = [aDecoder decodeObjectForKey:kDTDataActivityKinds];
    self.dataDescription = [aDecoder decodeObjectForKey:kDTDataDescription];
    self.packageImage = [aDecoder decodeObjectForKey:kDTDataPackageImage];
    self.moreProperty = [aDecoder decodeObjectForKey:kDTDataMoreProperty];
    self.sentImage = [aDecoder decodeObjectForKey:kDTDataSentImage];
    self.brands = [aDecoder decodeObjectForKey:kDTDataBrands];
    self.videoUrl = [aDecoder decodeObjectForKey:kDTDataVideoUrl];
    self.brand = [aDecoder decodeObjectForKey:kDTDataBrand];
    self.promise = [aDecoder decodeObjectForKey:kDTDataPromise];
    self.special = [aDecoder decodeObjectForKey:kDTDataSpecial];
    self.price = [aDecoder decodeDoubleForKey:kDTDataPrice];
    self.coverImageHeight = [aDecoder decodeObjectForKey:kDTDataCoverImageHeight];
    self.coverImage = [aDecoder decodeObjectForKey:kDTDataCoverImage];
    self.homeSort = [aDecoder decodeObjectForKey:kDTDataHomeSort];
    self.views = [aDecoder decodeObjectForKey:kDTDataViews];
    self.suffix = [aDecoder decodeObjectForKey:kDTDataSuffix];
    self.utime = [aDecoder decodeObjectForKey:kDTDataUtime];
    self.adFooter = [aDecoder decodeObjectForKey:kDTDataAdFooter];
    self.sameBrand = [aDecoder decodeObjectForKey:kDTDataSameBrand];
    self.sales = [aDecoder decodeObjectForKey:kDTDataSales];
    self.region = [aDecoder decodeObjectForKey:kDTDataRegion];
    self.goodsId = [aDecoder decodeObjectForKey:kDTDataGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kDTDataDefaultThumb];
    self.country = [aDecoder decodeObjectForKey:kDTDataCountry];
    self.saleTime = [aDecoder decodeObjectForKey:kDTDataSaleTime];
    self.ifCodpay = [aDecoder decodeObjectForKey:kDTDataIfCodpay];
    self.saleType = [aDecoder decodeObjectForKey:kDTDataSaleType];
    self.styleId = [aDecoder decodeObjectForKey:kDTDataStyleId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kDTDataMarketPrice];
    self.coverImageWidth = [aDecoder decodeObjectForKey:kDTDataCoverImageWidth];
    self.erpId = [aDecoder decodeObjectForKey:kDTDataErpId];
    self.ctime = [aDecoder decodeObjectForKey:kDTDataCtime];
    self.wishes = [aDecoder decodeObjectForKey:kDTDataWishes];
    self.orders = [aDecoder decodeObjectForKey:kDTDataOrders];
    self.storeId = [aDecoder decodeObjectForKey:kDTDataStoreId];
    self.tags = [aDecoder decodeObjectForKey:kDTDataTags];
    self.comments = [aDecoder decodeObjectForKey:kDTDataComments];
    self.homeShow = [aDecoder decodeObjectForKey:kDTDataHomeShow];
    self.salesMonth = [aDecoder decodeObjectForKey:kDTDataSalesMonth];
    self.utags = [aDecoder decodeObjectForKey:kDTDataUtags];
    self.detailBigImages = [aDecoder decodeObjectForKey:kDTDataDetailBigImages];
    self.moreLove = [aDecoder decodeObjectForKey:kDTDataMoreLove];
    self.defaultImage = [aDecoder decodeObjectForKey:kDTDataDefaultImage];
    self.shareDesc = [aDecoder decodeObjectForKey:kDTDataShareDesc];
    self.goodsName = [aDecoder decodeObjectForKey:kDTDataGoodsName];
    self.sexPoint = [aDecoder decodeObjectForKey:kDTDataSexPoint];
    self.ifShowBrandGoods = [aDecoder decodeObjectForKey:kDTDataIfShowBrandGoods];
    self.sameStyle = [aDecoder decodeObjectForKey:kDTDataSameStyle];
    self.isOfferPackage = [aDecoder decodeObjectForKey:kDTDataIsOfferPackage];
    self.huodong = [aDecoder decodeObjectForKey:kDTDataHuodong];
    self.keywords = [aDecoder decodeObjectForKey:kDTDataKeywords];
    self.isMainGoods = [aDecoder decodeObjectForKey:kDTDataIsMainGoods];
    self.images = [aDecoder decodeObjectForKey:kDTDataImages];
    self.shareTitle = [aDecoder decodeObjectForKey:kDTDataShareTitle];
    self.brandName = [aDecoder decodeObjectForKey:kDTDataBrandName];
    self.bar = [aDecoder decodeObjectForKey:kDTDataBar];
    self.canReturn = [aDecoder decodeObjectForKey:kDTDataCanReturn];
    self.notified = [aDecoder decodeBoolForKey:kDTDataNotified];
    self.cateName1 = [aDecoder decodeObjectForKey:kDTDataCateName1];
    self.brandId = [aDecoder decodeObjectForKey:kDTDataBrandId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_shares forKey:kDTDataShares];
    [aCoder encodeObject:_costPrice forKey:kDTDataCostPrice];
    [aCoder encodeBool:_liked forKey:kDTDataLiked];
    [aCoder encodeObject:_titleDesc forKey:kDTDataTitleDesc];
    [aCoder encodeObject:_sex forKey:kDTDataSex];
    [aCoder encodeObject:_commentsCount forKey:kDTDataCommentsCount];
    [aCoder encodeObject:_viewWishes forKey:kDTDataViewWishes];
    [aCoder encodeObject:_ifSpecial forKey:kDTDataIfSpecial];
    [aCoder encodeObject:_moreSale forKey:kDTDataMoreSale];
    [aCoder encodeObject:_cateName forKey:kDTDataCateName];
    [aCoder encodeObject:_goodsRank forKey:kDTDataGoodsRank];
    [aCoder encodeObject:_recommend forKey:kDTDataRecommend];
    [aCoder encodeObject:_sku forKey:kDTDataSku];
    [aCoder encodeObject:_colorId forKey:kDTDataColorId];
    [aCoder encodeObject:_cateName2 forKey:kDTDataCateName2];
    [aCoder encodeObject:_cateId1 forKey:kDTDataCateId1];
    [aCoder encodeObject:_prefix forKey:kDTDataPrefix];
    [aCoder encodeObject:_freightTemplateId forKey:kDTDataFreightTemplateId];
    [aCoder encodeObject:_stock forKey:kDTDataStock];
    [aCoder encodeObject:_goodsPeak forKey:kDTDataGoodsPeak];
    [aCoder encodeObject:_shortGoodsName forKey:kDTDataShortGoodsName];
    [aCoder encodeObject:_cateId2 forKey:kDTDataCateId2];
    [aCoder encodeObject:_cateId forKey:kDTDataCateId];
    [aCoder encodeObject:_activityId forKey:kDTDataActivityId];
    [aCoder encodeObject:_status forKey:kDTDataStatus];
    [aCoder encodeObject:_activityKinds forKey:kDTDataActivityKinds];
    [aCoder encodeObject:_dataDescription forKey:kDTDataDescription];
    [aCoder encodeObject:_packageImage forKey:kDTDataPackageImage];
    [aCoder encodeObject:_moreProperty forKey:kDTDataMoreProperty];
    [aCoder encodeObject:_sentImage forKey:kDTDataSentImage];
    [aCoder encodeObject:_brands forKey:kDTDataBrands];
    [aCoder encodeObject:_videoUrl forKey:kDTDataVideoUrl];
    [aCoder encodeObject:_brand forKey:kDTDataBrand];
    [aCoder encodeObject:_promise forKey:kDTDataPromise];
    [aCoder encodeObject:_special forKey:kDTDataSpecial];
    [aCoder encodeDouble:_price forKey:kDTDataPrice];
    [aCoder encodeObject:_coverImageHeight forKey:kDTDataCoverImageHeight];
    [aCoder encodeObject:_coverImage forKey:kDTDataCoverImage];
    [aCoder encodeObject:_homeSort forKey:kDTDataHomeSort];
    [aCoder encodeObject:_views forKey:kDTDataViews];
    [aCoder encodeObject:_suffix forKey:kDTDataSuffix];
    [aCoder encodeObject:_utime forKey:kDTDataUtime];
    [aCoder encodeObject:_adFooter forKey:kDTDataAdFooter];
    [aCoder encodeObject:_sameBrand forKey:kDTDataSameBrand];
    [aCoder encodeObject:_sales forKey:kDTDataSales];
    [aCoder encodeObject:_region forKey:kDTDataRegion];
    [aCoder encodeObject:_goodsId forKey:kDTDataGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kDTDataDefaultThumb];
    [aCoder encodeObject:_country forKey:kDTDataCountry];
    [aCoder encodeObject:_saleTime forKey:kDTDataSaleTime];
    [aCoder encodeObject:_ifCodpay forKey:kDTDataIfCodpay];
    [aCoder encodeObject:_saleType forKey:kDTDataSaleType];
    [aCoder encodeObject:_styleId forKey:kDTDataStyleId];
    [aCoder encodeDouble:_marketPrice forKey:kDTDataMarketPrice];
    [aCoder encodeObject:_coverImageWidth forKey:kDTDataCoverImageWidth];
    [aCoder encodeObject:_erpId forKey:kDTDataErpId];
    [aCoder encodeObject:_ctime forKey:kDTDataCtime];
    [aCoder encodeObject:_wishes forKey:kDTDataWishes];
    [aCoder encodeObject:_orders forKey:kDTDataOrders];
    [aCoder encodeObject:_storeId forKey:kDTDataStoreId];
    [aCoder encodeObject:_tags forKey:kDTDataTags];
    [aCoder encodeObject:_comments forKey:kDTDataComments];
    [aCoder encodeObject:_homeShow forKey:kDTDataHomeShow];
    [aCoder encodeObject:_salesMonth forKey:kDTDataSalesMonth];
    [aCoder encodeObject:_utags forKey:kDTDataUtags];
    [aCoder encodeObject:_detailBigImages forKey:kDTDataDetailBigImages];
    [aCoder encodeObject:_moreLove forKey:kDTDataMoreLove];
    [aCoder encodeObject:_defaultImage forKey:kDTDataDefaultImage];
    [aCoder encodeObject:_shareDesc forKey:kDTDataShareDesc];
    [aCoder encodeObject:_goodsName forKey:kDTDataGoodsName];
    [aCoder encodeObject:_sexPoint forKey:kDTDataSexPoint];
    [aCoder encodeObject:_ifShowBrandGoods forKey:kDTDataIfShowBrandGoods];
    [aCoder encodeObject:_sameStyle forKey:kDTDataSameStyle];
    [aCoder encodeObject:_isOfferPackage forKey:kDTDataIsOfferPackage];
    [aCoder encodeObject:_huodong forKey:kDTDataHuodong];
    [aCoder encodeObject:_keywords forKey:kDTDataKeywords];
    [aCoder encodeObject:_isMainGoods forKey:kDTDataIsMainGoods];
    [aCoder encodeObject:_images forKey:kDTDataImages];
    [aCoder encodeObject:_shareTitle forKey:kDTDataShareTitle];
    [aCoder encodeObject:_brandName forKey:kDTDataBrandName];
    [aCoder encodeObject:_bar forKey:kDTDataBar];
    [aCoder encodeObject:_canReturn forKey:kDTDataCanReturn];
    [aCoder encodeBool:_notified forKey:kDTDataNotified];
    [aCoder encodeObject:_cateName1 forKey:kDTDataCateName1];
    [aCoder encodeObject:_brandId forKey:kDTDataBrandId];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTData *copy = [[DTData alloc] init];
    
    if (copy) {

        copy.shares = [self.shares copyWithZone:zone];
        copy.costPrice = [self.costPrice copyWithZone:zone];
        copy.liked = self.liked;
        copy.titleDesc = [self.titleDesc copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.commentsCount = [self.commentsCount copyWithZone:zone];
        copy.viewWishes = [self.viewWishes copyWithZone:zone];
        copy.ifSpecial = [self.ifSpecial copyWithZone:zone];
        copy.moreSale = [self.moreSale copyWithZone:zone];
        copy.cateName = [self.cateName copyWithZone:zone];
        copy.goodsRank = [self.goodsRank copyWithZone:zone];
        copy.recommend = [self.recommend copyWithZone:zone];
        copy.sku = [self.sku copyWithZone:zone];
        copy.colorId = [self.colorId copyWithZone:zone];
        copy.cateName2 = [self.cateName2 copyWithZone:zone];
        copy.cateId1 = [self.cateId1 copyWithZone:zone];
        copy.prefix = [self.prefix copyWithZone:zone];
        copy.freightTemplateId = [self.freightTemplateId copyWithZone:zone];
        copy.stock = [self.stock copyWithZone:zone];
        copy.goodsPeak = [self.goodsPeak copyWithZone:zone];
        copy.shortGoodsName = [self.shortGoodsName copyWithZone:zone];
        copy.cateId2 = [self.cateId2 copyWithZone:zone];
        copy.cateId = [self.cateId copyWithZone:zone];
        copy.activityId = [self.activityId copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.activityKinds = [self.activityKinds copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.packageImage = [self.packageImage copyWithZone:zone];
        copy.moreProperty = [self.moreProperty copyWithZone:zone];
        copy.sentImage = [self.sentImage copyWithZone:zone];
        copy.brands = [self.brands copyWithZone:zone];
        copy.videoUrl = [self.videoUrl copyWithZone:zone];
        copy.brand = [self.brand copyWithZone:zone];
        copy.promise = [self.promise copyWithZone:zone];
        copy.special = [self.special copyWithZone:zone];
        copy.price = self.price;
        copy.coverImageHeight = [self.coverImageHeight copyWithZone:zone];
        copy.coverImage = [self.coverImage copyWithZone:zone];
        copy.homeSort = [self.homeSort copyWithZone:zone];
        copy.views = [self.views copyWithZone:zone];
        copy.suffix = [self.suffix copyWithZone:zone];
        copy.utime = [self.utime copyWithZone:zone];
        copy.adFooter = [self.adFooter copyWithZone:zone];
        copy.sameBrand = [self.sameBrand copyWithZone:zone];
        copy.sales = [self.sales copyWithZone:zone];
        copy.region = [self.region copyWithZone:zone];
        copy.goodsId = [self.goodsId copyWithZone:zone];
        copy.defaultThumb = [self.defaultThumb copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
        copy.saleTime = [self.saleTime copyWithZone:zone];
        copy.ifCodpay = [self.ifCodpay copyWithZone:zone];
        copy.saleType = [self.saleType copyWithZone:zone];
        copy.styleId = [self.styleId copyWithZone:zone];
        copy.marketPrice = self.marketPrice;
        copy.coverImageWidth = [self.coverImageWidth copyWithZone:zone];
        copy.erpId = [self.erpId copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.wishes = [self.wishes copyWithZone:zone];
        copy.orders = [self.orders copyWithZone:zone];
        copy.storeId = [self.storeId copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.homeShow = [self.homeShow copyWithZone:zone];
        copy.salesMonth = [self.salesMonth copyWithZone:zone];
        copy.utags = [self.utags copyWithZone:zone];
        copy.detailBigImages = [self.detailBigImages copyWithZone:zone];
        copy.moreLove = [self.moreLove copyWithZone:zone];
        copy.defaultImage = [self.defaultImage copyWithZone:zone];
        copy.shareDesc = [self.shareDesc copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.sexPoint = [self.sexPoint copyWithZone:zone];
        copy.ifShowBrandGoods = [self.ifShowBrandGoods copyWithZone:zone];
        copy.sameStyle = [self.sameStyle copyWithZone:zone];
        copy.isOfferPackage = [self.isOfferPackage copyWithZone:zone];
        copy.huodong = [self.huodong copyWithZone:zone];
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.isMainGoods = [self.isMainGoods copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.shareTitle = [self.shareTitle copyWithZone:zone];
        copy.brandName = [self.brandName copyWithZone:zone];
        copy.bar = [self.bar copyWithZone:zone];
        copy.canReturn = [self.canReturn copyWithZone:zone];
        copy.notified = self.notified;
        copy.cateName1 = [self.cateName1 copyWithZone:zone];
        copy.brandId = [self.brandId copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_shares release];
    [_costPrice release];
    [_titleDesc release];
    [_sex release];
    [_commentsCount release];
    [_viewWishes release];
    [_ifSpecial release];
    [_moreSale release];
    [_cateName release];
    [_goodsRank release];
    [_recommend release];
    [_sku release];
    [_colorId release];
    [_cateName2 release];
    [_cateId1 release];
    [_prefix release];
    [_freightTemplateId release];
    [_stock release];
    [_goodsPeak release];
    [_shortGoodsName release];
    [_cateId2 release];
    [_cateId release];
    [_activityId release];
    [_status release];
    [_activityKinds release];
    [_dataDescription release];
    [_packageImage release];
    [_moreProperty release];
    [_sentImage release];
    [_brands release];
    [_videoUrl release];
    [_brand release];
    [_promise release];
    [_special release];
    [_coverImageHeight release];
    [_coverImage release];
    [_homeSort release];
    [_views release];
    [_suffix release];
    [_utime release];
    [_adFooter release];
    [_sameBrand release];
    [_sales release];
    [_region release];
    [_goodsId release];
    [_defaultThumb release];
    [_country release];
    [_saleTime release];
    [_ifCodpay release];
    [_saleType release];
    [_styleId release];
    [_coverImageWidth release];
    [_erpId release];
    [_ctime release];
    [_wishes release];
    [_orders release];
    [_storeId release];
    [_tags release];
    [_comments release];
    [_homeShow release];
    [_salesMonth release];
    [_utags release];
    [_detailBigImages release];
    [_moreLove release];
    [_defaultImage release];
    [_shareDesc release];
    [_goodsName release];
    [_sexPoint release];
    [_ifShowBrandGoods release];
    [_sameStyle release];
    [_isOfferPackage release];
    [_huodong release];
    [_keywords release];
    [_isMainGoods release];
    [_images release];
    [_shareTitle release];
    [_brandName release];
    [_bar release];
    [_canReturn release];
    [_cateName1 release];
    [_brandId release];
    [super dealloc];
}

@end
