//
//  ZYSaleTypeMaps.m
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYSaleTypeMaps.h"
#import "ZYBig.h"
#import "ZYSmall.h"


NSString *const kZYSaleTypeMapsTitle = @"title";
NSString *const kZYSaleTypeMapsKey = @"key";
NSString *const kZYSaleTypeMapsBig = @"big";
NSString *const kZYSaleTypeMapsSmall = @"small";
NSString *const kZYSaleTypeMapsMark = @"mark";


@interface ZYSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kZYSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kZYSaleTypeMapsKey fromDictionary:dict];
            self.big = [ZYBig modelObjectWithDictionary:[dict objectForKey:kZYSaleTypeMapsBig]];
            self.small = [ZYSmall modelObjectWithDictionary:[dict objectForKey:kZYSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kZYSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kZYSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kZYSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kZYSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kZYSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kZYSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kZYSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kZYSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kZYSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kZYSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kZYSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kZYSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kZYSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kZYSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kZYSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kZYSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYSaleTypeMaps *copy = [[ZYSaleTypeMaps alloc] init];
    
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
