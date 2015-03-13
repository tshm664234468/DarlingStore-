//
//  DTMoreSale.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTMoreSale.h"


NSString *const kDTMoreSaleKey = @"key";
NSString *const kDTMoreSaleValue = @"value";


@interface DTMoreSale ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTMoreSale

@synthesize key = _key;
@synthesize value = _value;


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
            self.key = [self objectOrNilForKey:kDTMoreSaleKey fromDictionary:dict];
            self.value = [self objectOrNilForKey:kDTMoreSaleValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kDTMoreSaleKey];
    [mutableDict setValue:self.value forKey:kDTMoreSaleValue];

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

    self.key = [aDecoder decodeObjectForKey:kDTMoreSaleKey];
    self.value = [aDecoder decodeObjectForKey:kDTMoreSaleValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kDTMoreSaleKey];
    [aCoder encodeObject:_value forKey:kDTMoreSaleValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTMoreSale *copy = [[DTMoreSale alloc] init];
    
    if (copy) {

        copy.key = [self.key copyWithZone:zone];
        copy.value = [self.value copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_key release];
    [_value release];
    [super dealloc];
}

@end
