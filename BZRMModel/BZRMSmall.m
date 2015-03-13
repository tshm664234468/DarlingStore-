//
//  BZRMSmall.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRMSmall.h"


NSString *const kBZRMSmallY = @"y";
NSString *const kBZRMSmallW = @"w";
NSString *const kBZRMSmallImg = @"img";
NSString *const kBZRMSmallX = @"x";
NSString *const kBZRMSmallH = @"h";


@interface BZRMSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRMSmall

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
            self.y = [self objectOrNilForKey:kBZRMSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kBZRMSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kBZRMSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kBZRMSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kBZRMSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kBZRMSmallY];
    [mutableDict setValue:self.w forKey:kBZRMSmallW];
    [mutableDict setValue:self.img forKey:kBZRMSmallImg];
    [mutableDict setValue:self.x forKey:kBZRMSmallX];
    [mutableDict setValue:self.h forKey:kBZRMSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kBZRMSmallY];
    self.w = [aDecoder decodeObjectForKey:kBZRMSmallW];
    self.img = [aDecoder decodeObjectForKey:kBZRMSmallImg];
    self.x = [aDecoder decodeObjectForKey:kBZRMSmallX];
    self.h = [aDecoder decodeObjectForKey:kBZRMSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kBZRMSmallY];
    [aCoder encodeObject:_w forKey:kBZRMSmallW];
    [aCoder encodeObject:_img forKey:kBZRMSmallImg];
    [aCoder encodeObject:_x forKey:kBZRMSmallX];
    [aCoder encodeObject:_h forKey:kBZRMSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRMSmall *copy = [[BZRMSmall alloc] init];
    
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
