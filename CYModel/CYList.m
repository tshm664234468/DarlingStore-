//
//  CYList.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CYList.h"
#import "CYSaleTypeMaps.h"
#import "CYSaleTypeInfo.h"


NSString *const kCYListDefaultImage = @"default_image";
NSString *const kCYListShortGoodsName = @"short_goods_name";
NSString *const kCYListWeight = @"weight";
NSString *const kCYListLiked = @"liked";
NSString *const kCYListIfSpecial = @"if_special";
NSString *const kCYListSaleTypeMaps = @"sale_type_maps";
NSString *const kCYListSaleTypeInfo = @"sale_type_info";
NSString *const kCYListActivityKinds = @"activity_kinds";
NSString *const kCYListTags = @"tags";
NSString *const kCYListActivityId = @"activity_id";
NSString *const kCYListMarketPrice = @"market_price";
NSString *const kCYListGoodsName = @"goods_name";
NSString *const kCYListStock = @"stock";
NSString *const kCYListRegion = @"region";
NSString *const kCYListCountry = @"country";
NSString *const kCYListCateName = @"cate_name";
NSString *const kCYListWishes = @"wishes";
NSString *const kCYListViewWishes = @"view_wishes";
NSString *const kCYListTagsArr = @"tags_arr";
NSString *const kCYListPrefix = @"prefix";
NSString *const kCYListTitleDesc = @"title_desc";
NSString *const kCYListGoodsId = @"goods_id";
NSString *const kCYListDefaultThumb = @"default_thumb";
NSString *const kCYListBrandName = @"brand_name";
NSString *const kCYListSaleType = @"sale_type";
NSString *const kCYListPrice = @"price";
NSString *const kCYListActivityTxt = @"activity_txt";
NSString *const kCYListCoverImage = @"cover_image";
NSString *const kCYListDescription = @"description";


@interface CYList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CYList

@synthesize defaultImage = _defaultImage;
@synthesize shortGoodsName = _shortGoodsName;
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
@synthesize listDescription = _listDescription;


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
            self.defaultImage = [self objectOrNilForKey:kCYListDefaultImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kCYListShortGoodsName fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kCYListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kCYListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kCYListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedCYSaleTypeMaps = [dict objectForKey:kCYListSaleTypeMaps];
    NSMutableArray *parsedCYSaleTypeMaps = [NSMutableArray array];
    if ([receivedCYSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCYSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCYSaleTypeMaps addObject:[CYSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCYSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedCYSaleTypeMaps addObject:[CYSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedCYSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedCYSaleTypeMaps];
            self.saleTypeInfo = [CYSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kCYListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kCYListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kCYListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kCYListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kCYListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kCYListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kCYListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kCYListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kCYListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kCYListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kCYListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kCYListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kCYListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kCYListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kCYListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kCYListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kCYListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kCYListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kCYListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kCYListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kCYListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kCYListCoverImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kCYListDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kCYListDefaultImage];
    [mutableDict setValue:self.shortGoodsName forKey:kCYListShortGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kCYListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kCYListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kCYListIfSpecial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kCYListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kCYListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kCYListActivityKinds];
    [mutableDict setValue:self.tags forKey:kCYListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kCYListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kCYListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kCYListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kCYListStock];
    [mutableDict setValue:self.region forKey:kCYListRegion];
    [mutableDict setValue:self.country forKey:kCYListCountry];
    [mutableDict setValue:self.cateName forKey:kCYListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kCYListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kCYListViewWishes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kCYListTagsArr];
    [mutableDict setValue:self.prefix forKey:kCYListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kCYListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kCYListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kCYListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kCYListBrandName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kCYListSaleType];
    [mutableDict setValue:self.price forKey:kCYListPrice];
    [mutableDict setValue:self.activityTxt forKey:kCYListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kCYListCoverImage];
    [mutableDict setValue:self.listDescription forKey:kCYListDescription];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kCYListDefaultImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kCYListShortGoodsName];
    self.weight = [aDecoder decodeDoubleForKey:kCYListWeight];
    self.liked = [aDecoder decodeBoolForKey:kCYListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kCYListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kCYListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kCYListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kCYListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kCYListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kCYListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kCYListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kCYListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kCYListStock];
    self.region = [aDecoder decodeObjectForKey:kCYListRegion];
    self.country = [aDecoder decodeObjectForKey:kCYListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kCYListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kCYListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kCYListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kCYListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kCYListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kCYListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kCYListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kCYListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kCYListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kCYListSaleType];
    self.price = [aDecoder decodeObjectForKey:kCYListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kCYListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kCYListCoverImage];
    self.listDescription = [aDecoder decodeObjectForKey:kCYListDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kCYListDefaultImage];
    [aCoder encodeObject:_shortGoodsName forKey:kCYListShortGoodsName];
    [aCoder encodeDouble:_weight forKey:kCYListWeight];
    [aCoder encodeBool:_liked forKey:kCYListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kCYListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kCYListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kCYListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kCYListActivityKinds];
    [aCoder encodeObject:_tags forKey:kCYListTags];
    [aCoder encodeDouble:_activityId forKey:kCYListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kCYListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kCYListGoodsName];
    [aCoder encodeDouble:_stock forKey:kCYListStock];
    [aCoder encodeObject:_region forKey:kCYListRegion];
    [aCoder encodeObject:_country forKey:kCYListCountry];
    [aCoder encodeObject:_cateName forKey:kCYListCateName];
    [aCoder encodeDouble:_wishes forKey:kCYListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kCYListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kCYListTagsArr];
    [aCoder encodeObject:_prefix forKey:kCYListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kCYListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kCYListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kCYListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kCYListBrandName];
    [aCoder encodeObject:_saleType forKey:kCYListSaleType];
    [aCoder encodeObject:_price forKey:kCYListPrice];
    [aCoder encodeObject:_activityTxt forKey:kCYListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kCYListCoverImage];
    [aCoder encodeObject:_listDescription forKey:kCYListDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    CYList *copy = [[CYList alloc] init];
    
    if (copy) {

        copy.defaultImage = [self.defaultImage copyWithZone:zone];
        copy.shortGoodsName = [self.shortGoodsName copyWithZone:zone];
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
        copy.listDescription = [self.listDescription copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_defaultImage release];
    [_shortGoodsName release];
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
    [_listDescription release];
    [super dealloc];
}

@end
