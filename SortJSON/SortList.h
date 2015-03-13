//
//  SortList.h
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SortExtra;

@interface SortList : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *listIdentifier;
@property (nonatomic, retain) SortExtra *extra;
@property (nonatomic, retain) NSString *parentId;
@property (nonatomic, retain) NSString *locId;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *ukey;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *fileId;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *utype;
@property (nonatomic, retain) NSString *alt;
@property (nonatomic, retain) NSString *sort;
@property (nonatomic, retain) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
