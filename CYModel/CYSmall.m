//
//  CYSmall.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CYSmall.h"


NSString *const kCYSmallY = @"y";
NSString *const kCYSmallW = @"w";
NSString *const kCYSmallImg = @"img";
NSString *const kCYSmallX = @"x";
NSString *const kCYSmallH = @"h";


@interface CYSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CYSmall

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
            self.y = [self objectOrNilForKey:kCYSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kCYSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kCYSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kCYSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kCYSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kCYSmallY];
    [mutableDict setValue:self.w forKey:kCYSmallW];
    [mutableDict setValue:self.img forKey:kCYSmallImg];
    [mutableDict setValue:self.x forKey:kCYSmallX];
    [mutableDict setValue:self.h forKey:kCYSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kCYSmallY];
    self.w = [aDecoder decodeObjectForKey:kCYSmallW];
    self.img = [aDecoder decodeObjectForKey:kCYSmallImg];
    self.x = [aDecoder decodeObjectForKey:kCYSmallX];
    self.h = [aDecoder decodeObjectForKey:kCYSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kCYSmallY];
    [aCoder encodeObject:_w forKey:kCYSmallW];
    [aCoder encodeObject:_img forKey:kCYSmallImg];
    [aCoder encodeObject:_x forKey:kCYSmallX];
    [aCoder encodeObject:_h forKey:kCYSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    CYSmall *copy = [[CYSmall alloc] init];
    
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
