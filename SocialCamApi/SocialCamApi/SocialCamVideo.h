//
//  SocialCamVideo.h
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import <Foundation/Foundation.h>

@class SmallThumb, MainThumb, User;

@interface SocialCamVideo : NSObject <NSCoding>

@property (nonatomic, retain) NSString *internalBaseClassIdentifier;
@property (nonatomic, assign) NSInteger comments;
@property (nonatomic, assign) NSInteger created_at;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, assign) NSInteger likes;
@property (nonatomic, assign) double length;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *tags;
@property (nonatomic, retain) SmallThumb *small_thumb;
@property (nonatomic, retain) NSString *embed_html;
@property (nonatomic, retain) NSArray *people_tagged;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, retain) MainThumb *main_thumb;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSString *embed_url;

+ (SocialCamVideo *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
-(NSString*)getFriendlyDate;
@end
