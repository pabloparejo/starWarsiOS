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
#import "PARWikiViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Creo el modelo
    NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/r2d2"];
    NSBundle *bundle = [NSBundle mainBundle];
    NSData *vaderSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"r2-d2"withExtension:@"caf"]];
    UIImage *vaderImage = [UIImage imageNamed:@"R2-D2.jpg"];
    PARStarWarsCharacter *c3po = [PARStarWarsCharacter starWarsCharacterWithAlias:@"R2D2"                                                                           url:vaderURL                                                                           sound:vaderSound                                                                           image:vaderImage];
    // Creo el controlador
    PARCharacterViewController *c3poVC = [[PARCharacterViewController alloc] initWithModel:c3po];
    
    PARWikiViewController *wikiVC = [[PARWikiViewController alloc] initWithModel:c3po];
    
    // Creo el combinador
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:@[c3poVC, wikiVC] animated:YES];
    
    // Muestro vista en pantalla
    [self.window setRootViewController:tabVC];
    
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
