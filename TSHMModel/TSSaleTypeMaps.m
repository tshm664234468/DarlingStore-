//
//  TSSaleTypeMaps.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TSSaleTypeMaps.h"
#import "TSBig.h"
#import "TSSmall.h"


NSString *const kTSSaleTypeMapsTitle = @"title";
NSString *const kTSSaleTypeMapsKey = @"key";
NSString *const kTSSaleTypeMapsBig = @"big";
NSString *const kTSSaleTypeMapsSmall = @"small";
NSString *const kTSSaleTypeMapsMark = @"mark";


@interface TSSaleTypeMaps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TSSaleTypeMaps

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
            self.title = [self objectOrNilForKey:kTSSaleTypeMapsTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kTSSaleTypeMapsKey fromDictionary:dict];
            self.big = [TSBig modelObjectWithDictionary:[dict objectForKey:kTSSaleTypeMapsBig]];
            self.small = [TSSmall modelObjectWithDictionary:[dict objectForKey:kTSSaleTypeMapsSmall]];
            self.mark = [[self objectOrNilForKey:kTSSaleTypeMapsMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kTSSaleTypeMapsTitle];
    [mutableDict setValue:self.key forKey:kTSSaleTypeMapsKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kTSSaleTypeMapsBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kTSSaleTypeMapsSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kTSSaleTypeMapsMark];

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

    self.title = [aDecoder decodeObjectForKey:kTSSaleTypeMapsTitle];
    self.key = [aDecoder decodeObjectForKey:kTSSaleTypeMapsKey];
    self.big = [aDecoder decodeObjectForKey:kTSSaleTypeMapsBig];
    self.small = [aDecoder decodeObjectForKey:kTSSaleTypeMapsSmall];
    self.mark = [aDecoder decodeBoolForKey:kTSSaleTypeMapsMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kTSSaleTypeMapsTitle];
    [aCoder encodeObject:_key forKey:kTSSaleTypeMapsKey];
    [aCoder encodeObject:_big forKey:kTSSaleTypeMapsBig];
    [aCoder encodeObject:_small forKey:kTSSaleTypeMapsSmall];
    [aCoder encodeBool:_mark forKey:kTSSaleTypeMapsMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    TSSaleTypeMaps *copy = [[TSSaleTypeMaps alloc] init];
    
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
