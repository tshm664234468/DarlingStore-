//
//  DTBrand.h
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DTBrand : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *accreditLogo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
