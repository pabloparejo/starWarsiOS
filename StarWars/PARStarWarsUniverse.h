//
//  PARStarWarsUniverse.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import Foundation;
#import "PARStarWarsCharacter.h"

@interface PARStarWarsUniverse : NSObject

@property (nonatomic, readonly) NSUInteger imperialCount;
@property (nonatomic, readonly) NSUInteger rebelCount;


-(PARStarWarsCharacter *) imperialAtIndex:(NSUInteger) index;
-(PARStarWarsCharacter *) rebelAtIndex:(NSUInteger) index;


@end
