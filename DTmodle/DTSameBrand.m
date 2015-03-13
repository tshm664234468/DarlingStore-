//
//  DTSameBrand.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTSameBrand.h"
#import "DTList.h"


NSString *const kDTSameBrandTitle = @"title";
NSString *const kDTSameBrandList = @"list";


@interface DTSameBrand ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTSameBrand

@synthesize title = _title;
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
            self.title = [self objectOrNilForKey:kDTSameBrandTitle fromDictionary:dict];
    NSObject *receivedDTList = [dict objectForKey:kDTSameBrandList];
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
    [mutableDict setValue:self.title forKey:kDTSameBrandTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDTSameBrandList];

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

    self.title = [aDecoder decodeObjectForKey:kDTSameBrandTitle];
    self.list = [aDecoder decodeObjectForKey:kDTSameBrandList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kDTSameBrandTitle];
    [aCoder encodeObject:_list forKey:kDTSameBrandList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTSameBrand *copy = [[DTSameBrand alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_title release];
    [_list release];
    [super dealloc];
}

@end
