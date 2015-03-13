//
//  ITEMData.m
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ITEMData.h"
#import "ITEMList.h"


NSString *const kITEMDataPages = @"pages";
NSString *const kITEMDataCount = @"count";
NSString *const kITEMDataList = @"list";
NSString *const kITEMDataNext = @"next";


@interface ITEMData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITEMData

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
            self.pages = [[self objectOrNilForKey:kITEMDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kITEMDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedITEMList = [dict objectForKey:kITEMDataList];
    NSMutableArray *parsedITEMList = [NSMutableArray array];
    if ([receivedITEMList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedITEMList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedITEMList addObject:[ITEMList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedITEMList isKindOfClass:[NSDictionary class]]) {
       [parsedITEMList addObject:[ITEMList modelObjectWithDictionary:(NSDictionary *)receivedITEMList]];
    }

    self.list = [NSArray arrayWithArray:parsedITEMList];
            self.next = [[self objectOrNilForKey:kITEMDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kITEMDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kITEMDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kITEMDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kITEMDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kITEMDataPages];
    self.count = [aDecoder decodeDoubleForKey:kITEMDataCount];
    self.list = [aDecoder decodeObjectForKey:kITEMDataList];
    self.next = [aDecoder decodeBoolForKey:kITEMDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kITEMDataPages];
    [aCoder encodeDouble:_count forKey:kITEMDataCount];
    [aCoder encodeObject:_list forKey:kITEMDataList];
    [aCoder encodeBool:_next forKey:kITEMDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITEMData *copy = [[ITEMData alloc] init];
    
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
