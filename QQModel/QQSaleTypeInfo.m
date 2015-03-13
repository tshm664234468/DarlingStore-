//
//  QQSaleTypeInfo.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QQSaleTypeInfo.h"
#import "QQBig.h"
#import "QQSmall.h"


NSString *const kQQSaleTypeInfoTitle = @"title";
NSString *const kQQSaleTypeInfoKey = @"key";
NSString *const kQQSaleTypeInfoBig = @"big";
NSString *const kQQSaleTypeInfoSmall = @"small";
NSString *const kQQSaleTypeInfoMark = @"mark";


@interface QQSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QQSaleTypeInfo

@synthesize title = _title;
@synthesize key = _key;
@synthesize big = _big;
@synthesize small = _small;
@synthesize mark = _mark;


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
            self.title = [self objectOrNilForKey:kQQSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kQQSaleTypeInfoKey fromDictionary:dict];
            self.big = [QQBig modelObjectWithDictionary:[dict objectForKey:kQQSaleTypeInfoBig]];
            self.small = [QQSmall modelObjectWithDictionary:[dict objectForKey:kQQSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kQQSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kQQSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kQQSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kQQSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kQQSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kQQSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kQQSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kQQSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kQQSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kQQSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kQQSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kQQSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kQQSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kQQSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kQQSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kQQSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    QQSaleTypeInfo *copy = [[QQSaleTypeInfo alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.key = [self.key copyWithZone:zone];
        copy.big = [self.big copyWithZone:zone];
        copy.small = [self.small copyWithZone:zone];
        copy.mark = self.mark;
    }
    
    return copy;
}


- (void)dealloc
{
    [_title release];
    [_key release];
    [_big release];
    [_small release];
    [super dealloc];
}

@end
