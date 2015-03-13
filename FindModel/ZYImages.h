//
//  ZYImages.h
//
//  Created by   on 15-3-5
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZYImages : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *defaultThumb;
@property (nonatomic, retain) NSString *coverImage;
@property (nonatomic, retain) NSString *defaultImage;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
