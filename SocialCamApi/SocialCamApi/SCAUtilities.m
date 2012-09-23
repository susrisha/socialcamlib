//
//  SCAUtilities.m
//  SocialCamApi
//
//  Created by Naresh Devalapally on 23/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCAUtilities.h"
#import "SCAConfig.h"
NSString *const SocialCamdidLoginNotification = @"com.socialcam.sdk:loggedIn";
NSString *const SocialCamdidLogOutNotification = @"com.socialcam.sdk:loggedOut";

@implementation SCAUtilities
+(BOOL)isLoggedIn
{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    NSString *access_token=[def valueForKey:@"access_token"];
    if (access_token==nil)
    {
        return NO;
    }
    return YES;
}
+(NSString *)getAccessToken
{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    NSString *access_token=[def valueForKey:@"access_token"];
    if (access_token==nil)
    {
        
        return @"";
        
    }
    else {
        return [def valueForKey:@"access_token"];
    }
}

+(NSString *)getAccessString
{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    NSString *access_token=[def valueForKey:@"access_token"];
    if (access_token==nil)
    {
        NSString *accesString = [NSString stringWithFormat:@"client_id=%@",[SCAConfig getApplicationId]];
        return accesString;
    }
    else {
        return [NSString stringWithFormat:@"access_token=%@",[def valueForKey:@"access_token"]];
    }
    
}

+(User*)getCurrentUser
{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    User *currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:[def objectForKey:@"loggedInUser"]];
    
    return currentUser;
}

// fires up a notification that the user is logged in.
+(void)notifyLoggedIn
{
     [[NSNotificationCenter defaultCenter]postNotificationName:SocialCamdidLoginNotification object:nil];
}

+(void)checkForAccessToken:(NSString *)urlString {
    
    if ([urlString rangeOfString:@"access_token="].location != NSNotFound) {
        NSLog(@"url string is %@",urlString);
        NSString *accessToken =
        [[urlString componentsSeparatedByString:@"="] lastObject];
        NSLog(@"----------------%@------------------",accessToken);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:accessToken forKey:@"access_token"];
        [defaults synchronize];
        
    }
}


+(NSString*)getCurrentUserId
{
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    NSString *theUserId = [def objectForKey:@"user_id"];
    return theUserId;
}


@end
