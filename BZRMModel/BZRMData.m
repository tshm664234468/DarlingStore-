//
//  BZRMData.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRMData.h"
#import "BZRMList.h"


NSString *const kBZRMDataPages = @"pages";
NSString *const kBZRMDataCount = @"count";
NSString *const kBZRMDataList = @"list";
NSString *const kBZRMDataNext = @"next";


@interface BZRMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRMData

@synthesize pages = _pages;
@synthesize count = _count;
@synthesize list = _list;
@synthesize next = _next;


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
            self.pages = [[self objectOrNilForKey:kBZRMDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kBZRMDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedBZRMList = [dict objectForKey:kBZRMDataList];
    NSMutableArray *parsedBZRMList = [NSMutableArray array];
    if ([receivedBZRMList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBZRMList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBZRMList addObject:[BZRMList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBZRMList isKindOfClass:[NSDictionary class]]) {
       [parsedBZRMList addObject:[BZRMList modelObjectWithDictionary:(NSDictionary *)receivedBZRMList]];
    }

    self.list = [NSArray arrayWithArray:parsedBZRMList];
            self.next = [[self objectOrNilForKey:kBZRMDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kBZRMDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kBZRMDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kBZRMDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kBZRMDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kBZRMDataPages];
    self.count = [aDecoder decodeDoubleForKey:kBZRMDataCount];
    self.list = [aDecoder decodeObjectForKey:kBZRMDataList];
    self.next = [aDecoder decodeBoolForKey:kBZRMDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kBZRMDataPages];
    [aCoder encodeDouble:_count forKey:kBZRMDataCount];
    [aCoder encodeObject:_list forKey:kBZRMDataList];
    [aCoder encodeBool:_next forKey:kBZRMDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRMData *copy = [[BZRMData alloc] init];
    
    if (copy) {

        copy.pages = self.pages;
        copy.count = self.count;
        copy.list = [self.list copyWithZone:zone];
        copy.next = self.next;
    }
    
    return copy;
}


- (void)dealloc
{
    [_list release];
    [super dealloc];
}

@end
