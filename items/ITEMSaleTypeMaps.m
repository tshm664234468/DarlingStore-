//
//  ITEMSaleTypeMaps.m
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ITEMSaleTypeMaps.h"
#import "ITEMBig.h"
#import "ITEMSmall.h"


NSString *const kITEMSaleTypeMapsTitle = @"title";
NSString *const kITEMSaleTypeMapsKey = @"key";
NSString *const kITEMSaleTypeMapsBig = @"big";
NSString *const kITEMSaleTypeMapsSmall = @"small";
NSString *const kITEMSaleTypeMapsMark = @"mark";


@interface ITEMSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITEMSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kITEMSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kITEMSaleTypeMapsKey fromDictionary:dict];
            self.big = [ITEMBig modelObjectWithDictionary:[dict objectForKey:kITEMSaleTypeMapsBig]];
            self.small = [ITEMSmall modelObjectWithDictionary:[dict objectForKey:kITEMSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kITEMSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kITEMSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kITEMSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kITEMSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kITEMSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kITEMSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kITEMSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kITEMSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kITEMSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kITEMSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kITEMSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kITEMSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kITEMSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kITEMSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kITEMSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kITEMSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITEMSaleTypeMaps *copy = [[ITEMSaleTypeMaps alloc] init];
    
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
