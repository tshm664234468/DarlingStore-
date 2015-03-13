//
//  ITEMList.m
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ITEMList.h"
#import "ITEMSaleTypeMaps.h"
#import "ITEMSaleTypeInfo.h"


NSString *const kITEMListDefaultImage = @"default_image";
NSString *const kITEMListShortGoodsName = @"short_goods_name";
NSString *const kITEMListWeight = @"weight";
NSString *const kITEMListLiked = @"liked";
NSString *const kITEMListIfSpecial = @"if_special";
NSString *const kITEMListSaleTypeMaps = @"sale_type_maps";
NSString *const kITEMListSaleTypeInfo = @"sale_type_info";
NSString *const kITEMListActivityKinds = @"activity_kinds";
NSString *const kITEMListTags = @"tags";
NSString *const kITEMListActivityId = @"activity_id";
NSString *const kITEMListMarketPrice = @"market_price";
NSString *const kITEMListGoodsName = @"goods_name";
NSString *const kITEMListStock = @"stock";
NSString *const kITEMListRegion = @"region";
NSString *const kITEMListCountry = @"country";
NSString *const kITEMListCateName = @"cate_name";
NSString *const kITEMListWishes = @"wishes";
NSString *const kITEMListViewWishes = @"view_wishes";
NSString *const kITEMListTagsArr = @"tags_arr";
NSString *const kITEMListPrefix = @"prefix";
NSString *const kITEMListTitleDesc = @"title_desc";
NSString *const kITEMListGoodsId = @"goods_id";
NSString *const kITEMListDefaultThumb = @"default_thumb";
NSString *const kITEMListBrandName = @"brand_name";
NSString *const kITEMListSaleType = @"sale_type";
NSString *const kITEMListPrice = @"price";
NSString *const kITEMListActivityTxt = @"activity_txt";
NSString *const kITEMListCoverImage = @"cover_image";
NSString *const kITEMListDescription = @"description";


@interface ITEMList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITEMList

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
            self.defaultImage = [self objectOrNilForKey:kITEMListDefaultImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kITEMListShortGoodsName fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kITEMListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kITEMListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kITEMListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedITEMSaleTypeMaps = [dict objectForKey:kITEMListSaleTypeMaps];
    NSMutableArray *parsedITEMSaleTypeMaps = [NSMutableArray array];
    if ([receivedITEMSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedITEMSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedITEMSaleTypeMaps addObject:[ITEMSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedITEMSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedITEMSaleTypeMaps addObject:[ITEMSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedITEMSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedITEMSaleTypeMaps];
            self.saleTypeInfo = [ITEMSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kITEMListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kITEMListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kITEMListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kITEMListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kITEMListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kITEMListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kITEMListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kITEMListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kITEMListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kITEMListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kITEMListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kITEMListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kITEMListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kITEMListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kITEMListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kITEMListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kITEMListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kITEMListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kITEMListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kITEMListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kITEMListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kITEMListCoverImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kITEMListDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kITEMListDefaultImage];
    [mutableDict setValue:self.shortGoodsName forKey:kITEMListShortGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kITEMListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kITEMListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kITEMListIfSpecial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kITEMListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kITEMListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kITEMListActivityKinds];
    [mutableDict setValue:self.tags forKey:kITEMListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kITEMListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kITEMListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kITEMListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kITEMListStock];
    [mutableDict setValue:self.region forKey:kITEMListRegion];
    [mutableDict setValue:self.country forKey:kITEMListCountry];
    [mutableDict setValue:self.cateName forKey:kITEMListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kITEMListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kITEMListViewWishes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kITEMListTagsArr];
    [mutableDict setValue:self.prefix forKey:kITEMListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kITEMListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kITEMListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kITEMListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kITEMListBrandName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kITEMListSaleType];
    [mutableDict setValue:self.price forKey:kITEMListPrice];
    [mutableDict setValue:self.activityTxt forKey:kITEMListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kITEMListCoverImage];
    [mutableDict setValue:self.listDescription forKey:kITEMListDescription];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kITEMListDefaultImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kITEMListShortGoodsName];
    self.weight = [aDecoder decodeDoubleForKey:kITEMListWeight];
    self.liked = [aDecoder decodeBoolForKey:kITEMListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kITEMListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kITEMListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kITEMListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kITEMListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kITEMListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kITEMListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kITEMListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kITEMListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kITEMListStock];
    self.region = [aDecoder decodeObjectForKey:kITEMListRegion];
    self.country = [aDecoder decodeObjectForKey:kITEMListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kITEMListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kITEMListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kITEMListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kITEMListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kITEMListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kITEMListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kITEMListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kITEMListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kITEMListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kITEMListSaleType];
    self.price = [aDecoder decodeObjectForKey:kITEMListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kITEMListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kITEMListCoverImage];
    self.listDescription = [aDecoder decodeObjectForKey:kITEMListDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kITEMListDefaultImage];
    [aCoder encodeObject:_shortGoodsName forKey:kITEMListShortGoodsName];
    [aCoder encodeDouble:_weight forKey:kITEMListWeight];
    [aCoder encodeBool:_liked forKey:kITEMListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kITEMListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kITEMListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kITEMListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kITEMListActivityKinds];
    [aCoder encodeObject:_tags forKey:kITEMListTags];
    [aCoder encodeDouble:_activityId forKey:kITEMListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kITEMListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kITEMListGoodsName];
    [aCoder encodeDouble:_stock forKey:kITEMListStock];
    [aCoder encodeObject:_region forKey:kITEMListRegion];
    [aCoder encodeObject:_country forKey:kITEMListCountry];
    [aCoder encodeObject:_cateName forKey:kITEMListCateName];
    [aCoder encodeDouble:_wishes forKey:kITEMListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kITEMListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kITEMListTagsArr];
    [aCoder encodeObject:_prefix forKey:kITEMListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kITEMListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kITEMListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kITEMListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kITEMListBrandName];
    [aCoder encodeObject:_saleType forKey:kITEMListSaleType];
    [aCoder encodeObject:_price forKey:kITEMListPrice];
    [aCoder encodeObject:_activityTxt forKey:kITEMListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kITEMListCoverImage];
    [aCoder encodeObject:_listDescription forKey:kITEMListDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITEMList *copy = [[ITEMList alloc] init];
    
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
