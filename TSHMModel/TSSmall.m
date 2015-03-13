//
//  TSSmall.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TSSmall.h"


NSString *const kTSSmallY = @"y";
NSString *const kTSSmallW = @"w";
NSString *const kTSSmallImg = @"img";
NSString *const kTSSmallX = @"x";
NSString *const kTSSmallH = @"h";


@interface TSSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TSSmall

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
            self.y = [self objectOrNilForKey:kTSSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kTSSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kTSSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kTSSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kTSSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kTSSmallY];
    [mutableDict setValue:self.w forKey:kTSSmallW];
    [mutableDict setValue:self.img forKey:kTSSmallImg];
    [mutableDict setValue:self.x forKey:kTSSmallX];
    [mutableDict setValue:self.h forKey:kTSSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kTSSmallY];
    self.w = [aDecoder decodeObjectForKey:kTSSmallW];
    self.img = [aDecoder decodeObjectForKey:kTSSmallImg];
    self.x = [aDecoder decodeObjectForKey:kTSSmallX];
    self.h = [aDecoder decodeObjectForKey:kTSSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kTSSmallY];
    [aCoder encodeObject:_w forKey:kTSSmallW];
    [aCoder encodeObject:_img forKey:kTSSmallImg];
    [aCoder encodeObject:_x forKey:kTSSmallX];
    [aCoder encodeObject:_h forKey:kTSSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    TSSmall *copy = [[TSSmall alloc] init];
    
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
