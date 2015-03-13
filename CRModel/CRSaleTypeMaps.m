//
//  CRSaleTypeMaps.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CRSaleTypeMaps.h"
#import "CRBig.h"
#import "CRSmall.h"


NSString *const kCRSaleTypeMapsTitle = @"title";
NSString *const kCRSaleTypeMapsKey = @"key";
NSString *const kCRSaleTypeMapsBig = @"big";
NSString *const kCRSaleTypeMapsSmall = @"small";
NSString *const kCRSaleTypeMapsMark = @"mark";


@interface CRSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CRSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kCRSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kCRSaleTypeMapsKey fromDictionary:dict];
            self.big = [CRBig modelObjectWithDictionary:[dict objectForKey:kCRSaleTypeMapsBig]];
            self.small = [CRSmall modelObjectWithDictionary:[dict objectForKey:kCRSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kCRSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kCRSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kCRSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kCRSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kCRSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kCRSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kCRSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kCRSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kCRSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kCRSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kCRSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kCRSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kCRSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kCRSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kCRSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kCRSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    CRSaleTypeMaps *copy = [[CRSaleTypeMaps alloc] init];
    
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
