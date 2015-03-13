//
//  DTMoreLove.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTMoreLove.h"
#import "DTList.h"


NSString *const kDTMoreLoveTitle = @"title";
NSString *const kDTMoreLoveList = @"list";


@interface DTMoreLove ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTMoreLove

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
            self.title = [self objectOrNilForKey:kDTMoreLoveTitle fromDictionary:dict];
    NSObject *receivedDTList = [dict objectForKey:kDTMoreLoveList];
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
    [mutableDict setValue:self.title forKey:kDTMoreLoveTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDTMoreLoveList];

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

    self.title = [aDecoder decodeObjectForKey:kDTMoreLoveTitle];
    self.list = [aDecoder decodeObjectForKey:kDTMoreLoveList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kDTMoreLoveTitle];
    [aCoder encodeObject:_list forKey:kDTMoreLoveList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTMoreLove *copy = [[DTMoreLove alloc] init];
    
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
