//
//  DTBrand.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTBrand.h"
#import "DTList.h"


NSString *const kDTBrandKey = @"key";
NSString *const kDTBrandList = @"list";
NSString *const kDTBrandName = @"name";
NSString *const kDTBrandAccreditLogo = @"accredit_logo";


@interface DTBrand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTBrand

@synthesize key = _key;
@synthesize list = _list;
@synthesize name = _name;
@synthesize accreditLogo = _accreditLogo;


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
            self.key = [self objectOrNilForKey:kDTBrandKey fromDictionary:dict];
    NSObject *receivedDTList = [dict objectForKey:kDTBrandList];
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
            self.name = [self objectOrNilForKey:kDTBrandName fromDictionary:dict];
            self.accreditLogo = [self objectOrNilForKey:kDTBrandAccreditLogo fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kDTBrandKey];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDTBrandList];
    [mutableDict setValue:self.name forKey:kDTBrandName];
    [mutableDict setValue:self.accreditLogo forKey:kDTBrandAccreditLogo];

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

    self.key = [aDecoder decodeObjectForKey:kDTBrandKey];
    self.list = [aDecoder decodeObjectForKey:kDTBrandList];
    self.name = [aDecoder decodeObjectForKey:kDTBrandName];
    self.accreditLogo = [aDecoder decodeObjectForKey:kDTBrandAccreditLogo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kDTBrandKey];
    [aCoder encodeObject:_list forKey:kDTBrandList];
    [aCoder encodeObject:_name forKey:kDTBrandName];
    [aCoder encodeObject:_accreditLogo forKey:kDTBrandAccreditLogo];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTBrand *copy = [[DTBrand alloc] init];
    
    if (copy) {

        copy.key = [self.key copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.accreditLogo = [self.accreditLogo copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_key release];
    [_list release];
    [_name release];
    [_accreditLogo release];
    [super dealloc];
}

@end
