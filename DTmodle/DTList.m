//
//  DTList.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTList.h"


NSString *const kDTListCoverImage = @"cover_image";
NSString *const kDTListShortGoodsName = @"short_goods_name";
NSString *const kDTListKey = @"key";
NSString *const kDTListDefaultImage = @"default_image";
NSString *const kDTListIfSpecial = @"if_special";
NSString *const kDTListTitle = @"title";
NSString *const kDTListImage = @"image";
NSString *const kDTListGoodsName = @"goods_name";
NSString *const kDTListCommentsTime = @"comments_time";
NSString *const kDTListImages = @"images";
NSString *const kDTListReplyList = @"reply_list";
NSString *const kDTListGradeDesc = @"grade_desc";
NSString *const kDTListGrade = @"grade";
NSString *const kDTListPrefix = @"prefix";
NSString *const kDTListHeight = @"height";
NSString *const kDTListWidth = @"width";
NSString *const kDTListDefaultThumb = @"default_thumb";
NSString *const kDTListValue = @"value";
NSString *const kDTListGoodsId = @"goods_id";
NSString *const kDTListNickName = @"nick_name";
NSString *const kDTListPrice = @"price";
NSString *const kDTListAvator = @"avator";
NSString *const kDTListContent = @"content";
NSString *const kDTListImageUrl = @"image_url";


@interface DTList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTList

@synthesize coverImage = _coverImage;
@synthesize shortGoodsName = _shortGoodsName;
@synthesize key = _key;
@synthesize defaultImage = _defaultImage;
@synthesize ifSpecial = _ifSpecial;
@synthesize title = _title;
@synthesize image = _image;
@synthesize goodsName = _goodsName;
@synthesize commentsTime = _commentsTime;
@synthesize images = _images;
@synthesize replyList = _replyList;
@synthesize gradeDesc = _gradeDesc;
@synthesize grade = _grade;
@synthesize prefix = _prefix;
@synthesize height = _height;
@synthesize width = _width;
@synthesize defaultThumb = _defaultThumb;
@synthesize value = _value;
@synthesize goodsId = _goodsId;
@synthesize nickName = _nickName;
@synthesize price = _price;
@synthesize avator = _avator;
@synthesize content = _content;
@synthesize imageUrl = _imageUrl;


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
            self.coverImage = [self objectOrNilForKey:kDTListCoverImage fromDictionary:dict];
            self.shortGoodsName = [self objectOrNilForKey:kDTListShortGoodsName fromDictionary:dict];
            self.key = [self objectOrNilForKey:kDTListKey fromDictionary:dict];
            self.defaultImage = [self objectOrNilForKey:kDTListDefaultImage fromDictionary:dict];
            self.ifSpecial = [self objectOrNilForKey:kDTListIfSpecial fromDictionary:dict];
            self.title = [self objectOrNilForKey:kDTListTitle fromDictionary:dict];
            self.image = [self objectOrNilForKey:kDTListImage fromDictionary:dict];
            self.goodsName = [self objectOrNilForKey:kDTListGoodsName fromDictionary:dict];
            self.commentsTime = [self objectOrNilForKey:kDTListCommentsTime fromDictionary:dict];
            self.images = [self objectOrNilForKey:kDTListImages fromDictionary:dict];
            self.replyList = [self objectOrNilForKey:kDTListReplyList fromDictionary:dict];
            self.gradeDesc = [self objectOrNilForKey:kDTListGradeDesc fromDictionary:dict];
            self.grade = [self objectOrNilForKey:kDTListGrade fromDictionary:dict];
            self.prefix = [self objectOrNilForKey:kDTListPrefix fromDictionary:dict];
            self.height = [self objectOrNilForKey:kDTListHeight fromDictionary:dict];
            self.width = [self objectOrNilForKey:kDTListWidth fromDictionary:dict];
            self.defaultThumb = [self objectOrNilForKey:kDTListDefaultThumb fromDictionary:dict];
            self.value = [self objectOrNilForKey:kDTListValue fromDictionary:dict];
            self.goodsId = [self objectOrNilForKey:kDTListGoodsId fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kDTListNickName fromDictionary:dict];
            self.price = [self objectOrNilForKey:kDTListPrice fromDictionary:dict];
            self.avator = [self objectOrNilForKey:kDTListAvator fromDictionary:dict];
            self.content = [self objectOrNilForKey:kDTListContent fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kDTListImageUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.coverImage forKey:kDTListCoverImage];
    [mutableDict setValue:self.shortGoodsName forKey:kDTListShortGoodsName];
    [mutableDict setValue:self.key forKey:kDTListKey];
    [mutableDict setValue:self.defaultImage forKey:kDTListDefaultImage];
    [mutableDict setValue:self.ifSpecial forKey:kDTListIfSpecial];
    [mutableDict setValue:self.title forKey:kDTListTitle];
    [mutableDict setValue:self.image forKey:kDTListImage];
    [mutableDict setValue:self.goodsName forKey:kDTListGoodsName];
    [mutableDict setValue:self.commentsTime forKey:kDTListCommentsTime];
    [mutableDict setValue:self.images forKey:kDTListImages];
    NSMutableArray *tempArrayForReplyList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.replyList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReplyList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReplyList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReplyList] forKey:kDTListReplyList];
    [mutableDict setValue:self.gradeDesc forKey:kDTListGradeDesc];
    [mutableDict setValue:self.grade forKey:kDTListGrade];
    [mutableDict setValue:self.prefix forKey:kDTListPrefix];
    [mutableDict setValue:self.height forKey:kDTListHeight];
    [mutableDict setValue:self.width forKey:kDTListWidth];
    [mutableDict setValue:self.defaultThumb forKey:kDTListDefaultThumb];
    [mutableDict setValue:self.value forKey:kDTListValue];
    [mutableDict setValue:self.goodsId forKey:kDTListGoodsId];
    [mutableDict setValue:self.nickName forKey:kDTListNickName];
    [mutableDict setValue:self.price forKey:kDTListPrice];
    [mutableDict setValue:self.avator forKey:kDTListAvator];
    [mutableDict setValue:self.content forKey:kDTListContent];
    [mutableDict setValue:self.imageUrl forKey:kDTListImageUrl];

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

    self.coverImage = [aDecoder decodeObjectForKey:kDTListCoverImage];
    self.shortGoodsName = [aDecoder decodeObjectForKey:kDTListShortGoodsName];
    self.key = [aDecoder decodeObjectForKey:kDTListKey];
    self.defaultImage = [aDecoder decodeObjectForKey:kDTListDefaultImage];
    self.ifSpecial = [aDecoder decodeObjectForKey:kDTListIfSpecial];
    self.title = [aDecoder decodeObjectForKey:kDTListTitle];
    self.image = [aDecoder decodeObjectForKey:kDTListImage];
    self.goodsName = [aDecoder decodeObjectForKey:kDTListGoodsName];
    self.commentsTime = [aDecoder decodeObjectForKey:kDTListCommentsTime];
    self.images = [aDecoder decodeObjectForKey:kDTListImages];
    self.replyList = [aDecoder decodeObjectForKey:kDTListReplyList];
    self.gradeDesc = [aDecoder decodeObjectForKey:kDTListGradeDesc];
    self.grade = [aDecoder decodeObjectForKey:kDTListGrade];
    self.prefix = [aDecoder decodeObjectForKey:kDTListPrefix];
    self.height = [aDecoder decodeObjectForKey:kDTListHeight];
    self.width = [aDecoder decodeObjectForKey:kDTListWidth];
    self.defaultThumb = [aDecoder decodeObjectForKey:kDTListDefaultThumb];
    self.value = [aDecoder decodeObjectForKey:kDTListValue];
    self.goodsId = [aDecoder decodeObjectForKey:kDTListGoodsId];
    self.nickName = [aDecoder decodeObjectForKey:kDTListNickName];
    self.price = [aDecoder decodeObjectForKey:kDTListPrice];
    self.avator = [aDecoder decodeObjectForKey:kDTListAvator];
    self.content = [aDecoder decodeObjectForKey:kDTListContent];
    self.imageUrl = [aDecoder decodeObjectForKey:kDTListImageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_coverImage forKey:kDTListCoverImage];
    [aCoder encodeObject:_shortGoodsName forKey:kDTListShortGoodsName];
    [aCoder encodeObject:_key forKey:kDTListKey];
    [aCoder encodeObject:_defaultImage forKey:kDTListDefaultImage];
    [aCoder encodeObject:_ifSpecial forKey:kDTListIfSpecial];
    [aCoder encodeObject:_title forKey:kDTListTitle];
    [aCoder encodeObject:_image forKey:kDTListImage];
    [aCoder encodeObject:_goodsName forKey:kDTListGoodsName];
    [aCoder encodeObject:_commentsTime forKey:kDTListCommentsTime];
    [aCoder encodeObject:_images forKey:kDTListImages];
    [aCoder encodeObject:_replyList forKey:kDTListReplyList];
    [aCoder encodeObject:_gradeDesc forKey:kDTListGradeDesc];
    [aCoder encodeObject:_grade forKey:kDTListGrade];
    [aCoder encodeObject:_prefix forKey:kDTListPrefix];
    [aCoder encodeObject:_height forKey:kDTListHeight];
    [aCoder encodeObject:_width forKey:kDTListWidth];
    [aCoder encodeObject:_defaultThumb forKey:kDTListDefaultThumb];
    [aCoder encodeObject:_value forKey:kDTListValue];
    [aCoder encodeObject:_goodsId forKey:kDTListGoodsId];
    [aCoder encodeObject:_nickName forKey:kDTListNickName];
    [aCoder encodeObject:_price forKey:kDTListPrice];
    [aCoder encodeObject:_avator forKey:kDTListAvator];
    [aCoder encodeObject:_content forKey:kDTListContent];
    [aCoder encodeObject:_imageUrl forKey:kDTListImageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTList *copy = [[DTList alloc] init];
    
    if (copy) {

        copy.coverImage = [self.coverImage copyWithZone:zone];
        copy.shortGoodsName = [self.shortGoodsName copyWithZone:zone];
        copy.key = [self.key copyWithZone:zone];
        copy.defaultImage = [self.defaultImage copyWithZone:zone];
        copy.ifSpecial = [self.ifSpecial copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.commentsTime = [self.commentsTime copyWithZone:zone];
        copy.images = [self.images copyWithZone:zone];
        copy.replyList = [self.replyList copyWithZone:zone];
        copy.gradeDesc = [self.gradeDesc copyWithZone:zone];
        copy.grade = [self.grade copyWithZone:zone];
        copy.prefix = [self.prefix copyWithZone:zone];
        copy.height = [self.height copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.defaultThumb = [self.defaultThumb copyWithZone:zone];
        copy.value = [self.value copyWithZone:zone];
        copy.goodsId = [self.goodsId copyWithZone:zone];
        copy.nickName = [self.nickName copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.avator = [self.avator copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_coverImage release];
    [_shortGoodsName release];
    [_key release];
    [_defaultImage release];
    [_ifSpecial release];
    [_title release];
    [_image release];
    [_goodsName release];
    [_commentsTime release];
    [_images release];
    [_replyList release];
    [_gradeDesc release];
    [_grade release];
    [_prefix release];
    [_height release];
    [_width release];
    [_defaultThumb release];
    [_value release];
    [_goodsId release];
    [_nickName release];
    [_price release];
    [_avator release];
    [_content release];
    [_imageUrl release];
    [super dealloc];
}

@end
