//
//  BZRPBig.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRPBig.h"


NSString *const kBZRPBigY = @"y";
NSString *const kBZRPBigW = @"w";
NSString *const kBZRPBigImg = @"img";
NSString *const kBZRPBigX = @"x";
NSString *const kBZRPBigH = @"h";


@interface BZRPBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRPBig

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
            self.y = [self objectOrNilForKey:kBZRPBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kBZRPBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kBZRPBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kBZRPBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kBZRPBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kBZRPBigY];
    [mutableDict setValue:self.w forKey:kBZRPBigW];
    [mutableDict setValue:self.img forKey:kBZRPBigImg];
    [mutableDict setValue:self.x forKey:kBZRPBigX];
    [mutableDict setValue:self.h forKey:kBZRPBigH];

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

    self.y = [aDecoder decodeObjectForKey:kBZRPBigY];
    self.w = [aDecoder decodeObjectForKey:kBZRPBigW];
    self.img = [aDecoder decodeObjectForKey:kBZRPBigImg];
    self.x = [aDecoder decodeObjectForKey:kBZRPBigX];
    self.h = [aDecoder decodeObjectForKey:kBZRPBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kBZRPBigY];
    [aCoder encodeObject:_w forKey:kBZRPBigW];
    [aCoder encodeObject:_img forKey:kBZRPBigImg];
    [aCoder encodeObject:_x forKey:kBZRPBigX];
    [aCoder encodeObject:_h forKey:kBZRPBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRPBig *copy = [[BZRPBig alloc] init];
    
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
