//
//  TSSaleTypeInfo.m
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "TSSaleTypeInfo.h"
#import "TSBig.h"
#import "TSSmall.h"


NSString *const kTSSaleTypeInfoTitle = @"title";
NSString *const kTSSaleTypeInfoKey = @"key";
NSString *const kTSSaleTypeInfoBig = @"big";
NSString *const kTSSaleTypeInfoSmall = @"small";
NSString *const kTSSaleTypeInfoMark = @"mark";


@interface TSSaleTypeInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TSSaleTypeInfo

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
            self.title = [self objectOrNilForKey:kTSSaleTypeInfoTitle fromDictionary:dict];
            self.key = [self objectOrNilForKey:kTSSaleTypeInfoKey fromDictionary:dict];
            self.big = [TSBig modelObjectWithDictionary:[dict objectForKey:kTSSaleTypeInfoBig]];
            self.small = [TSSmall modelObjectWithDictionary:[dict objectForKey:kTSSaleTypeInfoSmall]];
            self.mark = [[self objectOrNilForKey:kTSSaleTypeInfoMark fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kTSSaleTypeInfoTitle];
    [mutableDict setValue:self.key forKey:kTSSaleTypeInfoKey];
    [mutableDict setValue:[self.big dictionaryRepresentation] forKey:kTSSaleTypeInfoBig];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kTSSaleTypeInfoSmall];
    [mutableDict setValue:[NSNumber numberWithBool:self.mark] forKey:kTSSaleTypeInfoMark];

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

    self.title = [aDecoder decodeObjectForKey:kTSSaleTypeInfoTitle];
    self.key = [aDecoder decodeObjectForKey:kTSSaleTypeInfoKey];
    self.big = [aDecoder decodeObjectForKey:kTSSaleTypeInfoBig];
    self.small = [aDecoder decodeObjectForKey:kTSSaleTypeInfoSmall];
    self.mark = [aDecoder decodeBoolForKey:kTSSaleTypeInfoMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kTSSaleTypeInfoTitle];
    [aCoder encodeObject:_key forKey:kTSSaleTypeInfoKey];
    [aCoder encodeObject:_big forKey:kTSSaleTypeInfoBig];
    [aCoder encodeObject:_small forKey:kTSSaleTypeInfoSmall];
    [aCoder encodeBool:_mark forKey:kTSSaleTypeInfoMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    TSSaleTypeInfo *copy = [[TSSaleTypeInfo alloc] init];
    
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
