//
//  DTBrands.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTBrands.h"
#import "DTList.h"


NSString *const kDTBrandsValue = @"value";
NSString *const kDTBrandsKey = @"key";
NSString *const kDTBrandsImageUrl = @"image_url";
NSString *const kDTBrandsList = @"list";


@interface DTBrands ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTBrands

@synthesize value = _value;
@synthesize key = _key;
@synthesize imageUrl = _imageUrl;
@synthesize list = _list;


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
            self.value = [self objectOrNilForKey:kDTBrandsValue fromDictionary:dict];
            self.key = [self objectOrNilForKey:kDTBrandsKey fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kDTBrandsImageUrl fromDictionary:dict];
    NSObject *receivedDTList = [dict objectForKey:kDTBrandsList];
    NSMutableArray *parsedDTList = [NSMutableArray array];
    if ([receivedDTList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDTList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDTList addObject:[DTList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDTList isKindOfClass:[NSDictionary class]]) {
       [parsedDTList addObject:[DTList modelObjectWithDictionary:(NSDictionary *)receivedDTList]];
    }

    self.list = [NSArray arrayWithArray:parsedDTList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.value forKey:kDTBrandsValue];
    [mutableDict setValue:self.key forKey:kDTBrandsKey];
    [mutableDict setValue:self.imageUrl forKey:kDTBrandsImageUrl];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDTBrandsList];

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

    self.value = [aDecoder decodeObjectForKey:kDTBrandsValue];
    self.key = [aDecoder decodeObjectForKey:kDTBrandsKey];
    self.imageUrl = [aDecoder decodeObjectForKey:kDTBrandsImageUrl];
    self.list = [aDecoder decodeObjectForKey:kDTBrandsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_value forKey:kDTBrandsValue];
    [aCoder encodeObject:_key forKey:kDTBrandsKey];
    [aCoder encodeObject:_imageUrl forKey:kDTBrandsImageUrl];
    [aCoder encodeObject:_list forKey:kDTBrandsList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTBrands *copy = [[DTBrands alloc] init];
    
    if (copy) {

        copy.value = [self.value copyWithZone:zone];
        copy.key = [self.key copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_value release];
    [_key release];
    [_imageUrl release];
    [_list release];
    [super dealloc];
}

@end
