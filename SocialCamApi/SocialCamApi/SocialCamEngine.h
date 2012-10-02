//
//  FBEngine.h
//  FBSave
//
//  Created by Naresh Devalapally on 08/08/12.
//  Copyright (c) 2012 Naresh Devalapally. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "User.h"
#import "SocialCamVideo.h"
@interface SocialCamEngine : MKNetworkEngine
typedef void (^SocialCamEngineVideosBlock)(NSMutableArray* videoObjects);
typedef void (^SocialCamEngineUser)(User* theUser);
typedef void (^SocialCamUsersArray)(NSMutableArray *userObjects);
typedef void (^SocialCamCommentsArray)(NSMutableArray *commentObjects);
typedef void (^SocialCamGenericDict)(NSDictionary *responseDict);
typedef void (^SocialCamVideoObj)(SocialCamVideo *videoObj);
+(SocialCamEngine *)sharedEngine;

-(void)videosForPath:(NSString *)path onCompletion:(SocialCamEngineVideosBlock)videosBlock onError:(MKNKErrorBlock) errorBlock;

-(void)userWithId:(NSString*)userId onCompletion:(SocialCamEngineUser)theUser onError:(MKNKErrorBlock)errorBlock;

-(void)likesForObjectId:(NSString*)videoId onCompletion:(SocialCamUsersArray)usersArray onError:(MKNKErrorBlock)errorBlock;

-(void)commentsForObjectId:(NSString*)videoId onCompletion:(SocialCamCommentsArray)theCommentsArray onError:(MKNKErrorBlock)errorBlock;

-(void)postCommentForVideo:(NSString*)videoId withText:(NSString*)commentText onCompletion:(SocialCamGenericDict)responseBlock onError:(MKNKErrorBlock)errorBlock;

-(void)userListforPath:(NSString*)apiPath onCompletion:(SocialCamUsersArray)usersArray onError:(MKNKErrorBlock)errorBlock;

-(void)videoWithId:(NSString*)videoId onCompletion:(SocialCamVideoObj)theVideoBlock onError:(MKNKErrorBlock)errorBlock;
@end
