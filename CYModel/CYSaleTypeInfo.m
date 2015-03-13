//
//  CYSaleTypeInfo.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CYSaleTypeInfo.h"
#import "CYBig.h"
#import "CYSmall.h"


NSString *const kCYSaleTypeInfoTitle = @"title";
NSString *const kCYSaleTypeInfoKey = @"key";
NSString *const kCYSaleTypeInfoBig = @"big";
NSString *const kCYSaleTypeInfoSmall = @"small";
NSString *const kCYSaleTypeInfoMark = @"mark";


@interface CYSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CYSaleTypeInfo

@synthesize title = _title;
@synthesize key = _key;
@synthesize big = _big;
@synthesize small = _small;
@synthesize mark = _mark;


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
            self.title = [self objectOrNilForKey:kCYSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kCYSaleTypeInfoKey fromDictionary:dict];
            self.big = [CYBig modelObjectWithDictionary:[dict objectForKey:kCYSaleTypeInfoBig]];
            self.small = [CYSmall modelObjectWithDictionary:[dict objectForKey:kCYSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kCYSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kCYSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kCYSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kCYSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kCYSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kCYSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kCYSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kCYSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kCYSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kCYSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kCYSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kCYSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kCYSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kCYSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kCYSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kCYSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    CYSaleTypeInfo *copy = [[CYSaleTypeInfo alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.key = [self.key copyWithZone:zone];
        copy.big = [self.big copyWithZone:zone];
        copy.small = [self.small copyWithZone:zone];
        copy.mark = self.mark;
    }
    
    return copy;
}


- (void)dealloc
{
    [_title release];
    [_key release];
    [_big release];
    [_small release];
    [super dealloc];
}

@end
