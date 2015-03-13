//
//  ITEMData.h
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ITEMData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pages;
@property (nonatomic, assign) double count;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, assign) BOOL next;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
