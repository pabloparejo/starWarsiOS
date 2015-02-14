//
//  AppDelegate.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 6/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "AppDelegate.h"
#import "PARStarWarsUniverseViewController.h"
#import "UIViewController+Combinators.h"
#import "PARCharacterViewController.h"
#import "settings.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Defatult settings value
    [self setDefaultLastCharacter];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Creo el modelo
    PARStarWarsUniverse *model = [PARStarWarsUniverse new];
    
    // UserInterface Idiom
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        // IPAD
        [self configureForiPadWithModel:model];
    }else{
        [self configureForiPhoneWithModel:model];
    }
    

    
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

#pragma mark - App Configuration
-(void) configureForiPadWithModel:model{
    // Creo los controladores
    PARStarWarsUniverseViewController *universeVC = [[PARStarWarsUniverseViewController alloc] initWithModel:model style:UITableViewStylePlain];
    
    PARCharacterViewController *charVC = [[PARCharacterViewController alloc]
                                          initWithModel:[self lastCharacterSelectedInModel:model]];
    
    // Creo el combinador
    UISplitViewController *splitVC = [UISplitViewController new];
    splitVC.viewControllers = @[[universeVC wrappedInNavigationController],
                                [charVC wrappedInNavigationController]];
    
    // Asigno delegados
    splitVC.delegate = charVC;
    universeVC.delegate = charVC;
    
    // Muestro vista en pantalla
    [self.window setRootViewController:splitVC];
}

-(void) configureForiPhoneWithModel:model{
    // Creo los controladores
    PARStarWarsUniverseViewController *universeVC = [[PARStarWarsUniverseViewController alloc] initWithModel:model style:UITableViewStylePlain];

    universeVC.delegate = universeVC;
    
    UINavigationController *navVC = [universeVC wrappedInNavigationController];


    
    // Muestro vista en pantalla
    [self.window setRootViewController:navVC];
}

#pragma mark - User Defaults
-(void) setDefaultLastCharacter{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    if (![def objectForKey:LAST_SELECTED_CHARACTER_KEY]) {
        // User has open the app for the first time
        
        [def setObject:@[@0,@0] forKey:LAST_SELECTED_CHARACTER_KEY];
        [def synchronize];
    }
}
                                          
-(PARStarWarsCharacter *) lastCharacterSelectedInModel: (PARStarWarsUniverse *)model{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSArray *coords = [def objectForKey:LAST_SELECTED_CHARACTER_KEY];
    NSUInteger section = [[coords objectAtIndex:0] integerValue];
    NSUInteger row = [[coords objectAtIndex:1] integerValue];
    PARStarWarsCharacter *character;
    if (section == IMPERIAL_SECTION) {
        character = [model imperialAtIndex:row];
    }else{
        character = [model rebelAtIndex:row];
    }
    
    return character;
}
@end
