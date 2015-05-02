//
//  PARStarWarsUniverseViewController.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import UIKit;
#import "PARStarWarsUniverse.h"

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

#define CHARACTER_DID_CHANGE_NOTIFICATION @"characterDidChange"
#define CHARACTER_KEY @"character"


@class PARStarWarsUniverseViewController;

@protocol PARStarWarsUniverseViewControllerDelegate <NSObject>

@optional
-(void)starWarsUniverseViewController: (PARStarWarsUniverseViewController *)vc
                   didSelectCharacter: (PARStarWarsCharacter *) character;

@end


@interface PARStarWarsUniverseViewController : UITableViewController <PARStarWarsUniverseViewControllerDelegate>

@property (weak, nonatomic) id<PARStarWarsUniverseViewControllerDelegate> delegate;

-(id) initWithModel:(PARStarWarsUniverse *) model
              style:(UITableViewStyle) style;
@end


