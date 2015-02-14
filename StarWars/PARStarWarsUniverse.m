//
//  PARStarWarsUniverse.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARStarWarsUniverse.h"


// Creamos categoría anónima (extensión)
@interface PARStarWarsUniverse ()
// No son privados, se declaran aquí para mantener sencillo .h
@property (nonatomic, strong) NSArray *imperials;
@property (nonatomic, strong) NSArray *rebels;

@end


@implementation PARStarWarsUniverse

#pragma mark - Properties

-(NSUInteger) imperialCount{
    return [self.imperials count];
}

-(NSUInteger) rebelCount{
    return [self.rebels count];
}


#pragma mark - Init
-(id) init{
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

    
    _rebels = @[chewi, r2d2, c3po];
    _imperials = @[vader, tarkin, palpatine];
    
    return self;
}

-(PARStarWarsCharacter *) imperialAtIndex:(NSUInteger) index{
    return [self.imperials objectAtIndex:index];
}
-(PARStarWarsCharacter *) rebelAtIndex:(NSUInteger) index{
    return [self.rebels objectAtIndex:index];
}




@end
