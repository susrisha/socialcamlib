//
//  SCAUtilities.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 23/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
/*! NSNotificationCenter name indicating that the active session is open */
extern NSString *const SocialCamdidLoginNotification;

/*! NSNotificationCenter name indicating that there is no longer an open active session */
extern NSString *const SocialCamdidLogOutNotification;

@class User;
@interface SCAUtilities : NSObject
+(BOOL)isLoggedIn;
+(NSString *)getAccessToken;
+(NSString*)getCurrentUserId;
+(User*)getCurrentUser;
+(NSString *)getAccessString;
+(void)notifyLoggedIn;
@end
