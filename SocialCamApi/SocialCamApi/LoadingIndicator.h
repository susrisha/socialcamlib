//
//  LoadingIndicator.h
//  instasave(HD)
//
//  Created by Self Devalapally on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingIndicator : UIView
{
	UILabel *centerMessageLabel;
	UILabel *subMessageLabel;
    
	UIActivityIndicatorView *spinner;
}

@property (nonatomic, retain) UILabel *centerMessageLabel;
@property (nonatomic, retain) UILabel *subMessageLabel;

@property (nonatomic, retain) UIActivityIndicatorView *spinner;


+ (LoadingIndicator *)currentIndicator;

- (void)show;
- (void)hideAfterDelay;
- (void)hide;
- (void)persist;
- (void)hidden;
- (void)displayActivity:(NSString *)m;
- (void)displayCompleted:(NSString *)m;
- (void)setCenterMessage:(NSString *)message;
- (void)setSubMessage:(NSString *)message;
- (void)showSpinner;
- (void)hideSpinner;
- (void)setProperRotation;
- (void)setProperRotation:(BOOL)animated;



@end
