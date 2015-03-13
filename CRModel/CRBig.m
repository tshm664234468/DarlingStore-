//
//  CRBig.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CRBig.h"


NSString *const kCRBigY = @"y";
NSString *const kCRBigW = @"w";
NSString *const kCRBigImg = @"img";
NSString *const kCRBigX = @"x";
NSString *const kCRBigH = @"h";


@interface CRBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CRBig

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
            self.y = [self objectOrNilForKey:kCRBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kCRBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kCRBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kCRBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kCRBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kCRBigY];
    [mutableDict setValue:self.w forKey:kCRBigW];
    [mutableDict setValue:self.img forKey:kCRBigImg];
    [mutableDict setValue:self.x forKey:kCRBigX];
    [mutableDict setValue:self.h forKey:kCRBigH];

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

    self.y = [aDecoder decodeObjectForKey:kCRBigY];
    self.w = [aDecoder decodeObjectForKey:kCRBigW];
    self.img = [aDecoder decodeObjectForKey:kCRBigImg];
    self.x = [aDecoder decodeObjectForKey:kCRBigX];
    self.h = [aDecoder decodeObjectForKey:kCRBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kCRBigY];
    [aCoder encodeObject:_w forKey:kCRBigW];
    [aCoder encodeObject:_img forKey:kCRBigImg];
    [aCoder encodeObject:_x forKey:kCRBigX];
    [aCoder encodeObject:_h forKey:kCRBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    CRBig *copy = [[CRBig alloc] init];
    
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
