//
//  SCAUserProfileViewController.h
//  SocialCamApi
//
//  Created by Naresh Devalapally on 23/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCADetailViewController.h"
#import "NetworkImageView.h"
#import "User.h"
@interface SCAUserProfileViewController : SCADetailViewController
{
    
    __weak IBOutlet UITextField *userIdField;
    __weak IBOutlet UILabel *mediaCountLabel;
    __weak IBOutlet UILabel *followingCount;
    __weak IBOutlet UILabel *followsCount;
    __weak IBOutlet UILabel *bioLabel;
    __weak IBOutlet UILabel *linkLabel;
    __weak IBOutlet UILabel *usernameLabel;
    __weak IBOutlet NetworkImageView *userPictureView;
}
- (IBAction)changeUserId:(id)sender;

@property(nonatomic,strong)NSString *userIdentifier;

@end
