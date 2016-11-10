//
//  NSObject+Repository.m
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

#import "Repository.h"
#import "dextraChallenge-Swift.h"

@implementation Repository: NSObject

-(id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    self.idRepo = [dictionary objectForKey:@"id"];
    self.name = [dictionary objectForKey:@"name"];
    self.fullname = [dictionary objectForKey:@"full_name"];
    self.info = [dictionary objectForKey:@"description"];
    self.url = [dictionary objectForKey:@"html_url"];
    self.language = [dictionary objectForKey:@"language"];
    self.contributorsUrl = [dictionary objectForKey:@"contributors_url"];
    self.forks = [dictionary objectForKey:@"forks_count"];
    self.startgazers = [dictionary objectForKey:@"stargazers_count"];
    self.owner = [[User alloc] initWithDictionary:[dictionary objectForKey:@"owner"]];
    
    
    if (self.language == (NSString *)[NSNull null]){
        self.language = nil;
    }
    
    if (self.info == (NSString *)[NSNull null]){
        self.info = nil;
    }
    
    return self;
}


@end
