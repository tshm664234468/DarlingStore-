//
//  DTHuodong.m
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "DTHuodong.h"


NSString *const kDTHuodongCurtime = @"curtime";
NSString *const kDTHuodongStartTime = @"start_time";
NSString *const kDTHuodongEndTime = @"end_time";
NSString *const kDTHuodongNewPrice = @"new_price";
NSString *const kDTHuodongOldPrice = @"old_price";


@interface DTHuodong ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DTHuodong

@synthesize curtime = _curtime;
@synthesize startTime = _startTime;
@synthesize endTime = _endTime;
@synthesize newPrice = _newPrice;
@synthesize oldPrice = _oldPrice;


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
            self.curtime = [[self objectOrNilForKey:kDTHuodongCurtime fromDictionary:dict] doubleValue];
            self.startTime = [[self objectOrNilForKey:kDTHuodongStartTime fromDictionary:dict] doubleValue];
            self.endTime = [[self objectOrNilForKey:kDTHuodongEndTime fromDictionary:dict] doubleValue];
            self.newPrice = [[self objectOrNilForKey:kDTHuodongNewPrice fromDictionary:dict] doubleValue];
            self.oldPrice = [[self objectOrNilForKey:kDTHuodongOldPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.curtime] forKey:kDTHuodongCurtime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.startTime] forKey:kDTHuodongStartTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endTime] forKey:kDTHuodongEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.newPrice] forKey:kDTHuodongNewPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.oldPrice] forKey:kDTHuodongOldPrice];

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

    self.curtime = [aDecoder decodeDoubleForKey:kDTHuodongCurtime];
    self.startTime = [aDecoder decodeDoubleForKey:kDTHuodongStartTime];
    self.endTime = [aDecoder decodeDoubleForKey:kDTHuodongEndTime];
    self.newPrice = [aDecoder decodeDoubleForKey:kDTHuodongNewPrice];
    self.oldPrice = [aDecoder decodeDoubleForKey:kDTHuodongOldPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_curtime forKey:kDTHuodongCurtime];
    [aCoder encodeDouble:_startTime forKey:kDTHuodongStartTime];
    [aCoder encodeDouble:_endTime forKey:kDTHuodongEndTime];
    [aCoder encodeDouble:_newPrice forKey:kDTHuodongNewPrice];
    [aCoder encodeDouble:_oldPrice forKey:kDTHuodongOldPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    DTHuodong *copy = [[DTHuodong alloc] init];
    
    if (copy) {

        copy.curtime = self.curtime;
        copy.startTime = self.startTime;
        copy.endTime = self.endTime;
        copy.newPrice = self.newPrice;
        copy.oldPrice = self.oldPrice;
    }
    
    return copy;
}


- (void)dealloc
{
    [super dealloc];
}

@end
