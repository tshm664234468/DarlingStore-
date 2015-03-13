//
//  DTSpecial.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTSpecial.h"
#import "DTList.h"


NSString *const kDTSpecialKey = @"key";
NSString *const kDTSpecialTxt = @"txt";
NSString *const kDTSpecialList = @"list";
NSString *const kDTSpecialName = @"name";


@interface DTSpecial ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTSpecial

@synthesize key = _key;
@synthesize txt = _txt;
@synthesize list = _list;
@synthesize name = _name;


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
            self.key = [self objectOrNilForKey:kDTSpecialKey fromDictionary:dict];
            self.txt = [self objectOrNilForKey:kDTSpecialTxt fromDictionary:dict];
    NSObject *receivedDTList = [dict objectForKey:kDTSpecialList];
    NSMutableArray *parsedDTList = [NSMutableArray array];
    if ([receivedDTList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDTList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDTList addObject:[DTList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDTList isKindOfClass:[NSDictionary class]]) {
       [parsedDTList addObject:[DTList modelObjectWithDictionary:(NSDictionary *)receivedDTList]];
    }

    self.list = [NSArray arrayWithArray:parsedDTList];
            self.name = [self objectOrNilForKey:kDTSpecialName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.key forKey:kDTSpecialKey];
    [mutableDict setValue:self.txt forKey:kDTSpecialTxt];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDTSpecialList];
    [mutableDict setValue:self.name forKey:kDTSpecialName];

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

    self.key = [aDecoder decodeObjectForKey:kDTSpecialKey];
    self.txt = [aDecoder decodeObjectForKey:kDTSpecialTxt];
    self.list = [aDecoder decodeObjectForKey:kDTSpecialList];
    self.name = [aDecoder decodeObjectForKey:kDTSpecialName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_key forKey:kDTSpecialKey];
    [aCoder encodeObject:_txt forKey:kDTSpecialTxt];
    [aCoder encodeObject:_list forKey:kDTSpecialList];
    [aCoder encodeObject:_name forKey:kDTSpecialName];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTSpecial *copy = [[DTSpecial alloc] init];
    
    if (copy) {

        copy.key = [self.key copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_key release];
    [_txt release];
    [_list release];
    [_name release];
    [super dealloc];
}

@end
