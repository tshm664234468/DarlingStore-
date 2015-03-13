//
//  GXSaleTypeInfo.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GXSaleTypeInfo.h"
#import "GXBig.h"
#import "GXSmall.h"


NSString *const kGXSaleTypeInfoTitle = @"title";
NSString *const kGXSaleTypeInfoKey = @"key";
NSString *const kGXSaleTypeInfoBig = @"big";
NSString *const kGXSaleTypeInfoSmall = @"small";
NSString *const kGXSaleTypeInfoMark = @"mark";


@interface GXSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GXSaleTypeInfo

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
            self.title = [self objectOrNilForKey:kGXSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kGXSaleTypeInfoKey fromDictionary:dict];
            self.big = [GXBig modelObjectWithDictionary:[dict objectForKey:kGXSaleTypeInfoBig]];
            self.small = [GXSmall modelObjectWithDictionary:[dict objectForKey:kGXSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kGXSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kGXSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kGXSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kGXSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kGXSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kGXSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kGXSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kGXSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kGXSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kGXSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kGXSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kGXSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kGXSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kGXSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kGXSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kGXSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    GXSaleTypeInfo *copy = [[GXSaleTypeInfo alloc] init];
    
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
