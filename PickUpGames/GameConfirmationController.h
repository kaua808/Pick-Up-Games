//
//  GameConfirmationController.h
//  PickUpGames
//
//  Created by Kaleo Kim on 7/9/15.
//  Copyright (c) 2015 Kaleo Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "UserProfilePicController.h"

@class GameConfirmation;

@interface GameConfirmationController : NSObject

@property (strong, nonatomic) NSArray *gamesUserIsGoingTo;
@property (strong, nonatomic) NSMutableArray *usersGoingToGame;

+ (GameConfirmationController *)sharedInstance;

- (void)createConfirmationToGame:(Game *)game user:(PFUser *)user withCompletion:(void (^)(BOOL success))completion;
- (void)gamesGoingTo:(PFUser *)user withCompletion:(void (^)(BOOL success))completion;
- (void)usersGoingToGame:(Game *)game withCompletion:(void (^)(BOOL success))completion;
- (void)deleteGameConfirmation:(GameConfirmation *)game;

@end
