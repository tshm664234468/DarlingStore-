//
//  CRData.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CRData.h"
#import "CRList.h"


NSString *const kCRDataPages = @"pages";
NSString *const kCRDataCount = @"count";
NSString *const kCRDataList = @"list";
NSString *const kCRDataNext = @"next";


@interface CRData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CRData

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
            self.pages = [[self objectOrNilForKey:kCRDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kCRDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedCRList = [dict objectForKey:kCRDataList];
    NSMutableArray *parsedCRList = [NSMutableArray array];
    if ([receivedCRList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCRList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCRList addObject:[CRList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCRList isKindOfClass:[NSDictionary class]]) {
       [parsedCRList addObject:[CRList modelObjectWithDictionary:(NSDictionary *)receivedCRList]];
    }

    self.list = [NSArray arrayWithArray:parsedCRList];
            self.next = [[self objectOrNilForKey:kCRDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kCRDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kCRDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kCRDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kCRDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kCRDataPages];
    self.count = [aDecoder decodeDoubleForKey:kCRDataCount];
    self.list = [aDecoder decodeObjectForKey:kCRDataList];
    self.next = [aDecoder decodeBoolForKey:kCRDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kCRDataPages];
    [aCoder encodeDouble:_count forKey:kCRDataCount];
    [aCoder encodeObject:_list forKey:kCRDataList];
    [aCoder encodeBool:_next forKey:kCRDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    CRData *copy = [[CRData alloc] init];
    
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
