//
//  GXSaleTypeMaps.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GXSaleTypeMaps.h"
#import "GXBig.h"
#import "GXSmall.h"


NSString *const kGXSaleTypeMapsTitle = @"title";
NSString *const kGXSaleTypeMapsKey = @"key";
NSString *const kGXSaleTypeMapsBig = @"big";
NSString *const kGXSaleTypeMapsSmall = @"small";
NSString *const kGXSaleTypeMapsMark = @"mark";


@interface GXSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GXSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kGXSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kGXSaleTypeMapsKey fromDictionary:dict];
            self.big = [GXBig modelObjectWithDictionary:[dict objectForKey:kGXSaleTypeMapsBig]];
            self.small = [GXSmall modelObjectWithDictionary:[dict objectForKey:kGXSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kGXSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kGXSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kGXSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kGXSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kGXSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kGXSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kGXSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kGXSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kGXSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kGXSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kGXSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kGXSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kGXSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kGXSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kGXSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kGXSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    GXSaleTypeMaps *copy = [[GXSaleTypeMaps alloc] init];
    
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
