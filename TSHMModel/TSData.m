//
//  TSData.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TSData.h"
#import "TSList.h"


NSString *const kTSDataPages = @"pages";
NSString *const kTSDataCount = @"count";
NSString *const kTSDataList = @"list";
NSString *const kTSDataNext = @"next";


@interface TSData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TSData

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
            self.pages = [[self objectOrNilForKey:kTSDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kTSDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedTSList = [dict objectForKey:kTSDataList];
    NSMutableArray *parsedTSList = [NSMutableArray array];
    if ([receivedTSList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTSList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTSList addObject:[TSList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTSList isKindOfClass:[NSDictionary class]]) {
       [parsedTSList addObject:[TSList modelObjectWithDictionary:(NSDictionary *)receivedTSList]];
    }

    self.list = [NSArray arrayWithArray:parsedTSList];
            self.next = [[self objectOrNilForKey:kTSDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kTSDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kTSDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kTSDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kTSDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kTSDataPages];
    self.count = [aDecoder decodeDoubleForKey:kTSDataCount];
    self.list = [aDecoder decodeObjectForKey:kTSDataList];
    self.next = [aDecoder decodeBoolForKey:kTSDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kTSDataPages];
    [aCoder encodeDouble:_count forKey:kTSDataCount];
    [aCoder encodeObject:_list forKey:kTSDataList];
    [aCoder encodeBool:_next forKey:kTSDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    TSData *copy = [[TSData alloc] init];
    
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
