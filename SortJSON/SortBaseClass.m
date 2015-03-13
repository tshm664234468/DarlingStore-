//
//  SortBaseClass.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SortBaseClass.h"
#import "SortData.h"


NSString *const kSortBaseClassStatus = @"status";
NSString *const kSortBaseClassData = @"data";


@interface SortBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SortBaseClass

@synthesize status = _status;
@synthesize data = _data;


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
            self.status = [[self objectOrNilForKey:kSortBaseClassStatus fromDictionary:dict] doubleValue];
    NSObject *receivedSortData = [dict objectForKey:kSortBaseClassData];
    NSMutableArray *parsedSortData = [NSMutableArray array];
    if ([receivedSortData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSortData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSortData addObject:[SortData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSortData isKindOfClass:[NSDictionary class]]) {
       [parsedSortData addObject:[SortData modelObjectWithDictionary:(NSDictionary *)receivedSortData]];
    }

    self.data = [NSArray arrayWithArray:parsedSortData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kSortBaseClassStatus];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kSortBaseClassData];

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

    self.status = [aDecoder decodeDoubleForKey:kSortBaseClassStatus];
    self.data = [aDecoder decodeObjectForKey:kSortBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kSortBaseClassStatus];
    [aCoder encodeObject:_data forKey:kSortBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    SortBaseClass *copy = [[SortBaseClass alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_data release];
    [super dealloc];
}

@end
