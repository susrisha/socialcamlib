//
//  Comment.h
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject <NSCoding>

@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSString *internalBaseClassIdentifier;
@property (nonatomic, retain) NSString *message;
@property (nonatomic, assign) NSInteger created_at;

+ (Comment *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
-(NSString*)getFriendlyDate;
@end
