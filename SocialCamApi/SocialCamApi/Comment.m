//
//  Comment.m
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import "Comment.h"
#import "User.h"


@implementation Comment

@synthesize user = _user;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize message = _message;
@synthesize created_at = _created_at;


+ (Comment *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Comment *instance = [[Comment alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.user = [User modelObjectWithDictionary:[dict objectForKey:@"user"]];
            self.internalBaseClassIdentifier = [dict objectForKey:@"id"];
            self.message = [dict objectForKey:@"message"];
            self.created_at = [[dict objectForKey:@"created_at"] intValue];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.user = [aDecoder decodeObjectForKey:@"user"];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:@"internalBaseClassIdentifier"];
    self.message = [aDecoder decodeObjectForKey:@"message"];
    self.created_at = [aDecoder decodeIntegerForKey:@"created_at"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_user forKey:@"user"];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:@"internalBaseClassIdentifier"];
    [aCoder encodeObject:_message forKey:@"message"];
    [aCoder encodeInteger:_created_at forKey:@"created_at"];
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
    [_user release];
    [_internalBaseClassIdentifier release];
    [_message release];
    [super dealloc];
}
*/
@end
