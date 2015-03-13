//
//  QQData.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QQData.h"
#import "QQList.h"


NSString *const kQQDataPages = @"pages";
NSString *const kQQDataCount = @"count";
NSString *const kQQDataList = @"list";
NSString *const kQQDataNext = @"next";


@interface QQData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QQData

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
            self.pages = [[self objectOrNilForKey:kQQDataPages fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kQQDataCount fromDictionary:dict] doubleValue];
    NSObject *receivedQQList = [dict objectForKey:kQQDataList];
    NSMutableArray *parsedQQList = [NSMutableArray array];
    if ([receivedQQList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedQQList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedQQList addObject:[QQList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedQQList isKindOfClass:[NSDictionary class]]) {
       [parsedQQList addObject:[QQList modelObjectWithDictionary:(NSDictionary *)receivedQQList]];
    }

    self.list = [NSArray arrayWithArray:parsedQQList];
            self.next = [[self objectOrNilForKey:kQQDataNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kQQDataPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kQQDataCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kQQDataList];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kQQDataNext];

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

    self.pages = [aDecoder decodeDoubleForKey:kQQDataPages];
    self.count = [aDecoder decodeDoubleForKey:kQQDataCount];
    self.list = [aDecoder decodeObjectForKey:kQQDataList];
    self.next = [aDecoder decodeBoolForKey:kQQDataNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kQQDataPages];
    [aCoder encodeDouble:_count forKey:kQQDataCount];
    [aCoder encodeObject:_list forKey:kQQDataList];
    [aCoder encodeBool:_next forKey:kQQDataNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    QQData *copy = [[QQData alloc] init];
    
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
