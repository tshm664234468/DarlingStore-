//
//  SortList.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SortList.h"
#import "SortExtra.h"


NSString *const kSortListId = @"id";
NSString *const kSortListExtra = @"extra";
NSString *const kSortListParentId = @"parent_id";
NSString *const kSortListLocId = @"loc_id";
NSString *const kSortListImageUrl = @"image_url";
NSString *const kSortListUrl = @"url";
NSString *const kSortListUkey = @"ukey";
NSString *const kSortListTitle = @"title";
NSString *const kSortListFileId = @"file_id";
NSString *const kSortListKey = @"key";
NSString *const kSortListUtype = @"utype";
NSString *const kSortListAlt = @"alt";
NSString *const kSortListSort = @"sort";
NSString *const kSortListStatus = @"status";


@interface SortList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SortList

@synthesize listIdentifier = _listIdentifier;
@synthesize extra = _extra;
@synthesize parentId = _parentId;
@synthesize locId = _locId;
@synthesize imageUrl = _imageUrl;
@synthesize url = _url;
@synthesize ukey = _ukey;
@synthesize title = _title;
@synthesize fileId = _fileId;
@synthesize key = _key;
@synthesize utype = _utype;
@synthesize alt = _alt;
@synthesize sort = _sort;
@synthesize status = _status;


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
            self.listIdentifier = [self objectOrNilForKey:kSortListId fromDictionary:dict];
            self.extra = [SortExtra modelObjectWithDictionary:[dict objectForKey:kSortListExtra]];
            self.parentId = [self objectOrNilForKey:kSortListParentId fromDictionary:dict];
            self.locId = [self objectOrNilForKey:kSortListLocId fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kSortListImageUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kSortListUrl fromDictionary:dict];
            self.ukey = [self objectOrNilForKey:kSortListUkey fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSortListTitle fromDictionary:dict];
            self.fileId = [self objectOrNilForKey:kSortListFileId fromDictionary:dict];
            self.key = [self objectOrNilForKey:kSortListKey fromDictionary:dict];
            self.utype = [self objectOrNilForKey:kSortListUtype fromDictionary:dict];
            self.alt = [self objectOrNilForKey:kSortListAlt fromDictionary:dict];
            self.sort = [self objectOrNilForKey:kSortListSort fromDictionary:dict];
            self.status = [self objectOrNilForKey:kSortListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kSortListId];
    [mutableDict setValue:[self.extra dictionaryRepresentation] forKey:kSortListExtra];
    [mutableDict setValue:self.parentId forKey:kSortListParentId];
    [mutableDict setValue:self.locId forKey:kSortListLocId];
    [mutableDict setValue:self.imageUrl forKey:kSortListImageUrl];
    [mutableDict setValue:self.url forKey:kSortListUrl];
    [mutableDict setValue:self.ukey forKey:kSortListUkey];
    [mutableDict setValue:self.title forKey:kSortListTitle];
    [mutableDict setValue:self.fileId forKey:kSortListFileId];
    [mutableDict setValue:self.key forKey:kSortListKey];
    [mutableDict setValue:self.utype forKey:kSortListUtype];
    [mutableDict setValue:self.alt forKey:kSortListAlt];
    [mutableDict setValue:self.sort forKey:kSortListSort];
    [mutableDict setValue:self.status forKey:kSortListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kSortListId];
    self.extra = [aDecoder decodeObjectForKey:kSortListExtra];
    self.parentId = [aDecoder decodeObjectForKey:kSortListParentId];
    self.locId = [aDecoder decodeObjectForKey:kSortListLocId];
    self.imageUrl = [aDecoder decodeObjectForKey:kSortListImageUrl];
    self.url = [aDecoder decodeObjectForKey:kSortListUrl];
    self.ukey = [aDecoder decodeObjectForKey:kSortListUkey];
    self.title = [aDecoder decodeObjectForKey:kSortListTitle];
    self.fileId = [aDecoder decodeObjectForKey:kSortListFileId];
    self.key = [aDecoder decodeObjectForKey:kSortListKey];
    self.utype = [aDecoder decodeObjectForKey:kSortListUtype];
    self.alt = [aDecoder decodeObjectForKey:kSortListAlt];
    self.sort = [aDecoder decodeObjectForKey:kSortListSort];
    self.status = [aDecoder decodeObjectForKey:kSortListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kSortListId];
    [aCoder encodeObject:_extra forKey:kSortListExtra];
    [aCoder encodeObject:_parentId forKey:kSortListParentId];
    [aCoder encodeObject:_locId forKey:kSortListLocId];
    [aCoder encodeObject:_imageUrl forKey:kSortListImageUrl];
    [aCoder encodeObject:_url forKey:kSortListUrl];
    [aCoder encodeObject:_ukey forKey:kSortListUkey];
    [aCoder encodeObject:_title forKey:kSortListTitle];
    [aCoder encodeObject:_fileId forKey:kSortListFileId];
    [aCoder encodeObject:_key forKey:kSortListKey];
    [aCoder encodeObject:_utype forKey:kSortListUtype];
    [aCoder encodeObject:_alt forKey:kSortListAlt];
    [aCoder encodeObject:_sort forKey:kSortListSort];
    [aCoder encodeObject:_status forKey:kSortListStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    SortList *copy = [[SortList alloc] init];
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.extra = [self.extra copyWithZone:zone];
        copy.parentId = [self.parentId copyWithZone:zone];
        copy.locId = [self.locId copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.ukey = [self.ukey copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.fileId = [self.fileId copyWithZone:zone];
        copy.key = [self.key copyWithZone:zone];
        copy.utype = [self.utype copyWithZone:zone];
        copy.alt = [self.alt copyWithZone:zone];
        copy.sort = [self.sort copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_listIdentifier release];
    [_extra release];
    [_parentId release];
    [_locId release];
    [_imageUrl release];
    [_url release];
    [_ukey release];
    [_title release];
    [_fileId release];
    [_key release];
    [_utype release];
    [_alt release];
    [_sort release];
    [_status release];
    [super dealloc];
}

@end
