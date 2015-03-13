//
//  CYBig.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CYBig.h"


NSString *const kCYBigY = @"y";
NSString *const kCYBigW = @"w";
NSString *const kCYBigImg = @"img";
NSString *const kCYBigX = @"x";
NSString *const kCYBigH = @"h";


@interface CYBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CYBig

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
            self.y = [self objectOrNilForKey:kCYBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kCYBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kCYBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kCYBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kCYBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kCYBigY];
    [mutableDict setValue:self.w forKey:kCYBigW];
    [mutableDict setValue:self.img forKey:kCYBigImg];
    [mutableDict setValue:self.x forKey:kCYBigX];
    [mutableDict setValue:self.h forKey:kCYBigH];

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

    self.y = [aDecoder decodeObjectForKey:kCYBigY];
    self.w = [aDecoder decodeObjectForKey:kCYBigW];
    self.img = [aDecoder decodeObjectForKey:kCYBigImg];
    self.x = [aDecoder decodeObjectForKey:kCYBigX];
    self.h = [aDecoder decodeObjectForKey:kCYBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kCYBigY];
    [aCoder encodeObject:_w forKey:kCYBigW];
    [aCoder encodeObject:_img forKey:kCYBigImg];
    [aCoder encodeObject:_x forKey:kCYBigX];
    [aCoder encodeObject:_h forKey:kCYBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    CYBig *copy = [[CYBig alloc] init];
    
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
