//
//  ZYSaleTypeMaps.h
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZYBig, ZYSmall;

@interface ZYSaleTypeMaps : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) ZYBig *big;
@property (nonatomic, retain) ZYSmall *small;
@property (nonatomic, assign) BOOL mark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
