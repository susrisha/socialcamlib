//
//  LoginViewController.m
//  instasave(HD)
//
//  Created by Self Devalapally on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
//#import "LoadingIndicator.h"
#import "SocialCamEngine.h"
#import "SCAUtilities.h"
#import "SCAConfig.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
//@synthesize delegate;

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
    
    // Put up the login window..
    self.title = NSLocalizedString(@"Login", nil);
    NSString *urlString=[NSString stringWithFormat:@"https://socialcam.com/oauth/authorize?app_id=%@&redirect_uri=%@&response_type=token&permissions=manage_likes,manage_comments",[SCAConfig getApplicationId],[SCAConfig getRedirectUrl]];
    
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    loginWebView.scalesPageToFit = YES;
    [loginWebView setDelegate:self];
    [loginWebView loadRequest:req];
}

- (void)viewDidUnload
{
        [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *urlString = request.URL.absoluteString;
   // [[LoadingIndicator currentIndicator]displayActivity:@"Loading..."];
    [self checkForAccessToken:urlString];
    return TRUE;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error %@",[error localizedDescription]);
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
  //  [[LoadingIndicator currentIndicator]hide];
}

-(void)checkForAccessToken:(NSString *)urlString {
    
    if ([urlString rangeOfString:@"access_token="].location != NSNotFound) {
        NSLog(@"url string is %@",urlString);
        NSString *accessToken =
        [[urlString componentsSeparatedByString:@"="] lastObject];
        NSLog(@"----------------%@------------------",accessToken);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; 
        [defaults setObject:accessToken forKey:@"access_token"]; 
        [defaults synchronize];
        [self checkForUserID];
        
        [loginWebView stopLoading];
      //  [[LoadingIndicator currentIndicator]hide];
        [self dismissModalViewControllerAnimated:YES];
       // [web removeFromSuperview];
        
        //[web release];
        
    }    
}

-(void)checkForUserID{
   
    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
  // Make an ASI request here.
   [ [SocialCamEngine sharedEngine]userWithId:@"self" onCompletion:^(User *theUser) {
       NSLog(@"Logged in user name %@",theUser.name);
        NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:theUser];
       [def setObject:myEncodedObject forKey:@"loggedInUser"];
       [def synchronize];
      // [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:SocialCamdidLoginNotification object:nil]];
       [[NSNotificationCenter defaultCenter]postNotificationName:SocialCamdidLoginNotification object:nil];
    } onError:^(NSError *error) {
        NSLog(@"Could not retrieve user information");
    } ];
    
    
   // [[LoadingIndicator currentIndicator]setSubMessage:NSLocalizedString(@"Loading..",nil)];
    //[[LoadingIndicator currentIndicator]show];
    //[[LoadingIndicator currentIndicator]showSpinner];
    
}


- (IBAction)cancelTapped:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
