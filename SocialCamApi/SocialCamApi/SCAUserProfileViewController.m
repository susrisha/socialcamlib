//
//  SCAUserProfileViewController.m
//  SocialCamApi
//
//  Created by Naresh Devalapally on 23/09/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCAUserProfileViewController.h"
#import "LoadingIndicator.h"
#import "SocialCamEngine.h"
#import "Counts.h"
@interface SCAUserProfileViewController ()
@property (nonatomic,strong)User *currentUser;

@end

@implementation SCAUserProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    userPictureView.clipsToBounds = NO;
    // Do any additional setup after loading the view from its nib.
    // Have to configure the view..
    [[LoadingIndicator currentIndicator]displayActivity:@"Loading.."];
    [[SocialCamEngine sharedEngine]userWithId:self.userIdentifier onCompletion:^(User *userFull) {
        self.currentUser = userFull;
        NSLog(@"User details bio %@ and link %@",self.currentUser.bio,self.currentUser.link);
        [[LoadingIndicator currentIndicator]hide];
        [self reconfigureView];
    } onError:^(NSError *error) {
        
    } ];
    
}
-(void)reconfigureView
{
    usernameLabel.text = self.currentUser.name;
    linkLabel.text = self.currentUser.link;
    bioLabel.text = self.currentUser.bio;
    [userPictureView setImageUrl:[NSURL URLWithString:self.currentUser.picture_180]];
    followingCount.text =[NSString stringWithFormat:@"%d", self.currentUser.counts.followers];
    followsCount.text =[NSString stringWithFormat:@"%d", self.currentUser.counts.following];
    mediaCountLabel.text = [NSString stringWithFormat:@"%d", self.currentUser.counts.public_videos];
    userIdField.text = self.currentUser.userIdentifier;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    NSLog(@"Configuring detail view....");
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
//    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
//    self.masterPopoverController = nil;
}

- (void)viewDidUnload {
    userPictureView = nil;
    usernameLabel = nil;
    linkLabel = nil;
    bioLabel = nil;
    followsCount = nil;
    followingCount = nil;
    mediaCountLabel = nil;
    userIdField = nil;
    [super viewDidUnload];
}
- (IBAction)changeUserId:(id)sender {
}
@end
