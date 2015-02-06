//
//  AppDelegate.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 6/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "AppDelegate.h"
#import "PARCharacterViewController.h"
#import "PARStarWarsCharacter.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    
    // Creo el modelo
    NSURL *vaderURL = [NSURL URLWithString:@"http://google.com"];
    NSBundle *bundle = [NSBundle mainBundle];
    NSData *vaderSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"c3po"withExtension:@"caf"]];
    UIImage *vaderImage = [UIImage imageNamed:@"c3po.jpg"];
    PARStarWarsCharacter *c3po = [PARStarWarsCharacter starWarsCharacterWithName:@"Anakin Skywalker"
                                                                           alias:@"Darth Vader"
                                                                             url:vaderURL
                                                                           sound:vaderSound
                                                                           image:vaderImage];
    // Creo el controlador
    PARCharacterViewController *c3poVC = [[PARCharacterViewController alloc] initWithModel:c3po];
    
    // Muestro vista en pantalla
    [self.window setRootViewController:c3poVC];
    
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
