//
//  DTMoreProperty.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTMoreProperty.h"


NSString *const kDTMorePropertyKey = @"key";
NSString *const kDTMorePropertyValue = @"value";


@interface DTMoreProperty ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTMoreProperty

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
            self.key = [self objectOrNilForKey:kDTMorePropertyKey fromDictionary:dict];
            self.value = [self objectOrNilForKey:kDTMorePropertyValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kDTMorePropertyKey];
    [mutableDict setValue:self.value forKey:kDTMorePropertyValue];

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

    self.key = [aDecoder decodeObjectForKey:kDTMorePropertyKey];
    self.value = [aDecoder decodeObjectForKey:kDTMorePropertyValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kDTMorePropertyKey];
    [aCoder encodeObject:_value forKey:kDTMorePropertyValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTMoreProperty *copy = [[DTMoreProperty alloc] init];
    
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
