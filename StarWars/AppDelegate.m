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
    
    // Configuro aspecto de la app
    [self configureAppearance];
    
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

-(void) configureAppearance{
    UIColor *background =[UIColor colorWithRed:0
                                         green:0
                                          blue:0.01
                                         alpha:1];
    
    [[UINavigationBar appearance] setBarTintColor:background];
    
    [[[UITableViewHeaderFooterView appearance] contentView] setBackgroundColor:background];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.9
                                                         green:0.8
                                                          blue:0
                                                         alpha:1]}
     ];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}
@end
