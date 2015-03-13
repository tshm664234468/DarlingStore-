//
//  BZRPSaleTypeMaps.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRPSaleTypeMaps.h"
#import "BZRPBig.h"
#import "BZRPSmall.h"


NSString *const kBZRPSaleTypeMapsTitle = @"title";
NSString *const kBZRPSaleTypeMapsKey = @"key";
NSString *const kBZRPSaleTypeMapsBig = @"big";
NSString *const kBZRPSaleTypeMapsSmall = @"small";
NSString *const kBZRPSaleTypeMapsMark = @"mark";


@interface BZRPSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRPSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kBZRPSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kBZRPSaleTypeMapsKey fromDictionary:dict];
            self.big = [BZRPBig modelObjectWithDictionary:[dict objectForKey:kBZRPSaleTypeMapsBig]];
            self.small = [BZRPSmall modelObjectWithDictionary:[dict objectForKey:kBZRPSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kBZRPSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kBZRPSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kBZRPSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kBZRPSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kBZRPSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kBZRPSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kBZRPSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kBZRPSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kBZRPSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kBZRPSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kBZRPSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kBZRPSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kBZRPSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kBZRPSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kBZRPSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kBZRPSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRPSaleTypeMaps *copy = [[BZRPSaleTypeMaps alloc] init];
    
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
