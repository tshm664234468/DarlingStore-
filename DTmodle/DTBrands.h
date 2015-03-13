//
//  DTBrands.h
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DTBrands : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *imageUrl;
@property (nonatomic, retain) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
