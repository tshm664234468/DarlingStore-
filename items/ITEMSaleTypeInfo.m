//
//  ITEMSaleTypeInfo.m
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ITEMSaleTypeInfo.h"
#import "ITEMBig.h"
#import "ITEMSmall.h"


NSString *const kITEMSaleTypeInfoTitle = @"title";
NSString *const kITEMSaleTypeInfoKey = @"key";
NSString *const kITEMSaleTypeInfoBig = @"big";
NSString *const kITEMSaleTypeInfoSmall = @"small";
NSString *const kITEMSaleTypeInfoMark = @"mark";


@interface ITEMSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITEMSaleTypeInfo

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
            self.title = [self objectOrNilForKey:kITEMSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kITEMSaleTypeInfoKey fromDictionary:dict];
            self.big = [ITEMBig modelObjectWithDictionary:[dict objectForKey:kITEMSaleTypeInfoBig]];
            self.small = [ITEMSmall modelObjectWithDictionary:[dict objectForKey:kITEMSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kITEMSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kITEMSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kITEMSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kITEMSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kITEMSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kITEMSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kITEMSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kITEMSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kITEMSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kITEMSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kITEMSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kITEMSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kITEMSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kITEMSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kITEMSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kITEMSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITEMSaleTypeInfo *copy = [[ITEMSaleTypeInfo alloc] init];
    
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
