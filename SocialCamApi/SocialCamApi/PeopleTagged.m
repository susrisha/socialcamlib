//
//  PeopleTagged.m
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import "PeopleTagged.h"


@implementation PeopleTagged

@synthesize peopleTaggedIdentifier = _peopleTaggedIdentifier;
@synthesize name = _name;
@synthesize picture = _picture;


+ (PeopleTagged *)modelObjectWithDictionary:(NSDictionary *)dict
{
    PeopleTagged *instance = [[PeopleTagged alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.peopleTaggedIdentifier = [dict objectForKey:@"id"];
            self.name = [dict objectForKey:@"name"];
            self.picture = [dict objectForKey:@"picture"];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.peopleTaggedIdentifier = [aDecoder decodeObjectForKey:@"peopleTaggedIdentifier"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.picture = [aDecoder decodeObjectForKey:@"picture"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_peopleTaggedIdentifier forKey:@"peopleTaggedIdentifier"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_picture forKey:@"picture"];
}

/*
- (void)dealloc
{
    [_peopleTaggedIdentifier release];
    [_name release];
    [_picture release];
    [super dealloc];
}*/

@end
