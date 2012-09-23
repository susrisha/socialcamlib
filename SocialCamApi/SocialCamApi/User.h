//
//  User.h
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import <Foundation/Foundation.h>

@class Counts;



@interface User : NSObject <NSCoding>

@property (nonatomic, retain) NSString *picture_180;
@property (nonatomic, retain) NSString *userIdentifier;
@property (nonatomic, retain) NSString *picture;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *bio;
@property (nonatomic, retain) Counts *counts;

+ (User *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
