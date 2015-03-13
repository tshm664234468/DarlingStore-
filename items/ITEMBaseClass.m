//
//  ITEMBaseClass.m
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ITEMBaseClass.h"
#import "ITEMData.h"


NSString *const kITEMBaseClassStatus = @"status";
NSString *const kITEMBaseClassData = @"data";


@interface ITEMBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITEMBaseClass

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
            self.status = [[self objectOrNilForKey:kITEMBaseClassStatus fromDictionary:dict] doubleValue];
            self.data = [ITEMData modelObjectWithDictionary:[dict objectForKey:kITEMBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kITEMBaseClassStatus];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kITEMBaseClassData];

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

    self.status = [aDecoder decodeDoubleForKey:kITEMBaseClassStatus];
    self.data = [aDecoder decodeObjectForKey:kITEMBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kITEMBaseClassStatus];
    [aCoder encodeObject:_data forKey:kITEMBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITEMBaseClass *copy = [[ITEMBaseClass alloc] init];
    
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
