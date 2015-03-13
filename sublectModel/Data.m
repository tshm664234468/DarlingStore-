//
//  Data.m
//
//  Created by   on 15-3-6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Data.h"
#import "List.h"


NSString *const kDataPages = @"pages";
NSString *const kDataNext = @"next";
NSString *const kDataList = @"list";


@interface Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Data

@synthesize pages = _pages;
@synthesize next = _next;
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
            self.pages = [[self objectOrNilForKey:kDataPages fromDictionary:dict] doubleValue];
            self.next = [[self objectOrNilForKey:kDataNext fromDictionary:dict] boolValue];
    NSObject *receivedList = [dict objectForKey:kDataList];
    NSMutableArray *parsedList = [NSMutableArray array];
    if ([receivedList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedList addObject:[List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedList isKindOfClass:[NSDictionary class]]) {
       [parsedList addObject:[List modelObjectWithDictionary:(NSDictionary *)receivedList]];
    }

    self.list = [NSArray arrayWithArray:parsedList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kDataPages];
    [mutableDict setValue:[NSNumber numberWithBool:self.next] forKey:kDataNext];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDataList];

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

    self.pages = [aDecoder decodeDoubleForKey:kDataPages];
    self.next = [aDecoder decodeBoolForKey:kDataNext];
    self.list = [aDecoder decodeObjectForKey:kDataList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pages forKey:kDataPages];
    [aCoder encodeBool:_next forKey:kDataNext];
    [aCoder encodeObject:_list forKey:kDataList];
}

- (id)copyWithZone:(NSZone *)zone
{
    Data *copy = [[Data alloc] init];
    
    if (copy) {

        copy.pages = self.pages;
        copy.next = self.next;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_list release];
    [super dealloc];
}

@end
