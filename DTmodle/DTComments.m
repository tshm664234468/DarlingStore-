//
//  DTComments.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTComments.h"
#import "DTList.h"


NSString *const kDTCommentsCount = @"count";
NSString *const kDTCommentsList = @"list";


@interface DTComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTComments

@synthesize count = _count;
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
            self.count = [self objectOrNilForKey:kDTCommentsCount fromDictionary:dict];
    NSObject *receivedDTList = [dict objectForKey:kDTCommentsList];
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

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.count forKey:kDTCommentsCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kDTCommentsList];

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

    self.count = [aDecoder decodeObjectForKey:kDTCommentsCount];
    self.list = [aDecoder decodeObjectForKey:kDTCommentsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_count forKey:kDTCommentsCount];
    [aCoder encodeObject:_list forKey:kDTCommentsList];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTComments *copy = [[DTComments alloc] init];
    
    if (copy) {

        copy.count = [self.count copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_count release];
    [_list release];
    [super dealloc];
}

@end
