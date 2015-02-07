//
//  PARCharacterViewController.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 6/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import UIKit;
#import "PARStarWarsCharacter.h"
#import "CafPlayer.h"
#import "PARWikiViewController.h"

@interface PARCharacterViewController : UIViewController

@property (nonatomic, strong) PARStarWarsCharacter *model;
@property (nonatomic, weak) IBOutlet UIImageView *photoView;
@property (nonatomic, strong) CafPlayer *player;

-(id) initWithModel:(PARStarWarsCharacter *) model;

-(IBAction)playSound:(id)sender;
- (IBAction)displayWikipedia:(id)sender;

@end
