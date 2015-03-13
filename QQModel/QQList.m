//
//  QQList.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QQList.h"
#import "QQSaleTypeMaps.h"
#import "QQSaleTypeInfo.h"


NSString *const kQQListDefaultImage = @"default_image";
NSString *const kQQListDescription = @"description";
NSString *const kQQListWeight = @"weight";
NSString *const kQQListLiked = @"liked";
NSString *const kQQListIfSpecial = @"if_special";
NSString *const kQQListSaleTypeMaps = @"sale_type_maps";
NSString *const kQQListSaleTypeInfo = @"sale_type_info";
NSString *const kQQListActivityKinds = @"activity_kinds";
NSString *const kQQListTags = @"tags";
NSString *const kQQListActivityId = @"activity_id";
NSString *const kQQListMarketPrice = @"market_price";
NSString *const kQQListGoodsName = @"goods_name";
NSString *const kQQListStock = @"stock";
NSString *const kQQListRegion = @"region";
NSString *const kQQListCountry = @"country";
NSString *const kQQListCateName = @"cate_name";
NSString *const kQQListWishes = @"wishes";
NSString *const kQQListViewWishes = @"view_wishes";
NSString *const kQQListTagsArr = @"tags_arr";
NSString *const kQQListPrefix = @"prefix";
NSString *const kQQListTitleDesc = @"title_desc";
NSString *const kQQListGoodsId = @"goods_id";
NSString *const kQQListDefaultThumb = @"default_thumb";
NSString *const kQQListBrandName = @"brand_name";
NSString *const kQQListSaleType = @"sale_type";
NSString *const kQQListPrice = @"price";
NSString *const kQQListActivityTxt = @"activity_txt";
NSString *const kQQListCoverImage = @"cover_image";
NSString *const kQQListShortGoodsName = @"short_goods_name";


@interface QQList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QQList

@synthesize defaultImage = _defaultImage;
@synthesize listDescription = _listDescription;
@synthesize weight = _weight;
@synthesize liked = _liked;
@synthesize ifSpecial = _ifSpecial;
@synthesize saleTypeMaps = _saleTypeMaps;
@synthesize saleTypeInfo = _saleTypeInfo;
@synthesize activityKinds = _activityKinds;
@synthesize tags = _tags;
@synthesize activityId = _activityId;
@synthesize marketPrice = _marketPrice;
@synthesize goodsName = _goodsName;
@synthesize stock = _stock;
@synthesize region = _region;
@synthesize country = _country;
@synthesize cateName = _cateName;
@synthesize wishes = _wishes;
@synthesize viewWishes = _viewWishes;
@synthesize tagsArr = _tagsArr;
@synthesize prefix = _prefix;
@synthesize titleDesc = _titleDesc;
@synthesize goodsId = _goodsId;
@synthesize defaultThumb = _defaultThumb;
@synthesize brandName = _brandName;
@synthesize saleType = _saleType;
@synthesize price = _price;
@synthesize activityTxt = _activityTxt;
@synthesize coverImage = _coverImage;
@synthesize shortGoodsName = _shortGoodsName;


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
            self.defaultImage = [self objectOrNilForKey:kQQListDefaultImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kQQListDescription fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kQQListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kQQListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kQQListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedQQSaleTypeMaps = [dict objectForKey:kQQListSaleTypeMaps];
    NSMutableArray *parsedQQSaleTypeMaps = [NSMutableArray array];
    if ([receivedQQSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedQQSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedQQSaleTypeMaps addObject:[QQSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedQQSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedQQSaleTypeMaps addObject:[QQSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedQQSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedQQSaleTypeMaps];
            self.saleTypeInfo = [QQSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kQQListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kQQListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kQQListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kQQListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kQQListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kQQListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kQQListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kQQListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kQQListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kQQListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kQQListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kQQListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kQQListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kQQListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kQQListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kQQListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kQQListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kQQListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kQQListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kQQListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kQQListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kQQListCoverImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kQQListShortGoodsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kQQListDefaultImage];
    [mutableDict setValue:self.listDescription forKey:kQQListDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kQQListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kQQListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kQQListIfSpecial];
    NSMutableArray *tempArrayForSaleTypeMaps = [NSMutableArray array];
    for (NSObject *subArrayObject in self.saleTypeMaps) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSaleTypeMaps addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSaleTypeMaps addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kQQListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kQQListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kQQListActivityKinds];
    [mutableDict setValue:self.tags forKey:kQQListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kQQListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kQQListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kQQListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kQQListStock];
    [mutableDict setValue:self.region forKey:kQQListRegion];
    [mutableDict setValue:self.country forKey:kQQListCountry];
    [mutableDict setValue:self.cateName forKey:kQQListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kQQListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kQQListViewWishes];
    NSMutableArray *tempArrayForTagsArr = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tagsArr) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTagsArr addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTagsArr addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kQQListTagsArr];
    [mutableDict setValue:self.prefix forKey:kQQListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kQQListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kQQListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kQQListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kQQListBrandName];
    NSMutableArray *tempArrayForSaleType = [NSMutableArray array];
    for (NSObject *subArrayObject in self.saleType) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSaleType addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSaleType addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kQQListSaleType];
    [mutableDict setValue:self.price forKey:kQQListPrice];
    [mutableDict setValue:self.activityTxt forKey:kQQListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kQQListCoverImage];
    [mutableDict setValue:self.shortGoodsName forKey:kQQListShortGoodsName];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kQQListDefaultImage];
    self.listDescription = [aDecoder decodeObjectForKey:kQQListDescription];
    self.weight = [aDecoder decodeDoubleForKey:kQQListWeight];
    self.liked = [aDecoder decodeBoolForKey:kQQListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kQQListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kQQListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kQQListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kQQListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kQQListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kQQListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kQQListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kQQListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kQQListStock];
    self.region = [aDecoder decodeObjectForKey:kQQListRegion];
    self.country = [aDecoder decodeObjectForKey:kQQListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kQQListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kQQListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kQQListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kQQListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kQQListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kQQListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kQQListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kQQListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kQQListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kQQListSaleType];
    self.price = [aDecoder decodeObjectForKey:kQQListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kQQListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kQQListCoverImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kQQListShortGoodsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kQQListDefaultImage];
    [aCoder encodeObject:_listDescription forKey:kQQListDescription];
    [aCoder encodeDouble:_weight forKey:kQQListWeight];
    [aCoder encodeBool:_liked forKey:kQQListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kQQListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kQQListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kQQListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kQQListActivityKinds];
    [aCoder encodeObject:_tags forKey:kQQListTags];
    [aCoder encodeDouble:_activityId forKey:kQQListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kQQListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kQQListGoodsName];
    [aCoder encodeDouble:_stock forKey:kQQListStock];
    [aCoder encodeObject:_region forKey:kQQListRegion];
    [aCoder encodeObject:_country forKey:kQQListCountry];
    [aCoder encodeObject:_cateName forKey:kQQListCateName];
    [aCoder encodeDouble:_wishes forKey:kQQListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kQQListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kQQListTagsArr];
    [aCoder encodeObject:_prefix forKey:kQQListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kQQListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kQQListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kQQListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kQQListBrandName];
    [aCoder encodeObject:_saleType forKey:kQQListSaleType];
    [aCoder encodeObject:_price forKey:kQQListPrice];
    [aCoder encodeObject:_activityTxt forKey:kQQListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kQQListCoverImage];
    [aCoder encodeObject:_shortGoodsName forKey:kQQListShortGoodsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    QQList *copy = [[QQList alloc] init];
    
    if (copy) {

        copy.defaultImage = [self.defaultImage copyWithZone:zone];
        copy.listDescription = [self.listDescription copyWithZone:zone];
        copy.weight = self.weight;
        copy.liked = self.liked;
        copy.ifSpecial = self.ifSpecial;
        copy.saleTypeMaps = [self.saleTypeMaps copyWithZone:zone];
        copy.saleTypeInfo = [self.saleTypeInfo copyWithZone:zone];
        copy.activityKinds = [self.activityKinds copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.activityId = self.activityId;
        copy.marketPrice = self.marketPrice;
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.stock = self.stock;
        copy.region = [self.region copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
        copy.cateName = [self.cateName copyWithZone:zone];
        copy.wishes = self.wishes;
        copy.viewWishes = self.viewWishes;
        copy.tagsArr = [self.tagsArr copyWithZone:zone];
        copy.prefix = [self.prefix copyWithZone:zone];
        copy.titleDesc = [self.titleDesc copyWithZone:zone];
        copy.goodsId = [self.goodsId copyWithZone:zone];
        copy.defaultThumb = [self.defaultThumb copyWithZone:zone];
        copy.brandName = [self.brandName copyWithZone:zone];
        copy.saleType = [self.saleType copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.activityTxt = [self.activityTxt copyWithZone:zone];
        copy.coverImage = [self.coverImage copyWithZone:zone];
        copy.shortGoodsName = [self.shortGoodsName copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_defaultImage release];
    [_listDescription release];
    [_saleTypeMaps release];
    [_saleTypeInfo release];
    [_activityKinds release];
    [_tags release];
    [_goodsName release];
    [_region release];
    [_country release];
    [_cateName release];
    [_tagsArr release];
    [_prefix release];
    [_titleDesc release];
    [_goodsId release];
    [_defaultThumb release];
    [_brandName release];
    [_saleType release];
    [_price release];
    [_activityTxt release];
    [_coverImage release];
    [_shortGoodsName release];
    [super dealloc];
}

@end
