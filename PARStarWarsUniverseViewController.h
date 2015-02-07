//
//  PARStarWarsUniverseViewController.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import UIKit;
#import "PARStarWarsUniverse.h"
#import "PARCharacterViewController.h"

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 0

@interface PARStarWarsUniverseViewController : UITableViewController

-(id) initWithModel:(PARStarWarsUniverse *) model
              style:(UITableViewStyle) style;

@end
