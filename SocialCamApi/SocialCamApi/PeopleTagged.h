//
//  PeopleTagged.h
//
//  Created by (null) (null) on 12/09/12
//  Copyright (c) 2012 (null). All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PeopleTagged : NSObject <NSCoding>

@property (nonatomic, retain) NSString *peopleTaggedIdentifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *picture;

+ (PeopleTagged *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
