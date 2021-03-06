//
//  AppDelegate.m
//  PickUpGames
//
//  Created by Kaleo Kim on 6/11/15.
//  Copyright (c) 2015 Kaleo Kim. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "Group.h"
#import "Game.h"
#import "GameConfirmation.h"
#import "UserProfilePic.h"
#import "UserProfilePicController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"o2joyxD78tdFPAfj6fsDtj0KHvhR4vHz7Vxnsj4n"
                  clientKey:@"1Rcv6sOZzWzYwap1M8O327SUdVqB9qvTj4c8Ug9v"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    //  Registering Parse classes
    [Group registerSubclass];
    [Game registerSubclass];
    [GameConfirmation registerSubclass];
    [UserProfilePic registerSubclass];
   
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
