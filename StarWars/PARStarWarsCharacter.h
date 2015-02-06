//
//  PARStarWarsCharacter.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 6/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface PARStarWarsCharacter : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSURL *wikiPage;
@property (nonatomic, strong) NSData *sound;
@property (nonatomic, strong) UIImage *photo;


+(instancetype) starWarsCharacterWithName:(NSString*) name
                                    alias:(NSString*) alias
                                      url:(NSURL*) url
                                    sound:(NSData *) soundData
                                    image:(UIImage *) photo;


+(instancetype) starWarsCharacterWithAlias:(NSString*) alias
                                       url:(NSURL*) url
                                     sound:(NSData *) soundData
                                     image:(UIImage *) photo;

// Designated
-(id) initWithName:(NSString*) name
             alias:(NSString*) alias
               url:(NSURL*) url
             sound:(NSData *) soundData
             image:(UIImage *) photo;

-(id) initWithAlias:(NSString*) alias
                url:(NSURL*) url
              sound:(NSData *) soundData
              image:(UIImage *) photo;
@end
