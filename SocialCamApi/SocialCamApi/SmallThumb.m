//
//  SmallThumb.m
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import "SmallThumb.h"


@implementation SmallThumb

@synthesize width = _width;
@synthesize url = _url;
@synthesize height = _height;


+ (SmallThumb *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SmallThumb *instance = [[SmallThumb alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.width = [[dict objectForKey:@"width"] intValue];
            self.url = [dict objectForKey:@"url"];
            self.height = [[dict objectForKey:@"height"] intValue];

    }
    
    return self;
    
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.width = [aDecoder decodeIntegerForKey:@"width"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.height = [aDecoder decodeIntegerForKey:@"height"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeInteger:_width forKey:@"width"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeInteger:_height forKey:@"height"];
}

/*
- (void)dealloc
{
    [_url release];
    [super dealloc];
}
*/
@end
