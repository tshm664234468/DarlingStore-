//
//  ITEMBig.m
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ITEMBig.h"


NSString *const kITEMBigY = @"y";
NSString *const kITEMBigW = @"w";
NSString *const kITEMBigImg = @"img";
NSString *const kITEMBigX = @"x";
NSString *const kITEMBigH = @"h";


@interface ITEMBig ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITEMBig

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
            self.y = [self objectOrNilForKey:kITEMBigY fromDictionary:dict];
            self.w = [self objectOrNilForKey:kITEMBigW fromDictionary:dict];
            self.img = [self objectOrNilForKey:kITEMBigImg fromDictionary:dict];
            self.x = [self objectOrNilForKey:kITEMBigX fromDictionary:dict];
            self.h = [self objectOrNilForKey:kITEMBigH fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.y forKey:kITEMBigY];
    [mutableDict setValue:self.w forKey:kITEMBigW];
    [mutableDict setValue:self.img forKey:kITEMBigImg];
    [mutableDict setValue:self.x forKey:kITEMBigX];
    [mutableDict setValue:self.h forKey:kITEMBigH];

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

    self.y = [aDecoder decodeObjectForKey:kITEMBigY];
    self.w = [aDecoder decodeObjectForKey:kITEMBigW];
    self.img = [aDecoder decodeObjectForKey:kITEMBigImg];
    self.x = [aDecoder decodeObjectForKey:kITEMBigX];
    self.h = [aDecoder decodeObjectForKey:kITEMBigH];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_y forKey:kITEMBigY];
    [aCoder encodeObject:_w forKey:kITEMBigW];
    [aCoder encodeObject:_img forKey:kITEMBigImg];
    [aCoder encodeObject:_x forKey:kITEMBigX];
    [aCoder encodeObject:_h forKey:kITEMBigH];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITEMBig *copy = [[ITEMBig alloc] init];
    
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
