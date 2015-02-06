//
//  PARCharacterViewController.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 6/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import UIKit;
#import "PARStarWarsCharacter.h"

@interface PARCharacterViewController : UIViewController

@property (nonatomic, strong) PARStarWarsCharacter *model;
@property (nonatomic, weak) IBOutlet UIImageView *photoView;


-(id) initWithModel:(PARStarWarsCharacter *) model;

@end
