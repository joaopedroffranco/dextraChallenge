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

/** Parse a json file and convert to array of Users. This method is asynchronous
 @params URL string
 @return error, users
 */
+(void) parseUsersWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion;

/** Parse a json file and convert to array of Repositories. This method is asynchronous
 @params URL string
 @return error, repositores
 */
+(void) parseRepoWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion;

/** Parse a json file and convert to array of contributors, i.e, Users. This method is asynchronous
 @params URL string
 @return error, users
 */
+(void) parseUserReposWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *repositories)) completion;

/** Parse a json file and convert to array of Repositories. This method is asynchronous
 @params URL string
 @return error, repositores
 */
+(void) parseReposContributorsWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion;

@end
