//
//  NSObject+User.m
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

#import "User.h"

@implementation User: NSObject

-(id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    self.idUser = [dictionary objectForKey:@"id"];
    self.login = [dictionary objectForKey:@"login"];
    self.avatar = [dictionary objectForKey:@"avatar_url"];
    self.url = [dictionary objectForKey:@"html_url"];
    self.reposUrl = [dictionary objectForKey:@"repos_url"];
    self.score = [dictionary objectForKey:@"score"];
    
    return self;
}

@end
