//
//  NSObject+JSON.m
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 09/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

#import "JSON.h"
#import "User.h"
#import "Repository.h"

@implementation JSON: NSObject

+(void) parseUsersWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion {
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error == nil){
        NSArray *usersDictionary = [jsonDictionary objectForKey: @"items"];
        
        NSMutableArray *users = [[NSMutableArray alloc] init];
        for (id userDictionary in usersDictionary) {
            [users addObject: [[User alloc] initWithDictionary:userDictionary]];
        }
        
        completion(nil, users);
    } else {
        completion(error, nil);
    }
    
}

+(void) parseRepoWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion {
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error == nil){
        NSArray *repositoriesDictionary = [jsonDictionary objectForKey: @"items"];
        
        NSMutableArray *repositories = [[NSMutableArray alloc] init];
        for (id repositoryDictionary in repositoriesDictionary) {
            [repositories addObject: [[Repository alloc] initWithDictionary:repositoryDictionary]];
        }
        
        completion(nil, repositories);
    } else {
        completion(error, nil);
    }
}

+(void) parseUserReposWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *repositories)) completion {
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSArray *repositoriesDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error == nil){
        NSMutableArray *repositories = [[NSMutableArray alloc] init];
        for (id repositoryDictionary in repositoriesDictionary) {
            [repositories addObject: [[Repository alloc] initWithDictionary:repositoryDictionary]];
        }
        
        completion(nil, repositories);
    } else {
        completion(error, nil);
    }
}

+(void) parseReposContributorsWithURL: (NSString *) url completion: (void (^)(NSError *error, NSArray *users)) completion {
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSArray *usersDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error == nil){
        NSMutableArray *users = [[NSMutableArray alloc] init];
        for (id userDictionary in usersDictionary) {
            [users addObject: [[User alloc] initWithDictionary:userDictionary]];
        }
        
        completion(nil, users);
    } else {
        completion(error, nil);
    }
}


@end
