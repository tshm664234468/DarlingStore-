//
//  BZRPData.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRPData.h"
#import "BZRPList.h"


NSString *const kBZRPDataPages = @"pages";
NSString *const kBZRPDataCount = @"count";
NSString *const kBZRPDataList = @"list";
NSString *const kBZRPDataNext = @"next";


@interface BZRPData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRPData

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
            self.pages = [[self objectOrNilForKey:kBZRPDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kBZRPDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedBZRPList = [dict objectForKey:kBZRPDataList];
    NSMutableArray *parsedBZRPList = [NSMutableArray array];
    if ([receivedBZRPList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBZRPList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBZRPList addObject:[BZRPList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBZRPList isKindOfClass:[NSDictionary class]]) {
       [parsedBZRPList addObject:[BZRPList modelObjectWithDictionary:(NSDictionary *)receivedBZRPList]];
    }

    self.list = [NSArray arrayWithArray:parsedBZRPList];
            self.next = [[self objectOrNilForKey:kBZRPDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kBZRPDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kBZRPDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kBZRPDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kBZRPDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kBZRPDataPages];
    self.count = [aDecoder decodeDoubleForKey:kBZRPDataCount];
    self.list = [aDecoder decodeObjectForKey:kBZRPDataList];
    self.next = [aDecoder decodeBoolForKey:kBZRPDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kBZRPDataPages];
    [aCoder encodeDouble:_count forKey:kBZRPDataCount];
    [aCoder encodeObject:_list forKey:kBZRPDataList];
    [aCoder encodeBool:_next forKey:kBZRPDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRPData *copy = [[BZRPData alloc] init];
    
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
