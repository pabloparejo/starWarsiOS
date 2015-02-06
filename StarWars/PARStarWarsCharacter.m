//
//  PARStarWarsCharacter.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 6/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARStarWarsCharacter.h"

@implementation PARStarWarsCharacter

#pragma mark - Class Methods

+(instancetype) starWarsCharacterWithName:(NSString*) name
                                    alias:(NSString*) alias
                                      url:(NSURL*) url
                                    sound:(NSData *) soundData
                                    image:(UIImage *) photo{
    
    return [[self alloc] initWithName:name
                                alias:alias
                                  url:url
                                sound:soundData
                                image:photo];
    
}

+(instancetype) starWarsCharacterWithAlias:(NSString*) alias
                                       url:(NSURL*) url
                                     sound:(NSData *) soundData
                                     image:(UIImage *) photo{
    
    return [[self alloc] initWithAlias:alias
                                   url:url
                                 sound:soundData
                                 image:photo];

}

#pragma mark - Init

-(id) initWithName:(NSString*) name
             alias:(NSString*) alias
               url:(NSURL*) url
             sound:(NSData *) soundData
             image:(UIImage *) photo{
    
    if (self = [super init]) {
        _name = name;
        _alias = alias;
        _wikiPage = url;
        _sound = soundData;
        _photo = photo;
    }
    return self;
}

-(id) initWithAlias:(NSString*) alias
                url:(NSURL*) url
              sound:(NSData *) soundData
              image:(UIImage *) photo{
    
    return [self initWithName:nil
                        alias:alias
                          url:url
                        sound:soundData
                        image:photo];
}


@end
