//
//  SortExtra.h
//
//  Created by zhiyou3g  on 15/3/6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SortExtra : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *extraIdentifier;
@property (nonatomic, retain) NSString *tags;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *brandId;
@property (nonatomic, retain) NSString *saleType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
