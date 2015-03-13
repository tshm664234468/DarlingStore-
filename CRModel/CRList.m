//
//  CRList.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CRList.h"
#import "CRSaleTypeMaps.h"
#import "CRSaleTypeInfo.h"


NSString *const kCRListDefaultImage = @"default_image";
NSString *const kCRListDescription = @"description";
NSString *const kCRListWeight = @"weight";
NSString *const kCRListLiked = @"liked";
NSString *const kCRListIfSpecial = @"if_special";
NSString *const kCRListSaleTypeMaps = @"sale_type_maps";
NSString *const kCRListSaleTypeInfo = @"sale_type_info";
NSString *const kCRListActivityKinds = @"activity_kinds";
NSString *const kCRListTags = @"tags";
NSString *const kCRListActivityId = @"activity_id";
NSString *const kCRListMarketPrice = @"market_price";
NSString *const kCRListGoodsName = @"goods_name";
NSString *const kCRListStock = @"stock";
NSString *const kCRListRegion = @"region";
NSString *const kCRListCountry = @"country";
NSString *const kCRListCateName = @"cate_name";
NSString *const kCRListWishes = @"wishes";
NSString *const kCRListViewWishes = @"view_wishes";
NSString *const kCRListTagsArr = @"tags_arr";
NSString *const kCRListPrefix = @"prefix";
NSString *const kCRListTitleDesc = @"title_desc";
NSString *const kCRListGoodsId = @"goods_id";
NSString *const kCRListDefaultThumb = @"default_thumb";
NSString *const kCRListBrandName = @"brand_name";
NSString *const kCRListSaleType = @"sale_type";
NSString *const kCRListPrice = @"price";
NSString *const kCRListActivityTxt = @"activity_txt";
NSString *const kCRListCoverImage = @"cover_image";
NSString *const kCRListShortGoodsName = @"short_goods_name";


@interface CRList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CRList

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
            self.defaultImage = [self objectOrNilForKey:kCRListDefaultImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kCRListDescription fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kCRListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kCRListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kCRListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedCRSaleTypeMaps = [dict objectForKey:kCRListSaleTypeMaps];
    NSMutableArray *parsedCRSaleTypeMaps = [NSMutableArray array];
    if ([receivedCRSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCRSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCRSaleTypeMaps addObject:[CRSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCRSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedCRSaleTypeMaps addObject:[CRSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedCRSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedCRSaleTypeMaps];
            self.saleTypeInfo = [CRSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kCRListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kCRListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kCRListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kCRListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kCRListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kCRListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kCRListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kCRListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kCRListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kCRListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kCRListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kCRListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kCRListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kCRListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kCRListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kCRListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kCRListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kCRListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kCRListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kCRListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kCRListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kCRListCoverImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kCRListShortGoodsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kCRListDefaultImage];
    [mutableDict setValue:self.listDescription forKey:kCRListDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kCRListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kCRListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kCRListIfSpecial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kCRListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kCRListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kCRListActivityKinds];
    [mutableDict setValue:self.tags forKey:kCRListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kCRListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kCRListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kCRListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kCRListStock];
    [mutableDict setValue:self.region forKey:kCRListRegion];
    [mutableDict setValue:self.country forKey:kCRListCountry];
    [mutableDict setValue:self.cateName forKey:kCRListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kCRListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kCRListViewWishes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kCRListTagsArr];
    [mutableDict setValue:self.prefix forKey:kCRListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kCRListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kCRListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kCRListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kCRListBrandName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kCRListSaleType];
    [mutableDict setValue:self.price forKey:kCRListPrice];
    [mutableDict setValue:self.activityTxt forKey:kCRListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kCRListCoverImage];
    [mutableDict setValue:self.shortGoodsName forKey:kCRListShortGoodsName];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kCRListDefaultImage];
    self.listDescription = [aDecoder decodeObjectForKey:kCRListDescription];
    self.weight = [aDecoder decodeDoubleForKey:kCRListWeight];
    self.liked = [aDecoder decodeBoolForKey:kCRListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kCRListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kCRListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kCRListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kCRListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kCRListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kCRListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kCRListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kCRListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kCRListStock];
    self.region = [aDecoder decodeObjectForKey:kCRListRegion];
    self.country = [aDecoder decodeObjectForKey:kCRListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kCRListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kCRListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kCRListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kCRListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kCRListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kCRListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kCRListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kCRListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kCRListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kCRListSaleType];
    self.price = [aDecoder decodeObjectForKey:kCRListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kCRListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kCRListCoverImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kCRListShortGoodsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kCRListDefaultImage];
    [aCoder encodeObject:_listDescription forKey:kCRListDescription];
    [aCoder encodeDouble:_weight forKey:kCRListWeight];
    [aCoder encodeBool:_liked forKey:kCRListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kCRListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kCRListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kCRListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kCRListActivityKinds];
    [aCoder encodeObject:_tags forKey:kCRListTags];
    [aCoder encodeDouble:_activityId forKey:kCRListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kCRListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kCRListGoodsName];
    [aCoder encodeDouble:_stock forKey:kCRListStock];
    [aCoder encodeObject:_region forKey:kCRListRegion];
    [aCoder encodeObject:_country forKey:kCRListCountry];
    [aCoder encodeObject:_cateName forKey:kCRListCateName];
    [aCoder encodeDouble:_wishes forKey:kCRListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kCRListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kCRListTagsArr];
    [aCoder encodeObject:_prefix forKey:kCRListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kCRListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kCRListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kCRListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kCRListBrandName];
    [aCoder encodeObject:_saleType forKey:kCRListSaleType];
    [aCoder encodeObject:_price forKey:kCRListPrice];
    [aCoder encodeObject:_activityTxt forKey:kCRListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kCRListCoverImage];
    [aCoder encodeObject:_shortGoodsName forKey:kCRListShortGoodsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    CRList *copy = [[CRList alloc] init];
    
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
