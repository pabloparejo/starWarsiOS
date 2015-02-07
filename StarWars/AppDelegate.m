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
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:[self arrayOfControllers] animated:YES];
    
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

#pragma mark - Utils
-(NSArray*) arrayOfModels{
    // Creo el modelo r2d2
    NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/r2d2"];
    NSBundle *bundle = [NSBundle mainBundle];
    NSData *r2d2Sound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"r2-d2"withExtension:@"caf"]];
    UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];
    PARStarWarsCharacter *r2d2 = [PARStarWarsCharacter
                                  starWarsCharacterWithAlias:@"R2D2"
                                  url:r2d2URL
                                  sound:r2d2Sound
                                  image:r2d2Image];
    
    
    // Creo el modelo chewbaca
    NSURL *chewiURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/chewbacca"];
    NSData *chewiSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"chewbacca"withExtension:@"caf"]];
    UIImage *chewiImage = [UIImage imageNamed:@"chewbacca.jpg"];
    PARStarWarsCharacter *chewi = [PARStarWarsCharacter
                                   starWarsCharacterWithAlias:@"chewbacca"
                                   url:chewiURL
                                   sound:chewiSound
                                   image:chewiImage];
    
    // Creo el modelo c3po
    NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/c3po"];
    NSData *c3poSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"c3po"withExtension:@"caf"]];
    UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
    PARStarWarsCharacter *c3po = [PARStarWarsCharacter
                                  starWarsCharacterWithAlias:@"C3PO"
                                  url:c3poURL
                                  sound:c3poSound
                                  image:c3poImage];


    // Creo el modelo vader
    NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/darth_vader"];
        NSData *vaderSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"vader"withExtension:@"caf"]];
    UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
    PARStarWarsCharacter *vader = [PARStarWarsCharacter
                                  starWarsCharacterWithName: @"Anakin Skywalker"
                                  alias:@"Vader"
                                  url:vaderURL
                                  sound:vaderSound
                                  image:vaderImage];
    
    // Modelo Tarkin
    NSURL *tarkinURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/tarkin"];
    NSData *tarkinSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"tarkin"withExtension:@"caf"]];
    UIImage *tarkinImage = [UIImage imageNamed:@"tarkin.jpg"];
    PARStarWarsCharacter *tarkin = [PARStarWarsCharacter
                                   starWarsCharacterWithName: @"Tarkin"
                                   alias:@"Grand Moff Tarkin"
                                   url:tarkinURL
                                   sound:tarkinSound
                                   image:tarkinImage];

    
    // Modelo palpatine
    NSURL *palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/palpatine"];
    NSData *palpatineSound = [NSData dataWithContentsOfURL:[bundle URLForResource:@"palpatine"withExtension:@"caf"]];
    UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
    PARStarWarsCharacter *palpatine = [PARStarWarsCharacter
                                    starWarsCharacterWithName: @"palpatine"
                                    alias:@"Darth Sidious"
                                    url:palpatineURL
                                    sound:palpatineSound
                                    image:palpatineImage];
    
    return @[vader, chewi, r2d2, c3po, tarkin, palpatine];
}

-(NSArray *) arrayOfControllers{
    
    NSArray *models = [self arrayOfModels];
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:models.count];
    
    for (PARStarWarsCharacter *model in models) {
        PARCharacterViewController *modelVC = [[PARCharacterViewController alloc] initWithModel:model];
        
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:modelVC];
        
        [controllers addObject:navVC];
    }
    
    return controllers;
}




@end
