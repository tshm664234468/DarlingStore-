//
//  TSList.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TSList.h"
#import "TSSaleTypeMaps.h"
#import "TSSaleTypeInfo.h"


NSString *const kTSListDefaultImage = @"default_image";
NSString *const kTSListDescription = @"description";
NSString *const kTSListWeight = @"weight";
NSString *const kTSListLiked = @"liked";
NSString *const kTSListIfSpecial = @"if_special";
NSString *const kTSListSaleTypeMaps = @"sale_type_maps";
NSString *const kTSListSaleTypeInfo = @"sale_type_info";
NSString *const kTSListActivityKinds = @"activity_kinds";
NSString *const kTSListTags = @"tags";
NSString *const kTSListActivityId = @"activity_id";
NSString *const kTSListMarketPrice = @"market_price";
NSString *const kTSListGoodsName = @"goods_name";
NSString *const kTSListStock = @"stock";
NSString *const kTSListRegion = @"region";
NSString *const kTSListCountry = @"country";
NSString *const kTSListCateName = @"cate_name";
NSString *const kTSListWishes = @"wishes";
NSString *const kTSListViewWishes = @"view_wishes";
NSString *const kTSListTagsArr = @"tags_arr";
NSString *const kTSListPrefix = @"prefix";
NSString *const kTSListTitleDesc = @"title_desc";
NSString *const kTSListGoodsId = @"goods_id";
NSString *const kTSListDefaultThumb = @"default_thumb";
NSString *const kTSListBrandName = @"brand_name";
NSString *const kTSListSaleType = @"sale_type";
NSString *const kTSListPrice = @"price";
NSString *const kTSListActivityTxt = @"activity_txt";
NSString *const kTSListCoverImage = @"cover_image";
NSString *const kTSListShortGoodsName = @"short_goods_name";


@interface TSList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TSList

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
            self.defaultImage = [self objectOrNilForKey:kTSListDefaultImage fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kTSListDescription fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kTSListWeight fromDictionary:dict] doubleValue];
            self.liked = [[self objectOrNilForKey:kTSListLiked fromDictionary:dict] boolValue];
            self.ifSpecial = [[self objectOrNilForKey:kTSListIfSpecial fromDictionary:dict] doubleValue];
    NSObject *receivedTSSaleTypeMaps = [dict objectForKey:kTSListSaleTypeMaps];
    NSMutableArray *parsedTSSaleTypeMaps = [NSMutableArray array];
    if ([receivedTSSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTSSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTSSaleTypeMaps addObject:[TSSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTSSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedTSSaleTypeMaps addObject:[TSSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedTSSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedTSSaleTypeMaps];
            self.saleTypeInfo = [TSSaleTypeInfo modelObjectWithDictionary:[dict objectForKey:kTSListSaleTypeInfo]];
            self.activityKinds = [self objectOrNilForKey:kTSListActivityKinds fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kTSListTags fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kTSListActivityId fromDictionary:dict] doubleValue];
            self.marketPrice = [[self objectOrNilForKey:kTSListMarketPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kTSListGoodsName fromDictionary:dict];
            self.stock = [[self objectOrNilForKey:kTSListStock fromDictionary:dict] doubleValue];
            self.region = [self objectOrNilForKey:kTSListRegion fromDictionary:dict];
            self.country = [self objectOrNilForKey:kTSListCountry fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kTSListCateName fromDictionary:dict];
            self.wishes = [[self objectOrNilForKey:kTSListWishes fromDictionary:dict] doubleValue];
            self.viewWishes = [[self objectOrNilForKey:kTSListViewWishes fromDictionary:dict] doubleValue];
            self.tagsArr = [self objectOrNilForKey:kTSListTagsArr fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kTSListPrefix fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kTSListTitleDesc fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kTSListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kTSListDefaultThumb fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kTSListBrandName fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kTSListSaleType fromDictionary:dict];
            self.price = [self objectOrNilForKey:kTSListPrice fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kTSListActivityTxt fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kTSListCoverImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kTSListShortGoodsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultImage forKey:kTSListDefaultImage];
    [mutableDict setValue:self.listDescription forKey:kTSListDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kTSListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.liked] forKey:kTSListLiked];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ifSpecial] forKey:kTSListIfSpecial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kTSListSaleTypeMaps];
    [mutableDict setValue:[self.saleTypeInfo dictionaryRepresentation] forKey:kTSListSaleTypeInfo];
    [mutableDict setValue:self.activityKinds forKey:kTSListActivityKinds];
    [mutableDict setValue:self.tags forKey:kTSListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kTSListActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.marketPrice] forKey:kTSListMarketPrice];
    [mutableDict setValue:self.goodsName forKey:kTSListGoodsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stock] forKey:kTSListStock];
    [mutableDict setValue:self.region forKey:kTSListRegion];
    [mutableDict setValue:self.country forKey:kTSListCountry];
    [mutableDict setValue:self.cateName forKey:kTSListCateName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.wishes] forKey:kTSListWishes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewWishes] forKey:kTSListViewWishes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTagsArr] forKey:kTSListTagsArr];
    [mutableDict setValue:self.prefix forKey:kTSListPrefix];
    [mutableDict setValue:self.titleDesc forKey:kTSListTitleDesc];
    [mutableDict setValue:self.goodsId forKey:kTSListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kTSListDefaultThumb];
    [mutableDict setValue:self.brandName forKey:kTSListBrandName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleType] forKey:kTSListSaleType];
    [mutableDict setValue:self.price forKey:kTSListPrice];
    [mutableDict setValue:self.activityTxt forKey:kTSListActivityTxt];
    [mutableDict setValue:self.coverImage forKey:kTSListCoverImage];
    [mutableDict setValue:self.shortGoodsName forKey:kTSListShortGoodsName];

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

    self.defaultImage = [aDecoder decodeObjectForKey:kTSListDefaultImage];
    self.listDescription = [aDecoder decodeObjectForKey:kTSListDescription];
    self.weight = [aDecoder decodeDoubleForKey:kTSListWeight];
    self.liked = [aDecoder decodeBoolForKey:kTSListLiked];
    self.ifSpecial = [aDecoder decodeDoubleForKey:kTSListIfSpecial];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kTSListSaleTypeMaps];
    self.saleTypeInfo = [aDecoder decodeObjectForKey:kTSListSaleTypeInfo];
    self.activityKinds = [aDecoder decodeObjectForKey:kTSListActivityKinds];
    self.tags = [aDecoder decodeObjectForKey:kTSListTags];
    self.activityId = [aDecoder decodeDoubleForKey:kTSListActivityId];
    self.marketPrice = [aDecoder decodeDoubleForKey:kTSListMarketPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kTSListGoodsName];
    self.stock = [aDecoder decodeDoubleForKey:kTSListStock];
    self.region = [aDecoder decodeObjectForKey:kTSListRegion];
    self.country = [aDecoder decodeObjectForKey:kTSListCountry];
    self.cateName = [aDecoder decodeObjectForKey:kTSListCateName];
    self.wishes = [aDecoder decodeDoubleForKey:kTSListWishes];
    self.viewWishes = [aDecoder decodeDoubleForKey:kTSListViewWishes];
    self.tagsArr = [aDecoder decodeObjectForKey:kTSListTagsArr];
    self.prefix = [aDecoder decodeObjectForKey:kTSListPrefix];
    self.titleDesc = [aDecoder decodeObjectForKey:kTSListTitleDesc];
    self.goodsId = [aDecoder decodeObjectForKey:kTSListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kTSListDefaultThumb];
    self.brandName = [aDecoder decodeObjectForKey:kTSListBrandName];
    self.saleType = [aDecoder decodeObjectForKey:kTSListSaleType];
    self.price = [aDecoder decodeObjectForKey:kTSListPrice];
    self.activityTxt = [aDecoder decodeObjectForKey:kTSListActivityTxt];
    self.coverImage = [aDecoder decodeObjectForKey:kTSListCoverImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kTSListShortGoodsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultImage forKey:kTSListDefaultImage];
    [aCoder encodeObject:_listDescription forKey:kTSListDescription];
    [aCoder encodeDouble:_weight forKey:kTSListWeight];
    [aCoder encodeBool:_liked forKey:kTSListLiked];
    [aCoder encodeDouble:_ifSpecial forKey:kTSListIfSpecial];
    [aCoder encodeObject:_saleTypeMaps forKey:kTSListSaleTypeMaps];
    [aCoder encodeObject:_saleTypeInfo forKey:kTSListSaleTypeInfo];
    [aCoder encodeObject:_activityKinds forKey:kTSListActivityKinds];
    [aCoder encodeObject:_tags forKey:kTSListTags];
    [aCoder encodeDouble:_activityId forKey:kTSListActivityId];
    [aCoder encodeDouble:_marketPrice forKey:kTSListMarketPrice];
    [aCoder encodeObject:_goodsName forKey:kTSListGoodsName];
    [aCoder encodeDouble:_stock forKey:kTSListStock];
    [aCoder encodeObject:_region forKey:kTSListRegion];
    [aCoder encodeObject:_country forKey:kTSListCountry];
    [aCoder encodeObject:_cateName forKey:kTSListCateName];
    [aCoder encodeDouble:_wishes forKey:kTSListWishes];
    [aCoder encodeDouble:_viewWishes forKey:kTSListViewWishes];
    [aCoder encodeObject:_tagsArr forKey:kTSListTagsArr];
    [aCoder encodeObject:_prefix forKey:kTSListPrefix];
    [aCoder encodeObject:_titleDesc forKey:kTSListTitleDesc];
    [aCoder encodeObject:_goodsId forKey:kTSListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kTSListDefaultThumb];
    [aCoder encodeObject:_brandName forKey:kTSListBrandName];
    [aCoder encodeObject:_saleType forKey:kTSListSaleType];
    [aCoder encodeObject:_price forKey:kTSListPrice];
    [aCoder encodeObject:_activityTxt forKey:kTSListActivityTxt];
    [aCoder encodeObject:_coverImage forKey:kTSListCoverImage];
    [aCoder encodeObject:_shortGoodsName forKey:kTSListShortGoodsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    TSList *copy = [[TSList alloc] init];
    
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
