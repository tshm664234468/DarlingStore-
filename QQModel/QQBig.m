//
//  QQBig.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "QQBig.h"


NSString *const kQQBigY = @"y";
NSString *const kQQBigW = @"w";
NSString *const kQQBigImg = @"img";
NSString *const kQQBigX = @"x";
NSString *const kQQBigH = @"h";


@interface QQBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation QQBig

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
            self.y = [self objectOrNilForKey:kQQBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kQQBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kQQBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kQQBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kQQBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kQQBigY];
    [mutableDict setValue:self.w forKey:kQQBigW];
    [mutableDict setValue:self.img forKey:kQQBigImg];
    [mutableDict setValue:self.x forKey:kQQBigX];
    [mutableDict setValue:self.h forKey:kQQBigH];

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

    self.y = [aDecoder decodeObjectForKey:kQQBigY];
    self.w = [aDecoder decodeObjectForKey:kQQBigW];
    self.img = [aDecoder decodeObjectForKey:kQQBigImg];
    self.x = [aDecoder decodeObjectForKey:kQQBigX];
    self.h = [aDecoder decodeObjectForKey:kQQBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kQQBigY];
    [aCoder encodeObject:_w forKey:kQQBigW];
    [aCoder encodeObject:_img forKey:kQQBigImg];
    [aCoder encodeObject:_x forKey:kQQBigX];
    [aCoder encodeObject:_h forKey:kQQBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    QQBig *copy = [[QQBig alloc] init];
    
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
