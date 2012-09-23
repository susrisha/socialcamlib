//
//  NetworkImageView.m
//  FlickrTest
//
//  Created by Naresh Devalapally on 07/08/12.
//  Copyright (c) 2012 Naresh Devalapally. All rights reserved.
//

#import "NetworkImageView.h"
#import <QuartzCore/QuartzCore.h>
#import "SocialCamEngine.h"
@implementation NetworkImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.contentMode=UIViewContentModeScaleAspectFit;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 1);
        self.layer.shadowOpacity = 5.0;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)setImageUrl:(NSURL *)imageUrl
{
    
    self.imageLoadingOperation = [[SocialCamEngine sharedEngine]imageAtURL:imageUrl
                                                           onCompletion:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                                                               if (isInCache) {
                                                                   self.image = fetchedImage;
                                                               }
                                                               else{
                                                               CATransition *animation = [CATransition animation];
                                                               animation.type = kCATransitionFade;
                                                               animation.duration = 0.4;
                                                               [self.layer addAnimation:animation forKey:nil];
                                                              
                                                               self.image = fetchedImage;
                                                              
                                                               }
                                                               //self.image = fetchedImage;
                                                               
                                                           }
                                  ];
}
@end
