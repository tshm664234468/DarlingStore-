//
//  SortExtra.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SortExtra.h"


NSString *const kSortExtraId = @"id";
NSString *const kSortExtraTags = @"tags";
NSString *const kSortExtraKey = @"key";
NSString *const kSortExtraBrandId = @"brand_id";
NSString *const kSortExtraSaleType = @"sale_type";


@interface SortExtra ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SortExtra

@synthesize extraIdentifier = _extraIdentifier;
@synthesize tags = _tags;
@synthesize key = _key;
@synthesize brandId = _brandId;
@synthesize saleType = _saleType;


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
            self.extraIdentifier = [self objectOrNilForKey:kSortExtraId fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kSortExtraTags fromDictionary:dict];
            self.key = [self objectOrNilForKey:kSortExtraKey fromDictionary:dict];
            self.brandId = [self objectOrNilForKey:kSortExtraBrandId fromDictionary:dict];
            self.saleType = [self objectOrNilForKey:kSortExtraSaleType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.extraIdentifier forKey:kSortExtraId];
    [mutableDict setValue:self.tags forKey:kSortExtraTags];
    [mutableDict setValue:self.key forKey:kSortExtraKey];
    [mutableDict setValue:self.brandId forKey:kSortExtraBrandId];
    [mutableDict setValue:self.saleType forKey:kSortExtraSaleType];

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

    self.extraIdentifier = [aDecoder decodeObjectForKey:kSortExtraId];
    self.tags = [aDecoder decodeObjectForKey:kSortExtraTags];
    self.key = [aDecoder decodeObjectForKey:kSortExtraKey];
    self.brandId = [aDecoder decodeObjectForKey:kSortExtraBrandId];
    self.saleType = [aDecoder decodeObjectForKey:kSortExtraSaleType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_extraIdentifier forKey:kSortExtraId];
    [aCoder encodeObject:_tags forKey:kSortExtraTags];
    [aCoder encodeObject:_key forKey:kSortExtraKey];
    [aCoder encodeObject:_brandId forKey:kSortExtraBrandId];
    [aCoder encodeObject:_saleType forKey:kSortExtraSaleType];
}

- (id)copyWithZone:(NSZone *)zone
{
    SortExtra *copy = [[SortExtra alloc] init];
    
    if (copy) {

        copy.extraIdentifier = [self.extraIdentifier copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.key = [self.key copyWithZone:zone];
        copy.brandId = [self.brandId copyWithZone:zone];
        copy.saleType = [self.saleType copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_extraIdentifier release];
    [_tags release];
    [_key release];
    [_brandId release];
    [_saleType release];
    [super dealloc];
}

@end
