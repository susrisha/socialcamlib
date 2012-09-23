//
//  User.m
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import "User.h"
#import "Counts.h"

@implementation User

@synthesize picture_180 = _picture_180;
@synthesize userIdentifier = _userIdentifier;
@synthesize picture = _picture;
@synthesize link = _link;
@synthesize name = _name;
@synthesize bio = _bio;
@synthesize counts = _counts;

+ (User *)modelObjectWithDictionary:(NSDictionary *)dict
{
    User *instance = [[User alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.picture_180 = [dict objectForKey:@"picture_180"];
            self.counts = [Counts modelObjectWithDictionary:[dict objectForKey:@"counts"]];
            self.userIdentifier = [dict objectForKey:@"id"];
            self.picture = [dict objectForKey:@"picture"]==[NSNull null]?@"":[dict objectForKey:@"picture"];
            self.link = [dict objectForKey:@"link"];
            self.name = [dict objectForKey:@"name"];
            self.bio = [dict objectForKey:@"bio"]==[NSNull null]?@"":[dict objectForKey:@"bio"];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.picture_180 = [aDecoder decodeObjectForKey:@"picture_180"];
    self.userIdentifier = [aDecoder decodeObjectForKey:@"userIdentifier"];
    self.picture = [aDecoder decodeObjectForKey:@"picture"];
    self.link = [aDecoder decodeObjectForKey:@"link"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.bio = [aDecoder decodeObjectForKey:@"bio"];
    self.counts = [aDecoder decodeObjectForKey:@"counts"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picture_180 forKey:@"picture_180"];
    [aCoder encodeObject:_userIdentifier forKey:@"userIdentifier"];
    [aCoder encodeObject:_counts forKey:@"counts"];
    [aCoder encodeObject:_picture forKey:@"picture"];
    [aCoder encodeObject:_link forKey:@"link"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_bio forKey:@"bio"];
}

/*
- (void)dealloc
{
    [_picture_180 release];
    [_userIdentifier release];
    [_picture release];
    [_link release];
    [_name release];
    [_bio release];
    [super dealloc];
}
*/
@end
