//
//  GXBig.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GXBig.h"


NSString *const kGXBigY = @"y";
NSString *const kGXBigW = @"w";
NSString *const kGXBigImg = @"img";
NSString *const kGXBigX = @"x";
NSString *const kGXBigH = @"h";


@interface GXBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GXBig

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
            self.y = [self objectOrNilForKey:kGXBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kGXBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kGXBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kGXBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kGXBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kGXBigY];
    [mutableDict setValue:self.w forKey:kGXBigW];
    [mutableDict setValue:self.img forKey:kGXBigImg];
    [mutableDict setValue:self.x forKey:kGXBigX];
    [mutableDict setValue:self.h forKey:kGXBigH];

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

    self.y = [aDecoder decodeObjectForKey:kGXBigY];
    self.w = [aDecoder decodeObjectForKey:kGXBigW];
    self.img = [aDecoder decodeObjectForKey:kGXBigImg];
    self.x = [aDecoder decodeObjectForKey:kGXBigX];
    self.h = [aDecoder decodeObjectForKey:kGXBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kGXBigY];
    [aCoder encodeObject:_w forKey:kGXBigW];
    [aCoder encodeObject:_img forKey:kGXBigImg];
    [aCoder encodeObject:_x forKey:kGXBigX];
    [aCoder encodeObject:_h forKey:kGXBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    GXBig *copy = [[GXBig alloc] init];
    
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
