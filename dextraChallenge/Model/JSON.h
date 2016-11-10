//
//  NSObject+JSON.h
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 09/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class Repositoy;

@interface JSON: NSObject

+(void) parseUsersWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion;
+(void) parseRepoWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion;
+(void) parseUserReposWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *repositories)) completion;
+(void) parseReposContributorsWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion;

@end
