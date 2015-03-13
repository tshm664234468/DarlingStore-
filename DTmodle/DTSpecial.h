//
//  DTSpecial.h
//
//  Created by   on 15-3-11
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DTSpecial : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *txt;
@property (nonatomic, retain) NSArray *list;
@property (nonatomic, retain) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
