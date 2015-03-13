//
//  QQSaleTypeMaps.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QQSaleTypeMaps.h"
#import "QQBig.h"
#import "QQSmall.h"


NSString *const kQQSaleTypeMapsTitle = @"title";
NSString *const kQQSaleTypeMapsKey = @"key";
NSString *const kQQSaleTypeMapsBig = @"big";
NSString *const kQQSaleTypeMapsSmall = @"small";
NSString *const kQQSaleTypeMapsMark = @"mark";


@interface QQSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QQSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kQQSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kQQSaleTypeMapsKey fromDictionary:dict];
            self.big = [QQBig modelObjectWithDictionary:[dict objectForKey:kQQSaleTypeMapsBig]];
            self.small = [QQSmall modelObjectWithDictionary:[dict objectForKey:kQQSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kQQSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kQQSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kQQSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kQQSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kQQSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kQQSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kQQSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kQQSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kQQSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kQQSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kQQSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kQQSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kQQSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kQQSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kQQSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kQQSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    QQSaleTypeMaps *copy = [[QQSaleTypeMaps alloc] init];
    
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
