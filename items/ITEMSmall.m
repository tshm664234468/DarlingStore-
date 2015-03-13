//
//  ITEMSmall.m
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ITEMSmall.h"


NSString *const kITEMSmallY = @"y";
NSString *const kITEMSmallW = @"w";
NSString *const kITEMSmallImg = @"img";
NSString *const kITEMSmallX = @"x";
NSString *const kITEMSmallH = @"h";


@interface ITEMSmall ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITEMSmall

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
            self.y = [self objectOrNilForKey:kITEMSmallY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kITEMSmallW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kITEMSmallImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kITEMSmallX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kITEMSmallH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kITEMSmallY];
    [mutableDict setValue:self.w forKey:kITEMSmallW];
    [mutableDict setValue:self.img forKey:kITEMSmallImg];
    [mutableDict setValue:self.x forKey:kITEMSmallX];
    [mutableDict setValue:self.h forKey:kITEMSmallH];

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

    self.y = [aDecoder decodeObjectForKey:kITEMSmallY];
    self.w = [aDecoder decodeObjectForKey:kITEMSmallW];
    self.img = [aDecoder decodeObjectForKey:kITEMSmallImg];
    self.x = [aDecoder decodeObjectForKey:kITEMSmallX];
    self.h = [aDecoder decodeObjectForKey:kITEMSmallH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kITEMSmallY];
    [aCoder encodeObject:_w forKey:kITEMSmallW];
    [aCoder encodeObject:_img forKey:kITEMSmallImg];
    [aCoder encodeObject:_x forKey:kITEMSmallX];
    [aCoder encodeObject:_h forKey:kITEMSmallH];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITEMSmall *copy = [[ITEMSmall alloc] init];
    
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
