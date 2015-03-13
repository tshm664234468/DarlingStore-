//
//  BZRPSaleTypeInfo.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRPSaleTypeInfo.h"
#import "BZRPBig.h"
#import "BZRPSmall.h"


NSString *const kBZRPSaleTypeInfoTitle = @"title";
NSString *const kBZRPSaleTypeInfoKey = @"key";
NSString *const kBZRPSaleTypeInfoBig = @"big";
NSString *const kBZRPSaleTypeInfoSmall = @"small";
NSString *const kBZRPSaleTypeInfoMark = @"mark";


@interface BZRPSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRPSaleTypeInfo

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
            self.title = [self objectOrNilForKey:kBZRPSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kBZRPSaleTypeInfoKey fromDictionary:dict];
            self.big = [BZRPBig modelObjectWithDictionary:[dict objectForKey:kBZRPSaleTypeInfoBig]];
            self.small = [BZRPSmall modelObjectWithDictionary:[dict objectForKey:kBZRPSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kBZRPSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kBZRPSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kBZRPSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kBZRPSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kBZRPSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kBZRPSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kBZRPSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kBZRPSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kBZRPSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kBZRPSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kBZRPSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kBZRPSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kBZRPSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kBZRPSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kBZRPSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kBZRPSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRPSaleTypeInfo *copy = [[BZRPSaleTypeInfo alloc] init];
    
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
