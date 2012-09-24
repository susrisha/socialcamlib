//
//  MainThumb.h
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MainThumb : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger width;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, assign) NSInteger height;

+ (MainThumb *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
