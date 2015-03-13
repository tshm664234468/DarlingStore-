//
//  CYData.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CYData.h"
#import "CYList.h"


NSString *const kCYDataPages = @"pages";
NSString *const kCYDataCount = @"count";
NSString *const kCYDataList = @"list";
NSString *const kCYDataNext = @"next";


@interface CYData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CYData

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
            self.pages = [[self objectOrNilForKey:kCYDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kCYDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedCYList = [dict objectForKey:kCYDataList];
    NSMutableArray *parsedCYList = [NSMutableArray array];
    if ([receivedCYList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCYList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCYList addObject:[CYList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCYList isKindOfClass:[NSDictionary class]]) {
       [parsedCYList addObject:[CYList modelObjectWithDictionary:(NSDictionary *)receivedCYList]];
    }

    self.list = [NSArray arrayWithArray:parsedCYList];
            self.next = [[self objectOrNilForKey:kCYDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kCYDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kCYDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kCYDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kCYDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kCYDataPages];
    self.count = [aDecoder decodeDoubleForKey:kCYDataCount];
    self.list = [aDecoder decodeObjectForKey:kCYDataList];
    self.next = [aDecoder decodeBoolForKey:kCYDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kCYDataPages];
    [aCoder encodeDouble:_count forKey:kCYDataCount];
    [aCoder encodeObject:_list forKey:kCYDataList];
    [aCoder encodeBool:_next forKey:kCYDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    CYData *copy = [[CYData alloc] init];
    
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
