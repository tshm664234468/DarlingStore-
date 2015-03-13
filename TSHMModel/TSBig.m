//
//  TSBig.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TSBig.h"


NSString *const kTSBigY = @"y";
NSString *const kTSBigW = @"w";
NSString *const kTSBigImg = @"img";
NSString *const kTSBigX = @"x";
NSString *const kTSBigH = @"h";


@interface TSBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TSBig

@synthesize y = _y;
@synthesize w = _w;
@synthesize img = _img;
@synthesize x = _x;
@synthesize h = _h;


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
            self.y = [self objectOrNilForKey:kTSBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kTSBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kTSBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kTSBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kTSBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kTSBigY];
    [mutableDict setValue:self.w forKey:kTSBigW];
    [mutableDict setValue:self.img forKey:kTSBigImg];
    [mutableDict setValue:self.x forKey:kTSBigX];
    [mutableDict setValue:self.h forKey:kTSBigH];

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

    self.y = [aDecoder decodeObjectForKey:kTSBigY];
    self.w = [aDecoder decodeObjectForKey:kTSBigW];
    self.img = [aDecoder decodeObjectForKey:kTSBigImg];
    self.x = [aDecoder decodeObjectForKey:kTSBigX];
    self.h = [aDecoder decodeObjectForKey:kTSBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kTSBigY];
    [aCoder encodeObject:_w forKey:kTSBigW];
    [aCoder encodeObject:_img forKey:kTSBigImg];
    [aCoder encodeObject:_x forKey:kTSBigX];
    [aCoder encodeObject:_h forKey:kTSBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    TSBig *copy = [[TSBig alloc] init];
    
    if (copy) {

        copy.y = [self.y copyWithZone:zone];
        copy.w = [self.w copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.x = [self.x copyWithZone:zone];
        copy.h = [self.h copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_y release];
    [_w release];
    [_img release];
    [_x release];
    [_h release];
    [super dealloc];
}

@end
