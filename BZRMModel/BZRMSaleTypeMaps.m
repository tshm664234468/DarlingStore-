//
//  BZRMSaleTypeMaps.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRMSaleTypeMaps.h"
#import "BZRMBig.h"
#import "BZRMSmall.h"


NSString *const kBZRMSaleTypeMapsTitle = @"title";
NSString *const kBZRMSaleTypeMapsKey = @"key";
NSString *const kBZRMSaleTypeMapsBig = @"big";
NSString *const kBZRMSaleTypeMapsSmall = @"small";
NSString *const kBZRMSaleTypeMapsMark = @"mark";


@interface BZRMSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRMSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kBZRMSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kBZRMSaleTypeMapsKey fromDictionary:dict];
            self.big = [BZRMBig modelObjectWithDictionary:[dict objectForKey:kBZRMSaleTypeMapsBig]];
            self.small = [BZRMSmall modelObjectWithDictionary:[dict objectForKey:kBZRMSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kBZRMSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kBZRMSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kBZRMSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kBZRMSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kBZRMSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kBZRMSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kBZRMSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kBZRMSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kBZRMSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kBZRMSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kBZRMSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kBZRMSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kBZRMSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kBZRMSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kBZRMSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kBZRMSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRMSaleTypeMaps *copy = [[BZRMSaleTypeMaps alloc] init];
    
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
