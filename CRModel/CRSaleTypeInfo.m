//
//  CRSaleTypeInfo.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CRSaleTypeInfo.h"
#import "CRBig.h"
#import "CRSmall.h"


NSString *const kCRSaleTypeInfoTitle = @"title";
NSString *const kCRSaleTypeInfoKey = @"key";
NSString *const kCRSaleTypeInfoBig = @"big";
NSString *const kCRSaleTypeInfoSmall = @"small";
NSString *const kCRSaleTypeInfoMark = @"mark";


@interface CRSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CRSaleTypeInfo

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
            self.title = [self objectOrNilForKey:kCRSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kCRSaleTypeInfoKey fromDictionary:dict];
            self.big = [CRBig modelObjectWithDictionary:[dict objectForKey:kCRSaleTypeInfoBig]];
            self.small = [CRSmall modelObjectWithDictionary:[dict objectForKey:kCRSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kCRSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kCRSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kCRSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kCRSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kCRSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kCRSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kCRSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kCRSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kCRSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kCRSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kCRSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kCRSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kCRSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kCRSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kCRSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kCRSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    CRSaleTypeInfo *copy = [[CRSaleTypeInfo alloc] init];
    
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
