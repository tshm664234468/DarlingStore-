//
//  GXData.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GXData.h"
#import "GXList.h"


NSString *const kGXDataPages = @"pages";
NSString *const kGXDataCount = @"count";
NSString *const kGXDataList = @"list";
NSString *const kGXDataNext = @"next";


@interface GXData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GXData

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
            self.pages = [[self objectOrNilForKey:kGXDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kGXDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedGXList = [dict objectForKey:kGXDataList];
    NSMutableArray *parsedGXList = [NSMutableArray array];
    if ([receivedGXList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGXList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGXList addObject:[GXList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGXList isKindOfClass:[NSDictionary class]]) {
       [parsedGXList addObject:[GXList modelObjectWithDictionary:(NSDictionary *)receivedGXList]];
    }

    self.list = [NSArray arrayWithArray:parsedGXList];
            self.next = [[self objectOrNilForKey:kGXDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kGXDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kGXDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kGXDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kGXDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kGXDataPages];
    self.count = [aDecoder decodeDoubleForKey:kGXDataCount];
    self.list = [aDecoder decodeObjectForKey:kGXDataList];
    self.next = [aDecoder decodeBoolForKey:kGXDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kGXDataPages];
    [aCoder encodeDouble:_count forKey:kGXDataCount];
    [aCoder encodeObject:_list forKey:kGXDataList];
    [aCoder encodeBool:_next forKey:kGXDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    GXData *copy = [[GXData alloc] init];
    
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
