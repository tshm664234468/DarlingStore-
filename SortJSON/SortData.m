//
//  SortData.m
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "SortData.h"
#import "SortExtra.h"
#import "SortList.h"


NSString *const kSortDataId = @"id";
NSString *const kSortDataExtra = @"extra";
NSString *const kSortDataParentId = @"parent_id";
NSString *const kSortDataLocId = @"loc_id";
NSString *const kSortDataImageUrl = @"image_url";
NSString *const kSortDataUrl = @"url";
NSString *const kSortDataUkey = @"ukey";
NSString *const kSortDataTitle = @"title";
NSString *const kSortDataFileId = @"file_id";
NSString *const kSortDataKey = @"key";
NSString *const kSortDataUtype = @"utype";
NSString *const kSortDataList = @"list";
NSString *const kSortDataAlt = @"alt";
NSString *const kSortDataSort = @"sort";
NSString *const kSortDataStatus = @"status";


@interface SortData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SortData

@synthesize dataIdentifier = _dataIdentifier;
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
@synthesize list = _list;
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
            self.dataIdentifier = [self objectOrNilForKey:kSortDataId fromDictionary:dict];
            self.extra = [SortExtra modelObjectWithDictionary:[dict objectForKey:kSortDataExtra]];
            self.parentId = [self objectOrNilForKey:kSortDataParentId fromDictionary:dict];
            self.locId = [self objectOrNilForKey:kSortDataLocId fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kSortDataImageUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kSortDataUrl fromDictionary:dict];
            self.ukey = [self objectOrNilForKey:kSortDataUkey fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSortDataTitle fromDictionary:dict];
            self.fileId = [self objectOrNilForKey:kSortDataFileId fromDictionary:dict];
            self.key = [self objectOrNilForKey:kSortDataKey fromDictionary:dict];
            self.utype = [self objectOrNilForKey:kSortDataUtype fromDictionary:dict];
    NSObject *receivedSortList = [dict objectForKey:kSortDataList];
    NSMutableArray *parsedSortList = [NSMutableArray array];
    if ([receivedSortList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSortList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSortList addObject:[SortList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSortList isKindOfClass:[NSDictionary class]]) {
       [parsedSortList addObject:[SortList modelObjectWithDictionary:(NSDictionary *)receivedSortList]];
    }

    self.list = [NSArray arrayWithArray:parsedSortList];
            self.alt = [self objectOrNilForKey:kSortDataAlt fromDictionary:dict];
            self.sort = [self objectOrNilForKey:kSortDataSort fromDictionary:dict];
            self.status = [self objectOrNilForKey:kSortDataStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kSortDataId];
    [mutableDict setValue:[self.extra dictionaryRepresentation] forKey:kSortDataExtra];
    [mutableDict setValue:self.parentId forKey:kSortDataParentId];
    [mutableDict setValue:self.locId forKey:kSortDataLocId];
    [mutableDict setValue:self.imageUrl forKey:kSortDataImageUrl];
    [mutableDict setValue:self.url forKey:kSortDataUrl];
    [mutableDict setValue:self.ukey forKey:kSortDataUkey];
    [mutableDict setValue:self.title forKey:kSortDataTitle];
    [mutableDict setValue:self.fileId forKey:kSortDataFileId];
    [mutableDict setValue:self.key forKey:kSortDataKey];
    [mutableDict setValue:self.utype forKey:kSortDataUtype];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kSortDataList];
    [mutableDict setValue:self.alt forKey:kSortDataAlt];
    [mutableDict setValue:self.sort forKey:kSortDataSort];
    [mutableDict setValue:self.status forKey:kSortDataStatus];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kSortDataId];
    self.extra = [aDecoder decodeObjectForKey:kSortDataExtra];
    self.parentId = [aDecoder decodeObjectForKey:kSortDataParentId];
    self.locId = [aDecoder decodeObjectForKey:kSortDataLocId];
    self.imageUrl = [aDecoder decodeObjectForKey:kSortDataImageUrl];
    self.url = [aDecoder decodeObjectForKey:kSortDataUrl];
    self.ukey = [aDecoder decodeObjectForKey:kSortDataUkey];
    self.title = [aDecoder decodeObjectForKey:kSortDataTitle];
    self.fileId = [aDecoder decodeObjectForKey:kSortDataFileId];
    self.key = [aDecoder decodeObjectForKey:kSortDataKey];
    self.utype = [aDecoder decodeObjectForKey:kSortDataUtype];
    self.list = [aDecoder decodeObjectForKey:kSortDataList];
    self.alt = [aDecoder decodeObjectForKey:kSortDataAlt];
    self.sort = [aDecoder decodeObjectForKey:kSortDataSort];
    self.status = [aDecoder decodeObjectForKey:kSortDataStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kSortDataId];
    [aCoder encodeObject:_extra forKey:kSortDataExtra];
    [aCoder encodeObject:_parentId forKey:kSortDataParentId];
    [aCoder encodeObject:_locId forKey:kSortDataLocId];
    [aCoder encodeObject:_imageUrl forKey:kSortDataImageUrl];
    [aCoder encodeObject:_url forKey:kSortDataUrl];
    [aCoder encodeObject:_ukey forKey:kSortDataUkey];
    [aCoder encodeObject:_title forKey:kSortDataTitle];
    [aCoder encodeObject:_fileId forKey:kSortDataFileId];
    [aCoder encodeObject:_key forKey:kSortDataKey];
    [aCoder encodeObject:_utype forKey:kSortDataUtype];
    [aCoder encodeObject:_list forKey:kSortDataList];
    [aCoder encodeObject:_alt forKey:kSortDataAlt];
    [aCoder encodeObject:_sort forKey:kSortDataSort];
    [aCoder encodeObject:_status forKey:kSortDataStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    SortData *copy = [[SortData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
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
        copy.list = [self.list copyWithZone:zone];
        copy.alt = [self.alt copyWithZone:zone];
        copy.sort = [self.sort copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_dataIdentifier release];
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
    [_list release];
    [_alt release];
    [_sort release];
    [_status release];
    [super dealloc];
}

@end
