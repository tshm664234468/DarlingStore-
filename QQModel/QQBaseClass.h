//
//  QQBaseClass.h
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QQData;

@interface QQBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double status;
@property (nonatomic, retain) QQData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
