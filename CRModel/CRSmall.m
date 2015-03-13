//
//  CRSmall.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CRSmall.h"


NSString *const kCRSmallY = @"y";
NSString *const kCRSmallW = @"w";
NSString *const kCRSmallImg = @"img";
NSString *const kCRSmallX = @"x";
NSString *const kCRSmallH = @"h";


@interface CRSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CRSmall

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
            self.y = [self objectOrNilForKey:kCRSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kCRSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kCRSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kCRSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kCRSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kCRSmallY];
    [mutableDict setValue:self.w forKey:kCRSmallW];
    [mutableDict setValue:self.img forKey:kCRSmallImg];
    [mutableDict setValue:self.x forKey:kCRSmallX];
    [mutableDict setValue:self.h forKey:kCRSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kCRSmallY];
    self.w = [aDecoder decodeObjectForKey:kCRSmallW];
    self.img = [aDecoder decodeObjectForKey:kCRSmallImg];
    self.x = [aDecoder decodeObjectForKey:kCRSmallX];
    self.h = [aDecoder decodeObjectForKey:kCRSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kCRSmallY];
    [aCoder encodeObject:_w forKey:kCRSmallW];
    [aCoder encodeObject:_img forKey:kCRSmallImg];
    [aCoder encodeObject:_x forKey:kCRSmallX];
    [aCoder encodeObject:_h forKey:kCRSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    CRSmall *copy = [[CRSmall alloc] init];
    
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
