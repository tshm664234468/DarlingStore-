//
//  QQData.h
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface QQData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pages;
@property (nonatomic, assign) double count;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, assign) BOOL next;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
