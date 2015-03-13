//
//  GXList.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GXList.h"
#import "GXSaleTypeMaps.h"
#import "GXSaleTypeInfo.h"


NSString *const kGXListDefaultImage = @"default_image";
NSString *const kGXListShortGoodsName = @"short_goods_name";
NSString *const kGXListWeight = @"weight";
NSString *const kGXListLiked = @"liked";
NSString *const kGXListIfSpecial = @"if_special";
NSString *const kGXListSaleTypeMaps = @"sale_type_maps";
NSString *const kGXListSaleTypeInfo = @"sale_type_info";
NSString *const kGXListActivityKinds = @"activity_kinds";
NSString *const kGXListTags = @"tags";
NSString *const kGXListActivityId = @"activity_id";
NSString *const kGXListMarketPrice = @"market_price";
NSString *const kGXListGoodsName = @"goods_name";
NSString *const kGXListStock = @"stock";
NSString *const kGXListRegion = @"region";
NSString *const kGXListCountry = @"country";
NSString *const kGXListCateName = @"cate_name";
NSString *const kGXListWishes = @"wishes";
NSString *const kGXListViewWishes = @"view_wishes";
NSString *const kGXListTagsArr = @"tags_arr";
NSString *const kGXListPrefix = @"prefix";
NSString *const kGXListTitleDesc = @"title_desc";
NSString *const kGXListGoodsId = @"goods_id";
NSString *const kGXListDefaultThumb = @"default_thumb";
NSString *const kGXListBrandName = @"brand_name";
NSString *const kGXListSaleType = @"sale_type";
NSString *const kGXListPrice = @"price";
NSString *const kGXListActivityTxt = @"activity_txt";
NSString *const kGXListCoverImage = @"cover_image";
NSString *const kGXListDescription = @"description";


@interface GXList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GXList

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
            self.defaultImage = [self objectOrNilForKey:kGXListDefaultImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kGXListShortGoodsName fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kGXListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kGXListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kGXListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedGXSaleTypeMaps = [dict objectForKey:kGXListSaleTypeMaps];
    NSMutableArray *parsedGXSaleTypeMaps = [NSMutableArray array];
    if ([receivedGXSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGXSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGXSaleTypeMaps addObject:[GXSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGXSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedGXSaleTypeMaps addObject:[GXSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedGXSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedGXSaleTypeMaps];
            self.saleTypeInfo = [GXSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kGXListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kGXListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kGXListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kGXListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kGXListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kGXListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kGXListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kGXListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kGXListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kGXListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kGXListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kGXListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kGXListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kGXListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kGXListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kGXListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kGXListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kGXListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kGXListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kGXListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kGXListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kGXListCoverImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kGXListDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kGXListDefaultImage];
    [mutableDict setValue:self.shortGoodsName forKey:kGXListShortGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kGXListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kGXListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kGXListIfSpecial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kGXListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kGXListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kGXListActivityKinds];
    [mutableDict setValue:self.tags forKey:kGXListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kGXListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kGXListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kGXListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kGXListStock];
    [mutableDict setValue:self.region forKey:kGXListRegion];
    [mutableDict setValue:self.country forKey:kGXListCountry];
    [mutableDict setValue:self.cateName forKey:kGXListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kGXListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kGXListViewWishes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kGXListTagsArr];
    [mutableDict setValue:self.prefix forKey:kGXListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kGXListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kGXListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kGXListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kGXListBrandName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kGXListSaleType];
    [mutableDict setValue:self.price forKey:kGXListPrice];
    [mutableDict setValue:self.activityTxt forKey:kGXListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kGXListCoverImage];
    [mutableDict setValue:self.listDescription forKey:kGXListDescription];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kGXListDefaultImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kGXListShortGoodsName];
    self.weight = [aDecoder decodeDoubleForKey:kGXListWeight];
    self.liked = [aDecoder decodeBoolForKey:kGXListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kGXListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kGXListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kGXListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kGXListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kGXListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kGXListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kGXListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kGXListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kGXListStock];
    self.region = [aDecoder decodeObjectForKey:kGXListRegion];
    self.country = [aDecoder decodeObjectForKey:kGXListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kGXListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kGXListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kGXListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kGXListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kGXListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kGXListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kGXListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kGXListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kGXListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kGXListSaleType];
    self.price = [aDecoder decodeObjectForKey:kGXListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kGXListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kGXListCoverImage];
    self.listDescription = [aDecoder decodeObjectForKey:kGXListDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kGXListDefaultImage];
    [aCoder encodeObject:_shortGoodsName forKey:kGXListShortGoodsName];
    [aCoder encodeDouble:_weight forKey:kGXListWeight];
    [aCoder encodeBool:_liked forKey:kGXListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kGXListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kGXListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kGXListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kGXListActivityKinds];
    [aCoder encodeObject:_tags forKey:kGXListTags];
    [aCoder encodeDouble:_activityId forKey:kGXListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kGXListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kGXListGoodsName];
    [aCoder encodeDouble:_stock forKey:kGXListStock];
    [aCoder encodeObject:_region forKey:kGXListRegion];
    [aCoder encodeObject:_country forKey:kGXListCountry];
    [aCoder encodeObject:_cateName forKey:kGXListCateName];
    [aCoder encodeDouble:_wishes forKey:kGXListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kGXListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kGXListTagsArr];
    [aCoder encodeObject:_prefix forKey:kGXListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kGXListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kGXListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kGXListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kGXListBrandName];
    [aCoder encodeObject:_saleType forKey:kGXListSaleType];
    [aCoder encodeObject:_price forKey:kGXListPrice];
    [aCoder encodeObject:_activityTxt forKey:kGXListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kGXListCoverImage];
    [aCoder encodeObject:_listDescription forKey:kGXListDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    GXList *copy = [[GXList alloc] init];
    
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
