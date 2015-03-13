//
//  QQSaleTypeMaps.h
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QQBig, QQSmall;

@interface QQSaleTypeMaps : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) QQBig *big;
@property (nonatomic, retain) QQSmall *small;
@property (nonatomic, assign) BOOL mark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
