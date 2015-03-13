//
//  ZYImages.m
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZYImages.h"


NSString *const kZYImagesDefaultThumb = @"default_thumb";
NSString *const kZYImagesCoverImage = @"cover_image";
NSString *const kZYImagesDefaultImage = @"default_image";


@interface ZYImages ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZYImages

@synthesize defaultThumb = _defaultThumb;
@synthesize coverImage = _coverImage;
@synthesize defaultImage = _defaultImage;


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
            self.defaultThumb = [self objectOrNilForKey:kZYImagesDefaultThumb fromDictionary:dict];
            self.coverImage = [self objectOrNilForKey:kZYImagesCoverImage fromDictionary:dict];
            self.defaultImage = [self objectOrNilForKey:kZYImagesDefaultImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.defaultThumb forKey:kZYImagesDefaultThumb];
    [mutableDict setValue:self.coverImage forKey:kZYImagesCoverImage];
    [mutableDict setValue:self.defaultImage forKey:kZYImagesDefaultImage];

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

    self.defaultThumb = [aDecoder decodeObjectForKey:kZYImagesDefaultThumb];
    self.coverImage = [aDecoder decodeObjectForKey:kZYImagesCoverImage];
    self.defaultImage = [aDecoder decodeObjectForKey:kZYImagesDefaultImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_defaultThumb forKey:kZYImagesDefaultThumb];
    [aCoder encodeObject:_coverImage forKey:kZYImagesCoverImage];
    [aCoder encodeObject:_defaultImage forKey:kZYImagesDefaultImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZYImages *copy = [[ZYImages alloc] init];
    
    if (copy) {

        copy.defaultThumb = [self.defaultThumb copyWithZone:zone];
        copy.coverImage = [self.coverImage copyWithZone:zone];
        copy.defaultImage = [self.defaultImage copyWithZone:zone];
    }
    
    return copy;
}


- (void)dealloc
{
    [_defaultThumb release];
    [_coverImage release];
    [_defaultImage release];
    [super dealloc];
}

@end
