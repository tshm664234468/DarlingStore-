//
//  DTPromise.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTPromise.h"


NSString *const kDTPromiseKey = @"key";
NSString *const kDTPromiseValue = @"value";


@interface DTPromise ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTPromise

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
            self.key = [self objectOrNilForKey:kDTPromiseKey fromDictionary:dict];
            self.value = [self objectOrNilForKey:kDTPromiseValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kDTPromiseKey];
    [mutableDict setValue:self.value forKey:kDTPromiseValue];

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

    self.key = [aDecoder decodeObjectForKey:kDTPromiseKey];
    self.value = [aDecoder decodeObjectForKey:kDTPromiseValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kDTPromiseKey];
    [aCoder encodeObject:_value forKey:kDTPromiseValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTPromise *copy = [[DTPromise alloc] init];
    
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
