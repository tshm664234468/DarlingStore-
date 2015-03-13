//
//  BZRMList.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRMList.h"
#import "BZRMSaleTypeMaps.h"
#import "BZRMSaleTypeInfo.h"


NSString *const kBZRMListDefaultImage = @"default_image";
NSString *const kBZRMListDescription = @"description";
NSString *const kBZRMListWeight = @"weight";
NSString *const kBZRMListLiked = @"liked";
NSString *const kBZRMListIfSpecial = @"if_special";
NSString *const kBZRMListSaleTypeMaps = @"sale_type_maps";
NSString *const kBZRMListSaleTypeInfo = @"sale_type_info";
NSString *const kBZRMListActivityKinds = @"activity_kinds";
NSString *const kBZRMListTags = @"tags";
NSString *const kBZRMListActivityId = @"activity_id";
NSString *const kBZRMListMarketPrice = @"market_price";
NSString *const kBZRMListGoodsName = @"goods_name";
NSString *const kBZRMListStock = @"stock";
NSString *const kBZRMListRegion = @"region";
NSString *const kBZRMListCountry = @"country";
NSString *const kBZRMListCateName = @"cate_name";
NSString *const kBZRMListWishes = @"wishes";
NSString *const kBZRMListViewWishes = @"view_wishes";
NSString *const kBZRMListTagsArr = @"tags_arr";
NSString *const kBZRMListPrefix = @"prefix";
NSString *const kBZRMListTitleDesc = @"title_desc";
NSString *const kBZRMListGoodsId = @"goods_id";
NSString *const kBZRMListDefaultThumb = @"default_thumb";
NSString *const kBZRMListBrandName = @"brand_name";
NSString *const kBZRMListSaleType = @"sale_type";
NSString *const kBZRMListPrice = @"price";
NSString *const kBZRMListActivityTxt = @"activity_txt";
NSString *const kBZRMListCoverImage = @"cover_image";
NSString *const kBZRMListShortGoodsName = @"short_goods_name";


@interface BZRMList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRMList

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
            self.defaultImage = [self objectOrNilForKey:kBZRMListDefaultImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kBZRMListDescription fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kBZRMListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kBZRMListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kBZRMListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedBZRMSaleTypeMaps = [dict objectForKey:kBZRMListSaleTypeMaps];
    NSMutableArray *parsedBZRMSaleTypeMaps = [NSMutableArray array];
    if ([receivedBZRMSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBZRMSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBZRMSaleTypeMaps addObject:[BZRMSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBZRMSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedBZRMSaleTypeMaps addObject:[BZRMSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedBZRMSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedBZRMSaleTypeMaps];
            self.saleTypeInfo = [BZRMSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kBZRMListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kBZRMListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kBZRMListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kBZRMListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kBZRMListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kBZRMListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kBZRMListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kBZRMListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kBZRMListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kBZRMListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kBZRMListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kBZRMListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kBZRMListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kBZRMListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kBZRMListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kBZRMListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kBZRMListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kBZRMListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kBZRMListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kBZRMListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kBZRMListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kBZRMListCoverImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kBZRMListShortGoodsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kBZRMListDefaultImage];
    [mutableDict setValue:self.listDescription forKey:kBZRMListDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kBZRMListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kBZRMListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kBZRMListIfSpecial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kBZRMListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kBZRMListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kBZRMListActivityKinds];
    [mutableDict setValue:self.tags forKey:kBZRMListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kBZRMListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kBZRMListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kBZRMListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kBZRMListStock];
    [mutableDict setValue:self.region forKey:kBZRMListRegion];
    [mutableDict setValue:self.country forKey:kBZRMListCountry];
    [mutableDict setValue:self.cateName forKey:kBZRMListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kBZRMListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kBZRMListViewWishes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kBZRMListTagsArr];
    [mutableDict setValue:self.prefix forKey:kBZRMListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kBZRMListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kBZRMListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kBZRMListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kBZRMListBrandName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kBZRMListSaleType];
    [mutableDict setValue:self.price forKey:kBZRMListPrice];
    [mutableDict setValue:self.activityTxt forKey:kBZRMListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kBZRMListCoverImage];
    [mutableDict setValue:self.shortGoodsName forKey:kBZRMListShortGoodsName];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kBZRMListDefaultImage];
    self.listDescription = [aDecoder decodeObjectForKey:kBZRMListDescription];
    self.weight = [aDecoder decodeDoubleForKey:kBZRMListWeight];
    self.liked = [aDecoder decodeBoolForKey:kBZRMListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kBZRMListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kBZRMListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kBZRMListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kBZRMListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kBZRMListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kBZRMListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kBZRMListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kBZRMListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kBZRMListStock];
    self.region = [aDecoder decodeObjectForKey:kBZRMListRegion];
    self.country = [aDecoder decodeObjectForKey:kBZRMListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kBZRMListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kBZRMListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kBZRMListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kBZRMListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kBZRMListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kBZRMListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kBZRMListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kBZRMListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kBZRMListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kBZRMListSaleType];
    self.price = [aDecoder decodeObjectForKey:kBZRMListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kBZRMListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kBZRMListCoverImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kBZRMListShortGoodsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kBZRMListDefaultImage];
    [aCoder encodeObject:_listDescription forKey:kBZRMListDescription];
    [aCoder encodeDouble:_weight forKey:kBZRMListWeight];
    [aCoder encodeBool:_liked forKey:kBZRMListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kBZRMListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kBZRMListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kBZRMListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kBZRMListActivityKinds];
    [aCoder encodeObject:_tags forKey:kBZRMListTags];
    [aCoder encodeDouble:_activityId forKey:kBZRMListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kBZRMListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kBZRMListGoodsName];
    [aCoder encodeDouble:_stock forKey:kBZRMListStock];
    [aCoder encodeObject:_region forKey:kBZRMListRegion];
    [aCoder encodeObject:_country forKey:kBZRMListCountry];
    [aCoder encodeObject:_cateName forKey:kBZRMListCateName];
    [aCoder encodeDouble:_wishes forKey:kBZRMListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kBZRMListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kBZRMListTagsArr];
    [aCoder encodeObject:_prefix forKey:kBZRMListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kBZRMListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kBZRMListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kBZRMListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kBZRMListBrandName];
    [aCoder encodeObject:_saleType forKey:kBZRMListSaleType];
    [aCoder encodeObject:_price forKey:kBZRMListPrice];
    [aCoder encodeObject:_activityTxt forKey:kBZRMListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kBZRMListCoverImage];
    [aCoder encodeObject:_shortGoodsName forKey:kBZRMListShortGoodsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRMList *copy = [[BZRMList alloc] init];
    
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
