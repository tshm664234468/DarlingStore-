//
//  BZRPList.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRPList.h"
#import "BZRPSaleTypeMaps.h"
#import "BZRPSaleTypeInfo.h"


NSString *const kBZRPListDefaultImage = @"default_image";
NSString *const kBZRPListShortGoodsName = @"short_goods_name";
NSString *const kBZRPListWeight = @"weight";
NSString *const kBZRPListLiked = @"liked";
NSString *const kBZRPListIfSpecial = @"if_special";
NSString *const kBZRPListSaleTypeMaps = @"sale_type_maps";
NSString *const kBZRPListSaleTypeInfo = @"sale_type_info";
NSString *const kBZRPListActivityKinds = @"activity_kinds";
NSString *const kBZRPListTags = @"tags";
NSString *const kBZRPListActivityId = @"activity_id";
NSString *const kBZRPListMarketPrice = @"market_price";
NSString *const kBZRPListGoodsName = @"goods_name";
NSString *const kBZRPListStock = @"stock";
NSString *const kBZRPListRegion = @"region";
NSString *const kBZRPListCountry = @"country";
NSString *const kBZRPListCateName = @"cate_name";
NSString *const kBZRPListWishes = @"wishes";
NSString *const kBZRPListViewWishes = @"view_wishes";
NSString *const kBZRPListTagsArr = @"tags_arr";
NSString *const kBZRPListPrefix = @"prefix";
NSString *const kBZRPListTitleDesc = @"title_desc";
NSString *const kBZRPListGoodsId = @"goods_id";
NSString *const kBZRPListDefaultThumb = @"default_thumb";
NSString *const kBZRPListBrandName = @"brand_name";
NSString *const kBZRPListSaleType = @"sale_type";
NSString *const kBZRPListPrice = @"price";
NSString *const kBZRPListActivityTxt = @"activity_txt";
NSString *const kBZRPListCoverImage = @"cover_image";
NSString *const kBZRPListDescription = @"description";


@interface BZRPList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRPList

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
            self.defaultImage = [self objectOrNilForKey:kBZRPListDefaultImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kBZRPListShortGoodsName fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kBZRPListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kBZRPListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kBZRPListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedBZRPSaleTypeMaps = [dict objectForKey:kBZRPListSaleTypeMaps];
    NSMutableArray *parsedBZRPSaleTypeMaps = [NSMutableArray array];
    if ([receivedBZRPSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBZRPSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBZRPSaleTypeMaps addObject:[BZRPSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBZRPSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedBZRPSaleTypeMaps addObject:[BZRPSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedBZRPSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedBZRPSaleTypeMaps];
            self.saleTypeInfo = [BZRPSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kBZRPListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kBZRPListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kBZRPListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kBZRPListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kBZRPListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kBZRPListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kBZRPListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kBZRPListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kBZRPListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kBZRPListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kBZRPListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kBZRPListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kBZRPListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kBZRPListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kBZRPListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kBZRPListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kBZRPListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kBZRPListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kBZRPListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kBZRPListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kBZRPListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kBZRPListCoverImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kBZRPListDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kBZRPListDefaultImage];
    [mutableDict setValue:self.shortGoodsName forKey:kBZRPListShortGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kBZRPListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kBZRPListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kBZRPListIfSpecial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kBZRPListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kBZRPListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kBZRPListActivityKinds];
    [mutableDict setValue:self.tags forKey:kBZRPListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kBZRPListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kBZRPListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kBZRPListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kBZRPListStock];
    [mutableDict setValue:self.region forKey:kBZRPListRegion];
    [mutableDict setValue:self.country forKey:kBZRPListCountry];
    [mutableDict setValue:self.cateName forKey:kBZRPListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kBZRPListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kBZRPListViewWishes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kBZRPListTagsArr];
    [mutableDict setValue:self.prefix forKey:kBZRPListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kBZRPListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kBZRPListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kBZRPListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kBZRPListBrandName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kBZRPListSaleType];
    [mutableDict setValue:self.price forKey:kBZRPListPrice];
    [mutableDict setValue:self.activityTxt forKey:kBZRPListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kBZRPListCoverImage];
    [mutableDict setValue:self.listDescription forKey:kBZRPListDescription];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kBZRPListDefaultImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kBZRPListShortGoodsName];
    self.weight = [aDecoder decodeDoubleForKey:kBZRPListWeight];
    self.liked = [aDecoder decodeBoolForKey:kBZRPListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kBZRPListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kBZRPListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kBZRPListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kBZRPListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kBZRPListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kBZRPListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kBZRPListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kBZRPListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kBZRPListStock];
    self.region = [aDecoder decodeObjectForKey:kBZRPListRegion];
    self.country = [aDecoder decodeObjectForKey:kBZRPListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kBZRPListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kBZRPListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kBZRPListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kBZRPListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kBZRPListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kBZRPListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kBZRPListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kBZRPListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kBZRPListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kBZRPListSaleType];
    self.price = [aDecoder decodeObjectForKey:kBZRPListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kBZRPListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kBZRPListCoverImage];
    self.listDescription = [aDecoder decodeObjectForKey:kBZRPListDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kBZRPListDefaultImage];
    [aCoder encodeObject:_shortGoodsName forKey:kBZRPListShortGoodsName];
    [aCoder encodeDouble:_weight forKey:kBZRPListWeight];
    [aCoder encodeBool:_liked forKey:kBZRPListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kBZRPListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kBZRPListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kBZRPListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kBZRPListActivityKinds];
    [aCoder encodeObject:_tags forKey:kBZRPListTags];
    [aCoder encodeDouble:_activityId forKey:kBZRPListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kBZRPListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kBZRPListGoodsName];
    [aCoder encodeDouble:_stock forKey:kBZRPListStock];
    [aCoder encodeObject:_region forKey:kBZRPListRegion];
    [aCoder encodeObject:_country forKey:kBZRPListCountry];
    [aCoder encodeObject:_cateName forKey:kBZRPListCateName];
    [aCoder encodeDouble:_wishes forKey:kBZRPListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kBZRPListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kBZRPListTagsArr];
    [aCoder encodeObject:_prefix forKey:kBZRPListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kBZRPListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kBZRPListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kBZRPListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kBZRPListBrandName];
    [aCoder encodeObject:_saleType forKey:kBZRPListSaleType];
    [aCoder encodeObject:_price forKey:kBZRPListPrice];
    [aCoder encodeObject:_activityTxt forKey:kBZRPListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kBZRPListCoverImage];
    [aCoder encodeObject:_listDescription forKey:kBZRPListDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRPList *copy = [[BZRPList alloc] init];
    
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
