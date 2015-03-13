//
//  CRBig.h
//
//  Created by zhiyou3g  on 15-3-7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CRBig : NSObject <NSCoding, NSCopying>

@property (nonatomic, retain) NSString *y;
@property (nonatomic, retain) NSString *w;
@property (nonatomic, retain) NSString *img;
@property (nonatomic, retain) NSString *x;
@property (nonatomic, retain) NSString *h;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
