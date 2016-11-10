//
//  NSObject+Repository.h
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Repository: NSObject

@property(nonatomic, readwrite) NSNumber* idRepo;
@property(nonatomic, readwrite) NSString* name;
@property(nonatomic, readwrite) NSString* fullname;
@property(nonatomic, readwrite) NSString* info;
@property(nonatomic, readwrite) NSString* url;
@property(nonatomic, readwrite) NSString* language;
@property(nonatomic, readwrite) NSString* contributorsUrl;
@property(nonatomic, readwrite) NSNumber* forks;
@property(nonatomic, readwrite) NSNumber* startgazers;
@property(nonatomic, readwrite) NSNumber* score;
@property(nonatomic, readwrite) User* owner;

-(id) initWithDictionary: (NSDictionary *) dictionary;

@end
