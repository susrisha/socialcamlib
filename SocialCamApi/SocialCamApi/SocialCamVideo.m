//
//  SocialCamVideo.m
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import "SocialCamVideo.h"
#import "SmallThumb.h"
#import "PeopleTagged.h"
#import "MainThumb.h"
#import "User.h"


@implementation SocialCamVideo

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize comments = _comments;
@synthesize created_at = _created_at;
@synthesize width = _width;
@synthesize link = _link;
@synthesize likes = _likes;
@synthesize length = _length;
@synthesize title = _title;
@synthesize tags = _tags;
@synthesize small_thumb = _small_thumb;
@synthesize embed_html = _embed_html;
@synthesize people_tagged = _people_tagged;
@synthesize height = _height;
@synthesize main_thumb = _main_thumb;
@synthesize user = _user;
@synthesize embed_url = _embed_url;


+ (SocialCamVideo *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SocialCamVideo *instance = [[SocialCamVideo alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [dict objectForKey:@"id"];
            self.comments = [[dict objectForKey:@"comments"] intValue];
            self.created_at = [[dict objectForKey:@"created_at"] intValue];
            self.width = [[dict objectForKey:@"width"] intValue];
            self.link = [dict objectForKey:@"link"];
            self.likes = [[dict objectForKey:@"likes"] intValue];
            self.length = [[dict objectForKey:@"length"] doubleValue];
            self.title = [dict objectForKey:@"title"];
            self.tags = [dict objectForKey:@"tags"];
            self.small_thumb = [SmallThumb modelObjectWithDictionary:[dict objectForKey:@"small_thumb"]];
            self.embed_html = [dict objectForKey:@"embed_html"];
    NSObject *receivedPeopleTagged = [dict objectForKey:@"people_tagged"];
    NSMutableArray *parsedPeopleTagged = [NSMutableArray array];
    if ([receivedPeopleTagged isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPeopleTagged) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPeopleTagged addObject:[PeopleTagged modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPeopleTagged isKindOfClass:[NSDictionary class]]) {
       [parsedPeopleTagged addObject:[PeopleTagged modelObjectWithDictionary:(NSDictionary *)receivedPeopleTagged]];
    }

    self.people_tagged = [NSArray arrayWithArray:parsedPeopleTagged];
            self.height = [[dict objectForKey:@"height"] intValue];
            self.main_thumb = [MainThumb modelObjectWithDictionary:[dict objectForKey:@"main_thumb"]];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:@"user"]];
            self.embed_url = [dict objectForKey:@"embed_url"];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:@"internalBaseClassIdentifier"];
    self.comments = [aDecoder decodeIntegerForKey:@"comments"];
    self.created_at = [aDecoder decodeIntegerForKey:@"created_at"];
    self.width = [aDecoder decodeIntegerForKey:@"width"];
    self.link = [aDecoder decodeObjectForKey:@"link"];
    self.likes = [aDecoder decodeIntegerForKey:@"likes"];
    self.length = [aDecoder decodeDoubleForKey:@"length"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.tags = [aDecoder decodeObjectForKey:@"tags"];
    self.small_thumb = [aDecoder decodeObjectForKey:@"small_thumb"];
    self.embed_html = [aDecoder decodeObjectForKey:@"embed_html"];
    self.people_tagged = [aDecoder decodeObjectForKey:@"people_tagged"];
    self.height = [aDecoder decodeIntegerForKey:@"height"];
    self.main_thumb = [aDecoder decodeObjectForKey:@"main_thumb"];
    self.user = [aDecoder decodeObjectForKey:@"user"];
    self.embed_url = [aDecoder decodeObjectForKey:@"embed_url"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:@"internalBaseClassIdentifier"];
    [aCoder encodeInteger:_comments forKey:@"comments"];
    [aCoder encodeInteger:_created_at forKey:@"created_at"];
    [aCoder encodeInteger:_width forKey:@"width"];
    [aCoder encodeObject:_link forKey:@"link"];
    [aCoder encodeInteger:_likes forKey:@"likes"];
    [aCoder encodeDouble:_length forKey:@"length"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_tags forKey:@"tags"];
    [aCoder encodeObject:_small_thumb forKey:@"small_thumb"];
    [aCoder encodeObject:_embed_html forKey:@"embed_html"];
    [aCoder encodeObject:_people_tagged forKey:@"people_tagged"];
    [aCoder encodeInteger:_height forKey:@"height"];
    [aCoder encodeObject:_main_thumb forKey:@"main_thumb"];
    [aCoder encodeObject:_user forKey:@"user"];
    [aCoder encodeObject:_embed_url forKey:@"embed_url"];
}
-(NSString*)getFriendlyDate
{
    // Date formatter please.
    //yyyy-MM-dd'T'HH:mm:ss+SSSS
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
    [dateFormatter setTimeZone:localZone];
    NSDate *createdDate = [NSDate dateWithTimeIntervalSince1970:self.created_at];;//[dateFormatter dateFromString:self.created_at];
    NSLog(@"%d date converted to %@",self.created_at,createdDate);
    NSTimeInterval timeDifference = [[NSDate date] timeIntervalSinceDate:createdDate]; 
    int minutes =(int) timeDifference/60;
	if (minutes ==0) {
		return [NSString stringWithFormat:@"< 1m ago"];
	}
	if (minutes > 0 && minutes < 60) {
		return [NSString stringWithFormat:@"%d m ago",minutes];
	}
	int hours = minutes/60;
	if(hours<24)
	{
		return [NSString stringWithFormat:@"%d hrs ago",minutes/60];
	}
	int days = hours/24;
    if (days == 1) {
        return [NSString stringWithFormat:@"yesterday"];
    }
    int weeks = days/7;
    if (days>7 && days<30) {
        return [NSString stringWithFormat:@"%d weeks ago",weeks];
    }
    int months = weeks/4;
    if (months>1 &months<12) {
        return [NSString stringWithFormat:@"%d months ago",months];
    }
    
    NSDateFormatter *returnFormatter = [[NSDateFormatter alloc]init];
    [returnFormatter setDateStyle:NSDateFormatterMediumStyle];
    
	return [returnFormatter stringFromDate:createdDate];//[NSString stringWithFormat:@"%d days ago",days];
}

/*
- (void)dealloc
{
    [_internalBaseClassIdentifier release];
    [_link release];
    [_title release];
    [_tags release];
    [_small_thumb release];
    [_embed_html release];
    [_people_tagged release];
    [_main_thumb release];
    [_user release];
    [_embed_url release];
    [super dealloc];
}
*/
@end
