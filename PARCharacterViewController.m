//
//  PARCharacterViewController.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 6/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARCharacterViewController.h"

@implementation PARCharacterViewController


#pragma mark - Init
-(id) initWithModel:(PARStarWarsCharacter *) model{
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Sincronizar modelo con la vista
    self.photoView.image = self.model.photo;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
