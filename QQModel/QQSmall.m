//
//  QQSmall.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QQSmall.h"


NSString *const kQQSmallY = @"y";
NSString *const kQQSmallW = @"w";
NSString *const kQQSmallImg = @"img";
NSString *const kQQSmallX = @"x";
NSString *const kQQSmallH = @"h";


@interface QQSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QQSmall

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
            self.y = [self objectOrNilForKey:kQQSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kQQSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kQQSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kQQSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kQQSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kQQSmallY];
    [mutableDict setValue:self.w forKey:kQQSmallW];
    [mutableDict setValue:self.img forKey:kQQSmallImg];
    [mutableDict setValue:self.x forKey:kQQSmallX];
    [mutableDict setValue:self.h forKey:kQQSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kQQSmallY];
    self.w = [aDecoder decodeObjectForKey:kQQSmallW];
    self.img = [aDecoder decodeObjectForKey:kQQSmallImg];
    self.x = [aDecoder decodeObjectForKey:kQQSmallX];
    self.h = [aDecoder decodeObjectForKey:kQQSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kQQSmallY];
    [aCoder encodeObject:_w forKey:kQQSmallW];
    [aCoder encodeObject:_img forKey:kQQSmallImg];
    [aCoder encodeObject:_x forKey:kQQSmallX];
    [aCoder encodeObject:_h forKey:kQQSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    QQSmall *copy = [[QQSmall alloc] init];
    
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
