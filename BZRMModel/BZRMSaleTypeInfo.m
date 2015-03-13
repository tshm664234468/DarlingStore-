//
//  BZRMSaleTypeInfo.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "BZRMSaleTypeInfo.h"
#import "BZRMBig.h"
#import "BZRMSmall.h"


NSString *const kBZRMSaleTypeInfoTitle = @"title";
NSString *const kBZRMSaleTypeInfoKey = @"key";
NSString *const kBZRMSaleTypeInfoBig = @"big";
NSString *const kBZRMSaleTypeInfoSmall = @"small";
NSString *const kBZRMSaleTypeInfoMark = @"mark";


@interface BZRMSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BZRMSaleTypeInfo

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
            self.title = [self objectOrNilForKey:kBZRMSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kBZRMSaleTypeInfoKey fromDictionary:dict];
            self.big = [BZRMBig modelObjectWithDictionary:[dict objectForKey:kBZRMSaleTypeInfoBig]];
            self.small = [BZRMSmall modelObjectWithDictionary:[dict objectForKey:kBZRMSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kBZRMSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kBZRMSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kBZRMSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kBZRMSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kBZRMSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kBZRMSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kBZRMSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kBZRMSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kBZRMSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kBZRMSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kBZRMSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kBZRMSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kBZRMSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kBZRMSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kBZRMSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kBZRMSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    BZRMSaleTypeInfo *copy = [[BZRMSaleTypeInfo alloc] init];
    
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
