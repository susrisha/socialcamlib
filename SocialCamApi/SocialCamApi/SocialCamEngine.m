//
//  FBEngine.m
//  FBSave
//
//  Created by Naresh Devalapally on 08/08/12.
//  Copyright (c) 2012 Naresh Devalapally. All rights reserved.
//

#import "SocialCamEngine.h"
#import "SocialCamVideo.h"
#import "Comment.h"
#import "SCAUtilities.h"
@implementation SocialCamEngine
SocialCamEngine *_sharedObj;
+(SocialCamEngine *)sharedEngine
{
    if(_sharedObj==nil)
    {
        //_sharedObj =
        NSLog(@"XXXXXXXXXXXXXXXXXXXXXXXXXXX");
        _sharedObj = [[SocialCamEngine alloc] initWithHostName:@"api.socialcam.com/v1/" customHeaderFields:nil];
        
        
        [_sharedObj useCache];
        
    }
    return _sharedObj;
}

-(void)videosForPath:(NSString *)path  onCompletion:(SocialCamEngineVideosBlock)videosBlock onError:(MKNKErrorBlock) errorBlock
{
    NSString *actualPath = [NSString stringWithFormat:@"%@?access_token=%@&limit=50",path,[SCAUtilities getAccessToken]];
    MKNetworkOperation *op = [self operationWithPath:actualPath];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
         
        NSDictionary *response = [completedOperation responseJSON];
        NSMutableArray *responseArray = [[NSMutableArray alloc]init];//[response objectForKey:@"data"];
//        if([completedOperation isCachedResponse] && [path rangeOfString:@"self"].location!=NSNotFound)
//        {
//            NSLog(@"Self videos so not getting..");
//        }
//        else {
//            
//        }
        for (NSDictionary *oneDict in [response objectForKey:@"data"]) {
            SocialCamVideo *oneVideo = [[SocialCamVideo alloc]initWithDictionary:oneDict];
            [responseArray addObject:oneVideo];
        }
        
        videosBlock(responseArray);
        
    } onError:^(NSError *error) {
        
        errorBlock(error);
    }];
    
    //[op setFreezable:NO];
    if([op isCachedResponse])
    {
       // NSLog(@"sifo dgsuifbuksd gfuidsgfusdf;sdghofi;sdhsgsdg uodshgoisnigo;shdioghsdighuo h sgusddsbog; hiosgh");
    }
    [self enqueueOperation:op forceReload:YES];
}

-(void)likesForObjectId:(NSString*)videoId onCompletion:(SocialCamUsersArray)usersArray onError:(MKNKErrorBlock)errorBlock
{
    NSString *path = [NSString stringWithFormat:@"videos/%@/likes?access_token=%@&limit=50",videoId,[SCAUtilities getAccessToken]];
    MKNetworkOperation *op = [self operationWithPath:path];
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [[completedOperation responseJSON]objectForKey:@"data"];
        NSMutableArray *responseArray = [[NSMutableArray alloc]init];
        for (NSDictionary *oneDict in response) {
            NSLog(@"oneDict %@",oneDict);
            User *oneVideo = [[User alloc]initWithDictionary:[oneDict objectForKey:@"user"]];
            [responseArray addObject:oneVideo];
        }
        usersArray(responseArray);
    } onError:^(NSError *error) {
        errorBlock(error);
        
    }];
    [self enqueueOperation:op forceReload:YES];
}

-(void)userWithId:(NSString*)userId onCompletion:(SocialCamEngineUser)theUser onError:(MKNKErrorBlock)errorBlock
{
    NSString *path = [NSString stringWithFormat:@"users/%@?access_token=%@",userId,[SCAUtilities getAccessToken]];
    MKNetworkOperation *op = [self operationWithPath:path];
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [[completedOperation responseJSON]objectForKey:@"data"];
        User *responseUser = [[User alloc]initWithDictionary:response];
        theUser(responseUser);
    } onError:^(NSError *error) {
        errorBlock(error);
        
    }];
    [self enqueueOperation:op];
    
}

-(void)commentsForObjectId:(NSString*)videoId onCompletion:(SocialCamCommentsArray)theCommentsArray onError:(MKNKErrorBlock)errorBlock
{
    NSString *path = [NSString stringWithFormat:@"videos/%@/comments?access_token=%@",videoId,[SCAUtilities getAccessToken]];
    MKNetworkOperation *op = [self operationWithPath:path ];
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [[completedOperation responseJSON]objectForKey:@"data"];
        NSMutableArray *responseArray = [[NSMutableArray alloc]init];
        for (NSDictionary *oneDict in response) {
            Comment *oneComment = [[Comment alloc]initWithDictionary:oneDict];
            [responseArray addObject:oneComment];
        }
        theCommentsArray(responseArray);
    } onError:^(NSError *error) {
        errorBlock(error);
        
    }];
     [self enqueueOperation:op forceReload:YES];
    
}

-(void)userListforPath:(NSString*)apiPath onCompletion:(SocialCamUsersArray)usersArray onError:(MKNKErrorBlock)errorBlock
{
    NSString *path = [NSString stringWithFormat:@"%@?access_token=%@&limit=50",apiPath,[SCAUtilities getAccessToken]];
    MKNetworkOperation *op = [self operationWithPath:path params:nil httpMethod:@"GET" ssl:YES];
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [[completedOperation responseJSON]objectForKey:@"data"];
        NSMutableArray *responseArray = [[NSMutableArray alloc]init];
        for (NSDictionary *oneDict in response) {
          //  NSLog(@"oneDict %@",oneDict);
            User *oneVideo = [[User alloc]initWithDictionary:oneDict];
            [responseArray addObject:oneVideo];
        }
        usersArray(responseArray);
    } onError:^(NSError *error) {
        errorBlock(error);
        
    }];
    [self enqueueOperation:op forceReload:YES];
    
}



-(void)postCommentForVideo:(NSString*)videoId withText:(NSString*)commentText onCompletion:(SocialCamGenericDict)responseBlock onError:(MKNKErrorBlock)errorBlock
{
    NSString *path = [NSString stringWithFormat:@"videos/%@/comments?access_token=%@&text=%@",videoId,[SCAUtilities getAccessToken],commentText];
    
    MKNetworkOperation *op = [self operationWithPath:path params:nil httpMethod:@"POST"];
    [op onCompletion:^(MKNetworkOperation *completedOperation) {
        NSDictionary *response = [[completedOperation responseJSON]objectForKey:@"data"];
        responseBlock(response);
    } onError:^(NSError *error) {
        errorBlock(error);
        
    }];
    [self enqueueOperation:op];
}
-(NSString*) cacheDirectoryName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:@"SocialCamApi"];
    return cacheDirectoryName;
}

@end
