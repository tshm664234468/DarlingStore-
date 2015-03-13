//
//  List.m
//
//  Created by   on 15-3-6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "List.h"


NSString *const kListBrief = @"brief";
NSString *const kListId = @"id";
NSString *const kListKinds = @"kinds";
NSString *const kListTitle = @"title";
NSString *const kListType = @"type";
NSString *const kListCover = @"cover";
NSString *const kListUrl = @"url";


@interface List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation List

@synthesize brief = _brief;
@synthesize listIdentifier = _listIdentifier;
@synthesize kinds = _kinds;
@synthesize title = _title;
@synthesize type = _type;
@synthesize cover = _cover;
@synthesize url = _url;


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
            self.brief = [self objectOrNilForKey:kListBrief fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kListId fromDictionary:dict];
            self.kinds = [self objectOrNilForKey:kListKinds fromDictionary:dict];
            self.title = [self objectOrNilForKey:kListTitle fromDictionary:dict];
            self.type = [self objectOrNilForKey:kListType fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kListCover fromDictionary:dict];
            self.url = [self objectOrNilForKey:kListUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brief forKey:kListBrief];
    [mutableDict setValue:self.listIdentifier forKey:kListId];
    [mutableDict setValue:self.kinds forKey:kListKinds];
    [mutableDict setValue:self.title forKey:kListTitle];
    [mutableDict setValue:self.type forKey:kListType];
    [mutableDict setValue:self.cover forKey:kListCover];
    [mutableDict setValue:self.url forKey:kListUrl];

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

    self.brief = [aDecoder decodeObjectForKey:kListBrief];
    self.listIdentifier = [aDecoder decodeObjectForKey:kListId];
    self.kinds = [aDecoder decodeObjectForKey:kListKinds];
    self.title = [aDecoder decodeObjectForKey:kListTitle];
    self.type = [aDecoder decodeObjectForKey:kListType];
    self.cover = [aDecoder decodeObjectForKey:kListCover];
    self.url = [aDecoder decodeObjectForKey:kListUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brief forKey:kListBrief];
    [aCoder encodeObject:_listIdentifier forKey:kListId];
    [aCoder encodeObject:_kinds forKey:kListKinds];
    [aCoder encodeObject:_title forKey:kListTitle];
    [aCoder encodeObject:_type forKey:kListType];
    [aCoder encodeObject:_cover forKey:kListCover];
    [aCoder encodeObject:_url forKey:kListUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    List *copy = [[List alloc] init];
    
    if (copy) {

        copy.brief = [self.brief copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.kinds = [self.kinds copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_brief release];
    [_listIdentifier release];
    [_kinds release];
    [_title release];
    [_type release];
    [_cover release];
    [_url release];
    [super dealloc];
}

@end
