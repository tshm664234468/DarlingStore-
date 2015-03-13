//
//  DTKeywords.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTKeywords.h"


NSString *const kDTKeywordsKey = @"key";
NSString *const kDTKeywordsName = @"name";
NSString *const kDTKeywordsList = @"list";


@interface DTKeywords ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTKeywords

@synthesize key = _key;
@synthesize name = _name;
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
            self.key = [self objectOrNilForKey:kDTKeywordsKey fromDictionary:dict];
            self.name = [self objectOrNilForKey:kDTKeywordsName fromDictionary:dict];
            self.list = [self objectOrNilForKey:kDTKeywordsList fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kDTKeywordsKey];
    [mutableDict setValue:self.name forKey:kDTKeywordsName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDTKeywordsList];

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

    self.key = [aDecoder decodeObjectForKey:kDTKeywordsKey];
    self.name = [aDecoder decodeObjectForKey:kDTKeywordsName];
    self.list = [aDecoder decodeObjectForKey:kDTKeywordsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kDTKeywordsKey];
    [aCoder encodeObject:_name forKey:kDTKeywordsName];
    [aCoder encodeObject:_list forKey:kDTKeywordsList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTKeywords *copy = [[DTKeywords alloc] init];
    
    if (copy) {

        copy.key = [self.key copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_key release];
    [_name release];
    [_list release];
    [super dealloc];
}

@end
