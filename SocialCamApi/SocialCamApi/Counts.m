//
//  Counts.m
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import "Counts.h"


@implementation Counts

@synthesize followers = _followers;
@synthesize following = _following;
@synthesize public_videos = _public_videos;


+ (Counts *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Counts *instance = [[Counts alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.followers = [[dict objectForKey:@"followers"] intValue];
            self.following = [[dict objectForKey:@"following"] intValue];
            self.public_videos = [[dict objectForKey:@"public_videos"] intValue];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.followers = [aDecoder decodeIntegerForKey:@"followers"];
    self.following = [aDecoder decodeIntegerForKey:@"following"];
    self.public_videos = [aDecoder decodeIntegerForKey:@"public_videos"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInteger:_followers forKey:@"followers"];
    [aCoder encodeInteger:_following forKey:@"following"];
    [aCoder encodeInteger:_public_videos forKey:@"public_videos"];
}

/*
- (void)dealloc
{
    [super dealloc];
}
*/
@end
