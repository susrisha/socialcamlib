//
//  NetworkImageView.h
//  FlickrTest
//
//  Created by Naresh Devalapally on 07/08/12.
//  Copyright (c) 2012 Naresh Devalapally. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKNetworkEngine.h"
@interface NetworkImageView : UIImageView
-(void)setImageUrl:(NSURL*)imageUrl;
@property(nonatomic) MKNetworkOperation *imageLoadingOperation;
@end
