//
//  ITEMSaleTypeMaps.h
//
//  Created by   on 15-3-8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITEMBig, ITEMSmall;

@interface ITEMSaleTypeMaps : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) ITEMBig *big;
@property (nonatomic, retain) ITEMSmall *small;
@property (nonatomic, assign) BOOL mark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
