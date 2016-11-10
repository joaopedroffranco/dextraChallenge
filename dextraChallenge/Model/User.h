//
//  NSObject+User.h
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User: NSObject

@property(nonatomic, readwrite) NSNumber* idUser;
@property(nonatomic, readwrite) NSString* login;
@property(nonatomic, readwrite) NSString* avatar;
@property(nonatomic, readwrite) NSString* url;
@property(nonatomic, readwrite) NSString* reposUrl;
@property(nonatomic, readwrite) NSNumber* score;

-(id) initWithDictionary: (NSDictionary *) dictionary;

@end
