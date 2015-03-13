//
//  ZYSmall.m
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYSmall.h"


NSString *const kZYSmallY = @"y";
NSString *const kZYSmallW = @"w";
NSString *const kZYSmallImg = @"img";
NSString *const kZYSmallX = @"x";
NSString *const kZYSmallH = @"h";


@interface ZYSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYSmall

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
            self.y = [self objectOrNilForKey:kZYSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kZYSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kZYSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kZYSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kZYSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kZYSmallY];
    [mutableDict setValue:self.w forKey:kZYSmallW];
    [mutableDict setValue:self.img forKey:kZYSmallImg];
    [mutableDict setValue:self.x forKey:kZYSmallX];
    [mutableDict setValue:self.h forKey:kZYSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kZYSmallY];
    self.w = [aDecoder decodeObjectForKey:kZYSmallW];
    self.img = [aDecoder decodeObjectForKey:kZYSmallImg];
    self.x = [aDecoder decodeObjectForKey:kZYSmallX];
    self.h = [aDecoder decodeObjectForKey:kZYSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kZYSmallY];
    [aCoder encodeObject:_w forKey:kZYSmallW];
    [aCoder encodeObject:_img forKey:kZYSmallImg];
    [aCoder encodeObject:_x forKey:kZYSmallX];
    [aCoder encodeObject:_h forKey:kZYSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYSmall *copy = [[ZYSmall alloc] init];
    
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
