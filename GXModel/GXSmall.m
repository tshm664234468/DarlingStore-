//
//  GXSmall.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GXSmall.h"


NSString *const kGXSmallY = @"y";
NSString *const kGXSmallW = @"w";
NSString *const kGXSmallImg = @"img";
NSString *const kGXSmallX = @"x";
NSString *const kGXSmallH = @"h";


@interface GXSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GXSmall

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
            self.y = [self objectOrNilForKey:kGXSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kGXSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kGXSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kGXSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kGXSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kGXSmallY];
    [mutableDict setValue:self.w forKey:kGXSmallW];
    [mutableDict setValue:self.img forKey:kGXSmallImg];
    [mutableDict setValue:self.x forKey:kGXSmallX];
    [mutableDict setValue:self.h forKey:kGXSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kGXSmallY];
    self.w = [aDecoder decodeObjectForKey:kGXSmallW];
    self.img = [aDecoder decodeObjectForKey:kGXSmallImg];
    self.x = [aDecoder decodeObjectForKey:kGXSmallX];
    self.h = [aDecoder decodeObjectForKey:kGXSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kGXSmallY];
    [aCoder encodeObject:_w forKey:kGXSmallW];
    [aCoder encodeObject:_img forKey:kGXSmallImg];
    [aCoder encodeObject:_x forKey:kGXSmallX];
    [aCoder encodeObject:_h forKey:kGXSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    GXSmall *copy = [[GXSmall alloc] init];
    
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
