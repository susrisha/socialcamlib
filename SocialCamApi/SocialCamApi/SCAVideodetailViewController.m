//
//  SCAVideodetailViewController.m
//  SocialCamApi
//
//  Created by Naresh Devalapally on 02/10/12.
//  Copyright (c) 2012 Sukeerthi LLC Ltd. All rights reserved.
//

#import "SCAVideodetailViewController.h"
#import "SocialCamEngine.h"
#import "LoadingIndicator.h"

@interface SCAVideodetailViewController ()

@end

@implementation SCAVideodetailViewController

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
    // Do any additional setup after loading the view from its nib.
    self.title = self.videoId;
    [[LoadingIndicator currentIndicator]displayActivity:@"Loading.."];
    [[SocialCamEngine sharedEngine]videoWithId:self.videoId onCompletion:^(SocialCamVideo *videoObj) {
        [[LoadingIndicator currentIndicator]hide];
        videoNameLabel.text = videoObj.title;
        commentsLabel.text = [NSString stringWithFormat:@"%d comments",videoObj.comments];
        likesLabel.text = [NSString stringWithFormat:@"%d likes ",videoObj.likes];
        [videoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:videoObj.embed_url]]];
        videoUrlLabel.text = videoObj.link;
        ownerLabel.text = videoObj.user.name;
    } onError:^(NSError *error) {
         [[LoadingIndicator currentIndicator]hide];
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    videoWebView = nil;
    videoNameLabel = nil;
    likesLabel = nil;
    commentsLabel = nil;
    videoUrlLabel = nil;
    ownerLabel = nil;
    [super viewDidUnload];
}
@end
