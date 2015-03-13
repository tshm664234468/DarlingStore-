//
//  CYSaleTypeMaps.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CYSaleTypeMaps.h"
#import "CYBig.h"
#import "CYSmall.h"


NSString *const kCYSaleTypeMapsTitle = @"title";
NSString *const kCYSaleTypeMapsKey = @"key";
NSString *const kCYSaleTypeMapsBig = @"big";
NSString *const kCYSaleTypeMapsSmall = @"small";
NSString *const kCYSaleTypeMapsMark = @"mark";


@interface CYSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CYSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kCYSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kCYSaleTypeMapsKey fromDictionary:dict];
            self.big = [CYBig modelObjectWithDictionary:[dict objectForKey:kCYSaleTypeMapsBig]];
            self.small = [CYSmall modelObjectWithDictionary:[dict objectForKey:kCYSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kCYSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kCYSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kCYSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kCYSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kCYSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kCYSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kCYSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kCYSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kCYSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kCYSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kCYSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kCYSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kCYSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kCYSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kCYSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kCYSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    CYSaleTypeMaps *copy = [[CYSaleTypeMaps alloc] init];
    
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
