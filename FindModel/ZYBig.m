//
//  ZYBig.m
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYBig.h"


NSString *const kZYBigY = @"y";
NSString *const kZYBigW = @"w";
NSString *const kZYBigImg = @"img";
NSString *const kZYBigX = @"x";
NSString *const kZYBigH = @"h";


@interface ZYBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYBig

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
            self.y = [self objectOrNilForKey:kZYBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kZYBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kZYBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kZYBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kZYBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kZYBigY];
    [mutableDict setValue:self.w forKey:kZYBigW];
    [mutableDict setValue:self.img forKey:kZYBigImg];
    [mutableDict setValue:self.x forKey:kZYBigX];
    [mutableDict setValue:self.h forKey:kZYBigH];

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

    self.y = [aDecoder decodeObjectForKey:kZYBigY];
    self.w = [aDecoder decodeObjectForKey:kZYBigW];
    self.img = [aDecoder decodeObjectForKey:kZYBigImg];
    self.x = [aDecoder decodeObjectForKey:kZYBigX];
    self.h = [aDecoder decodeObjectForKey:kZYBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kZYBigY];
    [aCoder encodeObject:_w forKey:kZYBigW];
    [aCoder encodeObject:_img forKey:kZYBigImg];
    [aCoder encodeObject:_x forKey:kZYBigX];
    [aCoder encodeObject:_h forKey:kZYBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYBig *copy = [[ZYBig alloc] init];
    
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
