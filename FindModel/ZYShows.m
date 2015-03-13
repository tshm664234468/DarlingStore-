//
//  ZYShows.m
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYShows.h"


NSString *const kZYShowsKey = @"key";
NSString *const kZYShowsTxt = @"txt";
NSString *const kZYShowsList = @"list";


@interface ZYShows ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYShows

@synthesize key = _key;
@synthesize txt = _txt;
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
            self.key = [self objectOrNilForKey:kZYShowsKey fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kZYShowsTxt fromDictionary:dict];
            self.list = [self objectOrNilForKey:kZYShowsList fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kZYShowsKey];
    [mutableDict setValue:self.txt forKey:kZYShowsTxt];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZYShowsList];

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

    self.key = [aDecoder decodeObjectForKey:kZYShowsKey];
    self.txt = [aDecoder decodeObjectForKey:kZYShowsTxt];
    self.list = [aDecoder decodeObjectForKey:kZYShowsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kZYShowsKey];
    [aCoder encodeObject:_txt forKey:kZYShowsTxt];
    [aCoder encodeObject:_list forKey:kZYShowsList];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYShows *copy = [[ZYShows alloc] init];
    
    if (copy) {

        copy.key = [self.key copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_key release];
    [_txt release];
    [_list release];
    [super dealloc];
}

@end
