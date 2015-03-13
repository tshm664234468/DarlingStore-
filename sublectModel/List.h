//
//  List.h
//
//  Created by   on 15-3-6
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface List : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *brief;
@property (nonatomic, retain) NSString *listIdentifier;
@property (nonatomic, retain) NSString *kinds;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *cover;
@property (nonatomic, retain) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
