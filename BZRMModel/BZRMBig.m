//
//  BZRMBig.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRMBig.h"


NSString *const kBZRMBigY = @"y";
NSString *const kBZRMBigW = @"w";
NSString *const kBZRMBigImg = @"img";
NSString *const kBZRMBigX = @"x";
NSString *const kBZRMBigH = @"h";


@interface BZRMBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRMBig

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
            self.y = [self objectOrNilForKey:kBZRMBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kBZRMBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kBZRMBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kBZRMBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kBZRMBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kBZRMBigY];
    [mutableDict setValue:self.w forKey:kBZRMBigW];
    [mutableDict setValue:self.img forKey:kBZRMBigImg];
    [mutableDict setValue:self.x forKey:kBZRMBigX];
    [mutableDict setValue:self.h forKey:kBZRMBigH];

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

    self.y = [aDecoder decodeObjectForKey:kBZRMBigY];
    self.w = [aDecoder decodeObjectForKey:kBZRMBigW];
    self.img = [aDecoder decodeObjectForKey:kBZRMBigImg];
    self.x = [aDecoder decodeObjectForKey:kBZRMBigX];
    self.h = [aDecoder decodeObjectForKey:kBZRMBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kBZRMBigY];
    [aCoder encodeObject:_w forKey:kBZRMBigW];
    [aCoder encodeObject:_img forKey:kBZRMBigImg];
    [aCoder encodeObject:_x forKey:kBZRMBigX];
    [aCoder encodeObject:_h forKey:kBZRMBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRMBig *copy = [[BZRMBig alloc] init];
    
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
