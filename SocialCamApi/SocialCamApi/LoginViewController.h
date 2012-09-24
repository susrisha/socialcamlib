//
//  LoginViewController.h
//  instasave(HD)
//
//  Created by Self Devalapally on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginDelegate <NSObject>

-(void)didFinishLoggingIn;
-(void)didFailToLogIn;

@end

@interface LoginViewController : UIViewController<UIWebViewDelegate>
{
    
    IBOutlet UIWebView *loginWebView;
    //id<LoginDelegate> delegate;
}
- (IBAction)cancelTapped:(id)sender;
//@property(nonatomic, assign)id<LoginDelegate>delegate;
@end
