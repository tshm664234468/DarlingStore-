//
//  ZYList.m
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYList.h"
#import "ZYShows.h"
#import "ZYSaleTypeMaps.h"


NSString *const kZYListShares = @"shares";
NSString *const kZYListIsDisplayBar = @"is_display_bar";
NSString *const kZYListTitleDesc = @"title_desc";
NSString *const kZYListGoodsPeak = @"goods_peak";
NSString *const kZYListViewWishes = @"view_wishes";
NSString *const kZYListIfSpecial = @"if_special";
NSString *const kZYListCateName = @"cate_name";
NSString *const kZYListGoodsRank = @"goods_rank";
NSString *const kZYListSku = @"sku";
NSString *const kZYListPrefix = @"prefix";
NSString *const kZYListStock = @"stock";
NSString *const kZYListShortGoodsName = @"short_goods_name";
NSString *const kZYListTitle = @"title";
NSString *const kZYListActivityId = @"activity_id";
NSString *const kZYListTop = @"top";
NSString *const kZYListActivityKinds = @"activity_kinds";
NSString *const kZYListDescription = @"description";
NSString *const kZYListFlashStock = @"flash_stock";
NSString *const kZYListType = @"type";
NSString *const kZYListNewPrice = @"new_price";
NSString *const kZYListList = @"list";
NSString *const kZYListGoodsImage = @"goods_image";
NSString *const kZYListImage = @"image";
NSString *const kZYListPrice = @"price";
NSString *const kZYListCoverImage = @"cover_image";
NSString *const kZYListViews = @"views";
NSString *const kZYListTxt = @"txt";
NSString *const kZYListSales = @"sales";
NSString *const kZYListGoodsId = @"goods_id";
NSString *const kZYListDefaultThumb = @"default_thumb";
NSString *const kZYListOldPrice = @"old_price";
NSString *const kZYListClickWord = @"click_word";
NSString *const kZYListHeight = @"height";
NSString *const kZYListSaleType = @"sale_type";
NSString *const kZYListMarketPrice = @"market_price";
NSString *const kZYListWishes = @"wishes";
NSString *const kZYListOrders = @"orders";
NSString *const kZYListActivityTxt = @"activity_txt";
NSString *const kZYListErpId = @"erp_id";
NSString *const kZYListShows = @"shows";
NSString *const kZYListTags = @"tags";
NSString *const kZYListSalesMonth = @"sales_month";
NSString *const kZYListLimitBuyMun = @"limit_buy_mun";
NSString *const kZYListNext = @"next";
NSString *const kZYListDefaultImage = @"default_image";
NSString *const kZYListShape = @"shape";
NSString *const kZYListGoodsName = @"goods_name";
NSString *const kZYListSaleTypeMaps = @"sale_type_maps";
NSString *const kZYListIcon = @"icon";
NSString *const kZYListWidth = @"width";
NSString *const kZYListBrandName = @"brand_name";
NSString *const kZYListIconKey = @"icon_key";
NSString *const kZYListBrandId = @"brand_id";


@interface ZYList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYList

@synthesize shares = _shares;
@synthesize isDisplayBar = _isDisplayBar;
@synthesize titleDesc = _titleDesc;
@synthesize goodsPeak = _goodsPeak;
@synthesize viewWishes = _viewWishes;
@synthesize ifSpecial = _ifSpecial;
@synthesize cateName = _cateName;
@synthesize goodsRank = _goodsRank;
@synthesize sku = _sku;
@synthesize prefix = _prefix;
@synthesize stock = _stock;
@synthesize shortGoodsName = _shortGoodsName;
@synthesize title = _title;
@synthesize activityId = _activityId;
@synthesize top = _top;
@synthesize activityKinds = _activityKinds;
@synthesize listDescription = _listDescription;
@synthesize flashStock = _flashStock;
@synthesize type = _type;
@synthesize newPrice = _newPrice;
@synthesize list = _list;
@synthesize goodsImage = _goodsImage;
@synthesize image = _image;
@synthesize price = _price;
@synthesize coverImage = _coverImage;
@synthesize views = _views;
@synthesize txt = _txt;
@synthesize sales = _sales;
@synthesize goodsId = _goodsId;
@synthesize defaultThumb = _defaultThumb;
@synthesize oldPrice = _oldPrice;
@synthesize clickWord = _clickWord;
@synthesize height = _height;
@synthesize saleType = _saleType;
@synthesize marketPrice = _marketPrice;
@synthesize wishes = _wishes;
@synthesize orders = _orders;
@synthesize activityTxt = _activityTxt;
@synthesize erpId = _erpId;
@synthesize shows = _shows;
@synthesize tags = _tags;
@synthesize salesMonth = _salesMonth;
@synthesize limitBuyMun = _limitBuyMun;
@synthesize next = _next;
@synthesize defaultImage = _defaultImage;
@synthesize shape = _shape;
@synthesize goodsName = _goodsName;
@synthesize saleTypeMaps = _saleTypeMaps;
@synthesize icon = _icon;
@synthesize width = _width;
@synthesize brandName = _brandName;
@synthesize iconKey = _iconKey;
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
            self.shares = [self objectOrNilForKey:kZYListShares fromDictionary:dict];
            self.isDisplayBar = [self objectOrNilForKey:kZYListIsDisplayBar fromDictionary:dict];
            self.titleDesc = [self objectOrNilForKey:kZYListTitleDesc fromDictionary:dict];
            self.goodsPeak = [[self objectOrNilForKey:kZYListGoodsPeak fromDictionary:dict] doubleValue];
            self.viewWishes = [self objectOrNilForKey:kZYListViewWishes fromDictionary:dict];
            self.ifSpecial = [self objectOrNilForKey:kZYListIfSpecial fromDictionary:dict];
            self.cateName = [self objectOrNilForKey:kZYListCateName fromDictionary:dict];
            self.goodsRank = [self objectOrNilForKey:kZYListGoodsRank fromDictionary:dict];
            self.sku = [self objectOrNilForKey:kZYListSku fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kZYListPrefix fromDictionary:dict];
            self.stock = [self objectOrNilForKey:kZYListStock fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kZYListShortGoodsName fromDictionary:dict];
            self.title = [self objectOrNilForKey:kZYListTitle fromDictionary:dict];
            self.activityId = [self objectOrNilForKey:kZYListActivityId fromDictionary:dict];
            self.top = [self objectOrNilForKey:kZYListTop fromDictionary:dict];
            self.activityKinds = [self objectOrNilForKey:kZYListActivityKinds fromDictionary:dict];
            self.listDescription = [self objectOrNilForKey:kZYListDescription fromDictionary:dict];
            self.flashStock = [self objectOrNilForKey:kZYListFlashStock fromDictionary:dict];
            self.type = [self objectOrNilForKey:kZYListType fromDictionary:dict];
            self.newPrice = [self objectOrNilForKey:kZYListNewPrice fromDictionary:dict];
            self.list = [self objectOrNilForKey:kZYListList fromDictionary:dict];
            self.goodsImage = [self objectOrNilForKey:kZYListGoodsImage fromDictionary:dict];
            self.image = [self objectOrNilForKey:kZYListImage fromDictionary:dict];
            self.price = [self objectOrNilForKey:kZYListPrice fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kZYListCoverImage fromDictionary:dict];
            self.views = [self objectOrNilForKey:kZYListViews fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kZYListTxt fromDictionary:dict];
            self.sales = [self objectOrNilForKey:kZYListSales fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kZYListGoodsId fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kZYListDefaultThumb fromDictionary:dict];
            self.oldPrice = [self objectOrNilForKey:kZYListOldPrice fromDictionary:dict];
            self.clickWord = [self objectOrNilForKey:kZYListClickWord fromDictionary:dict];
            self.height = [self objectOrNilForKey:kZYListHeight fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kZYListSaleType fromDictionary:dict];
            self.marketPrice = [self objectOrNilForKey:kZYListMarketPrice fromDictionary:dict];
            self.wishes = [self objectOrNilForKey:kZYListWishes fromDictionary:dict];
            self.orders = [self objectOrNilForKey:kZYListOrders fromDictionary:dict];
            self.activityTxt = [self objectOrNilForKey:kZYListActivityTxt fromDictionary:dict];
            self.erpId = [self objectOrNilForKey:kZYListErpId fromDictionary:dict];
            self.shows = [ZYShows modelObjectWithDictionary:[dict objectForKey:kZYListShows]];
            self.tags = [self objectOrNilForKey:kZYListTags fromDictionary:dict];
            self.salesMonth = [self objectOrNilForKey:kZYListSalesMonth fromDictionary:dict];
            self.limitBuyMun = [self objectOrNilForKey:kZYListLimitBuyMun fromDictionary:dict];
            self.next = [[self objectOrNilForKey:kZYListNext fromDictionary:dict] boolValue];
            self.defaultImage = [self objectOrNilForKey:kZYListDefaultImage fromDictionary:dict];
            self.shape = [[self objectOrNilForKey:kZYListShape fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kZYListGoodsName fromDictionary:dict];
    NSObject *receivedZYSaleTypeMaps = [dict objectForKey:kZYListSaleTypeMaps];
    NSMutableArray *parsedZYSaleTypeMaps = [NSMutableArray array];
    if ([receivedZYSaleTypeMaps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZYSaleTypeMaps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZYSaleTypeMaps addObject:[ZYSaleTypeMaps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZYSaleTypeMaps isKindOfClass:[NSDictionary class]]) {
       [parsedZYSaleTypeMaps addObject:[ZYSaleTypeMaps modelObjectWithDictionary:(NSDictionary *)receivedZYSaleTypeMaps]];
    }

    self.saleTypeMaps = [NSArray arrayWithArray:parsedZYSaleTypeMaps];
            self.icon = [self objectOrNilForKey:kZYListIcon fromDictionary:dict];
            self.width = [self objectOrNilForKey:kZYListWidth fromDictionary:dict];
            self.brandName = [self objectOrNilForKey:kZYListBrandName fromDictionary:dict];
            self.iconKey = [self objectOrNilForKey:kZYListIconKey fromDictionary:dict];
            self.brandId = [self objectOrNilForKey:kZYListBrandId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.shares forKey:kZYListShares];
    [mutableDict setValue:self.isDisplayBar forKey:kZYListIsDisplayBar];
    [mutableDict setValue:self.titleDesc forKey:kZYListTitleDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsPeak] forKey:kZYListGoodsPeak];
    [mutableDict setValue:self.viewWishes forKey:kZYListViewWishes];
    [mutableDict setValue:self.ifSpecial forKey:kZYListIfSpecial];
    [mutableDict setValue:self.cateName forKey:kZYListCateName];
    [mutableDict setValue:self.goodsRank forKey:kZYListGoodsRank];
    [mutableDict setValue:self.sku forKey:kZYListSku];
    [mutableDict setValue:self.prefix forKey:kZYListPrefix];
    [mutableDict setValue:self.stock forKey:kZYListStock];
    [mutableDict setValue:self.shortGoodsName forKey:kZYListShortGoodsName];
    [mutableDict setValue:self.title forKey:kZYListTitle];
    [mutableDict setValue:self.activityId forKey:kZYListActivityId];
    [mutableDict setValue:self.top forKey:kZYListTop];
    [mutableDict setValue:self.activityKinds forKey:kZYListActivityKinds];
    [mutableDict setValue:self.listDescription forKey:kZYListDescription];
    [mutableDict setValue:self.flashStock forKey:kZYListFlashStock];
    [mutableDict setValue:self.type forKey:kZYListType];
    [mutableDict setValue:self.newPrice forKey:kZYListNewPrice];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZYListList];
    [mutableDict setValue:self.goodsImage forKey:kZYListGoodsImage];
    [mutableDict setValue:self.image forKey:kZYListImage];
    [mutableDict setValue:self.price forKey:kZYListPrice];
    [mutableDict setValue:self.coverImage forKey:kZYListCoverImage];
    [mutableDict setValue:self.views forKey:kZYListViews];
    [mutableDict setValue:self.txt forKey:kZYListTxt];
    [mutableDict setValue:self.sales forKey:kZYListSales];
    [mutableDict setValue:self.goodsId forKey:kZYListGoodsId];
    [mutableDict setValue:self.defaultThumb forKey:kZYListDefaultThumb];
    [mutableDict setValue:self.oldPrice forKey:kZYListOldPrice];
    [mutableDict setValue:self.clickWord forKey:kZYListClickWord];
    [mutableDict setValue:self.height forKey:kZYListHeight];
    [mutableDict setValue:self.saleType forKey:kZYListSaleType];
    [mutableDict setValue:self.marketPrice forKey:kZYListMarketPrice];
    [mutableDict setValue:self.wishes forKey:kZYListWishes];
    [mutableDict setValue:self.orders forKey:kZYListOrders];
    [mutableDict setValue:self.activityTxt forKey:kZYListActivityTxt];
    [mutableDict setValue:self.erpId forKey:kZYListErpId];
    [mutableDict setValue:[self.shows dictionaryRepresentation] forKey:kZYListShows];
    [mutableDict setValue:self.tags forKey:kZYListTags];
    [mutableDict setValue:self.salesMonth forKey:kZYListSalesMonth];
    [mutableDict setValue:self.limitBuyMun forKey:kZYListLimitBuyMun];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kZYListNext];
    [mutableDict setValue:self.defaultImage forKey:kZYListDefaultImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shape] forKey:kZYListShape];
    [mutableDict setValue:self.goodsName forKey:kZYListGoodsName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSaleTypeMaps] forKey:kZYListSaleTypeMaps];
    [mutableDict setValue:self.icon forKey:kZYListIcon];
    [mutableDict setValue:self.width forKey:kZYListWidth];
    [mutableDict setValue:self.brandName forKey:kZYListBrandName];
    [mutableDict setValue:self.iconKey forKey:kZYListIconKey];
    [mutableDict setValue:self.brandId forKey:kZYListBrandId];

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

    self.shares = [aDecoder decodeObjectForKey:kZYListShares];
    self.isDisplayBar = [aDecoder decodeObjectForKey:kZYListIsDisplayBar];
    self.titleDesc = [aDecoder decodeObjectForKey:kZYListTitleDesc];
    self.goodsPeak = [aDecoder decodeDoubleForKey:kZYListGoodsPeak];
    self.viewWishes = [aDecoder decodeObjectForKey:kZYListViewWishes];
    self.ifSpecial = [aDecoder decodeObjectForKey:kZYListIfSpecial];
    self.cateName = [aDecoder decodeObjectForKey:kZYListCateName];
    self.goodsRank = [aDecoder decodeObjectForKey:kZYListGoodsRank];
    self.sku = [aDecoder decodeObjectForKey:kZYListSku];
    self.prefix = [aDecoder decodeObjectForKey:kZYListPrefix];
    self.stock = [aDecoder decodeObjectForKey:kZYListStock];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kZYListShortGoodsName];
    self.title = [aDecoder decodeObjectForKey:kZYListTitle];
    self.activityId = [aDecoder decodeObjectForKey:kZYListActivityId];
    self.top = [aDecoder decodeObjectForKey:kZYListTop];
    self.activityKinds = [aDecoder decodeObjectForKey:kZYListActivityKinds];
    self.listDescription = [aDecoder decodeObjectForKey:kZYListDescription];
    self.flashStock = [aDecoder decodeObjectForKey:kZYListFlashStock];
    self.type = [aDecoder decodeObjectForKey:kZYListType];
    self.newPrice = [aDecoder decodeObjectForKey:kZYListNewPrice];
    self.list = [aDecoder decodeObjectForKey:kZYListList];
    self.goodsImage = [aDecoder decodeObjectForKey:kZYListGoodsImage];
    self.image = [aDecoder decodeObjectForKey:kZYListImage];
    self.price = [aDecoder decodeObjectForKey:kZYListPrice];
    self.coverImage = [aDecoder decodeObjectForKey:kZYListCoverImage];
    self.views = [aDecoder decodeObjectForKey:kZYListViews];
    self.txt = [aDecoder decodeObjectForKey:kZYListTxt];
    self.sales = [aDecoder decodeObjectForKey:kZYListSales];
    self.goodsId = [aDecoder decodeObjectForKey:kZYListGoodsId];
    self.defaultThumb = [aDecoder decodeObjectForKey:kZYListDefaultThumb];
    self.oldPrice = [aDecoder decodeObjectForKey:kZYListOldPrice];
    self.clickWord = [aDecoder decodeObjectForKey:kZYListClickWord];
    self.height = [aDecoder decodeObjectForKey:kZYListHeight];
    self.saleType = [aDecoder decodeObjectForKey:kZYListSaleType];
    self.marketPrice = [aDecoder decodeObjectForKey:kZYListMarketPrice];
    self.wishes = [aDecoder decodeObjectForKey:kZYListWishes];
    self.orders = [aDecoder decodeObjectForKey:kZYListOrders];
    self.activityTxt = [aDecoder decodeObjectForKey:kZYListActivityTxt];
    self.erpId = [aDecoder decodeObjectForKey:kZYListErpId];
    self.shows = [aDecoder decodeObjectForKey:kZYListShows];
    self.tags = [aDecoder decodeObjectForKey:kZYListTags];
    self.salesMonth = [aDecoder decodeObjectForKey:kZYListSalesMonth];
    self.limitBuyMun = [aDecoder decodeObjectForKey:kZYListLimitBuyMun];
    self.next = [aDecoder decodeBoolForKey:kZYListNext];
    self.defaultImage = [aDecoder decodeObjectForKey:kZYListDefaultImage];
    self.shape = [aDecoder decodeDoubleForKey:kZYListShape];
    self.goodsName = [aDecoder decodeObjectForKey:kZYListGoodsName];
    self.saleTypeMaps = [aDecoder decodeObjectForKey:kZYListSaleTypeMaps];
    self.icon = [aDecoder decodeObjectForKey:kZYListIcon];
    self.width = [aDecoder decodeObjectForKey:kZYListWidth];
    self.brandName = [aDecoder decodeObjectForKey:kZYListBrandName];
    self.iconKey = [aDecoder decodeObjectForKey:kZYListIconKey];
    self.brandId = [aDecoder decodeObjectForKey:kZYListBrandId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_shares forKey:kZYListShares];
    [aCoder encodeObject:_isDisplayBar forKey:kZYListIsDisplayBar];
    [aCoder encodeObject:_titleDesc forKey:kZYListTitleDesc];
    [aCoder encodeDouble:_goodsPeak forKey:kZYListGoodsPeak];
    [aCoder encodeObject:_viewWishes forKey:kZYListViewWishes];
    [aCoder encodeObject:_ifSpecial forKey:kZYListIfSpecial];
    [aCoder encodeObject:_cateName forKey:kZYListCateName];
    [aCoder encodeObject:_goodsRank forKey:kZYListGoodsRank];
    [aCoder encodeObject:_sku forKey:kZYListSku];
    [aCoder encodeObject:_prefix forKey:kZYListPrefix];
    [aCoder encodeObject:_stock forKey:kZYListStock];
    [aCoder encodeObject:_shortGoodsName forKey:kZYListShortGoodsName];
    [aCoder encodeObject:_title forKey:kZYListTitle];
    [aCoder encodeObject:_activityId forKey:kZYListActivityId];
    [aCoder encodeObject:_top forKey:kZYListTop];
    [aCoder encodeObject:_activityKinds forKey:kZYListActivityKinds];
    [aCoder encodeObject:_listDescription forKey:kZYListDescription];
    [aCoder encodeObject:_flashStock forKey:kZYListFlashStock];
    [aCoder encodeObject:_type forKey:kZYListType];
    [aCoder encodeObject:_newPrice forKey:kZYListNewPrice];
    [aCoder encodeObject:_list forKey:kZYListList];
    [aCoder encodeObject:_goodsImage forKey:kZYListGoodsImage];
    [aCoder encodeObject:_image forKey:kZYListImage];
    [aCoder encodeObject:_price forKey:kZYListPrice];
    [aCoder encodeObject:_coverImage forKey:kZYListCoverImage];
    [aCoder encodeObject:_views forKey:kZYListViews];
    [aCoder encodeObject:_txt forKey:kZYListTxt];
    [aCoder encodeObject:_sales forKey:kZYListSales];
    [aCoder encodeObject:_goodsId forKey:kZYListGoodsId];
    [aCoder encodeObject:_defaultThumb forKey:kZYListDefaultThumb];
    [aCoder encodeObject:_oldPrice forKey:kZYListOldPrice];
    [aCoder encodeObject:_clickWord forKey:kZYListClickWord];
    [aCoder encodeObject:_height forKey:kZYListHeight];
    [aCoder encodeObject:_saleType forKey:kZYListSaleType];
    [aCoder encodeObject:_marketPrice forKey:kZYListMarketPrice];
    [aCoder encodeObject:_wishes forKey:kZYListWishes];
    [aCoder encodeObject:_orders forKey:kZYListOrders];
    [aCoder encodeObject:_activityTxt forKey:kZYListActivityTxt];
    [aCoder encodeObject:_erpId forKey:kZYListErpId];
    [aCoder encodeObject:_shows forKey:kZYListShows];
    [aCoder encodeObject:_tags forKey:kZYListTags];
    [aCoder encodeObject:_salesMonth forKey:kZYListSalesMonth];
    [aCoder encodeObject:_limitBuyMun forKey:kZYListLimitBuyMun];
    [aCoder encodeBool:_next forKey:kZYListNext];
    [aCoder encodeObject:_defaultImage forKey:kZYListDefaultImage];
    [aCoder encodeDouble:_shape forKey:kZYListShape];
    [aCoder encodeObject:_goodsName forKey:kZYListGoodsName];
    [aCoder encodeObject:_saleTypeMaps forKey:kZYListSaleTypeMaps];
    [aCoder encodeObject:_icon forKey:kZYListIcon];
    [aCoder encodeObject:_width forKey:kZYListWidth];
    [aCoder encodeObject:_brandName forKey:kZYListBrandName];
    [aCoder encodeObject:_iconKey forKey:kZYListIconKey];
    [aCoder encodeObject:_brandId forKey:kZYListBrandId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYList *copy = [[ZYList alloc] init];
    
    if (copy) {

        copy.shares = [self.shares copyWithZone:zone];
        copy.isDisplayBar = [self.isDisplayBar copyWithZone:zone];
        copy.titleDesc = [self.titleDesc copyWithZone:zone];
        copy.goodsPeak = self.goodsPeak;
        copy.viewWishes = [self.viewWishes copyWithZone:zone];
        copy.ifSpecial = [self.ifSpecial copyWithZone:zone];
        copy.cateName = [self.cateName copyWithZone:zone];
        copy.goodsRank = [self.goodsRank copyWithZone:zone];
        copy.sku = [self.sku copyWithZone:zone];
        copy.prefix = [self.prefix copyWithZone:zone];
        copy.stock = [self.stock copyWithZone:zone];
        copy.shortGoodsName = [self.shortGoodsName copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.activityId = [self.activityId copyWithZone:zone];
        copy.top = [self.top copyWithZone:zone];
        copy.activityKinds = [self.activityKinds copyWithZone:zone];
        copy.listDescription = [self.listDescription copyWithZone:zone];
        copy.flashStock = [self.flashStock copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.newPrice = [self.newPrice copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.goodsImage = [self.goodsImage copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.coverImage = [self.coverImage copyWithZone:zone];
        copy.views = [self.views copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.sales = [self.sales copyWithZone:zone];
        copy.goodsId = [self.goodsId copyWithZone:zone];
        copy.defaultThumb = [self.defaultThumb copyWithZone:zone];
        copy.oldPrice = [self.oldPrice copyWithZone:zone];
        copy.clickWord = [self.clickWord copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.saleType = [self.saleType copyWithZone:zone];
        copy.marketPrice = [self.marketPrice copyWithZone:zone];
        copy.wishes = [self.wishes copyWithZone:zone];
        copy.orders = [self.orders copyWithZone:zone];
        copy.activityTxt = [self.activityTxt copyWithZone:zone];
        copy.erpId = [self.erpId copyWithZone:zone];
        copy.shows = [self.shows copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.salesMonth = [self.salesMonth copyWithZone:zone];
        copy.limitBuyMun = [self.limitBuyMun copyWithZone:zone];
        copy.next = self.next;
        copy.defaultImage = [self.defaultImage copyWithZone:zone];
        copy.shape = self.shape;
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.saleTypeMaps = [self.saleTypeMaps copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.brandName = [self.brandName copyWithZone:zone];
        copy.iconKey = [self.iconKey copyWithZone:zone];
        copy.brandId = [self.brandId copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_shares release];
    [_isDisplayBar release];
    [_titleDesc release];
    [_viewWishes release];
    [_ifSpecial release];
    [_cateName release];
    [_goodsRank release];
    [_sku release];
    [_prefix release];
    [_stock release];
    [_shortGoodsName release];
    [_title release];
    [_activityId release];
    [_top release];
    [_activityKinds release];
    [_listDescription release];
    [_flashStock release];
    [_type release];
    [_newPrice release];
    [_list release];
    [_goodsImage release];
    [_image release];
    [_price release];
    [_coverImage release];
    [_views release];
    [_txt release];
    [_sales release];
    [_goodsId release];
    [_defaultThumb release];
    [_oldPrice release];
    [_clickWord release];
    [_height release];
    [_saleType release];
    [_marketPrice release];
    [_wishes release];
    [_orders release];
    [_activityTxt release];
    [_erpId release];
    [_shows release];
    [_tags release];
    [_salesMonth release];
    [_limitBuyMun release];
    [_defaultImage release];
    [_goodsName release];
    [_saleTypeMaps release];
    [_icon release];
    [_width release];
    [_brandName release];
    [_iconKey release];
    [_brandId release];
    [super dealloc];
}

@end
