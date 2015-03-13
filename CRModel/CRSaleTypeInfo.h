//
//  CRSaleTypeInfo.h
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CRBig, CRSmall;

@interface CRSaleTypeInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) CRBig *big;
@property (nonatomic, retain) CRSmall *small;
@property (nonatomic, assign) BOOL mark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
