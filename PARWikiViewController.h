//
//  PARWikiViewController.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PARStarWarsCharacter.h"

@interface PARWikiViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, strong) PARStarWarsCharacter *model;
@property (nonatomic, weak) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

-(id) initWithModel: (PARStarWarsCharacter *) model;

@end
