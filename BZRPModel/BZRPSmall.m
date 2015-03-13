//
//  BZRPSmall.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRPSmall.h"


NSString *const kBZRPSmallY = @"y";
NSString *const kBZRPSmallW = @"w";
NSString *const kBZRPSmallImg = @"img";
NSString *const kBZRPSmallX = @"x";
NSString *const kBZRPSmallH = @"h";


@interface BZRPSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRPSmall

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
            self.y = [self objectOrNilForKey:kBZRPSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kBZRPSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kBZRPSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kBZRPSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kBZRPSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kBZRPSmallY];
    [mutableDict setValue:self.w forKey:kBZRPSmallW];
    [mutableDict setValue:self.img forKey:kBZRPSmallImg];
    [mutableDict setValue:self.x forKey:kBZRPSmallX];
    [mutableDict setValue:self.h forKey:kBZRPSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kBZRPSmallY];
    self.w = [aDecoder decodeObjectForKey:kBZRPSmallW];
    self.img = [aDecoder decodeObjectForKey:kBZRPSmallImg];
    self.x = [aDecoder decodeObjectForKey:kBZRPSmallX];
    self.h = [aDecoder decodeObjectForKey:kBZRPSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kBZRPSmallY];
    [aCoder encodeObject:_w forKey:kBZRPSmallW];
    [aCoder encodeObject:_img forKey:kBZRPSmallImg];
    [aCoder encodeObject:_x forKey:kBZRPSmallX];
    [aCoder encodeObject:_h forKey:kBZRPSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRPSmall *copy = [[BZRPSmall alloc] init];
    
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
