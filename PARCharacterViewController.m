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
        _player = [CafPlayer cafPlayer];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //DisplayMode por defecto para el SplitVC
    if (self.splitViewController.displayMode != UISplitViewControllerDisplayModeAllVisible) {
        self.navigationItem.leftItemsSupplementBackButton = YES;
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    }
    
    [self syncViewWithModel];
    
    
    // Eliminamos comportamiento por defecto iOS7
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)playSound:(id)sender{
    
    [self.player playSoundData:self.model.sound];
}

- (IBAction)displayWikipedia:(id)sender {
    PARWikiViewController *wikiVC = [[PARWikiViewController alloc] initWithModel:self.model];
    [self.navigationController pushViewController:wikiVC
                                         animated:YES];
}

#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    if (displayMode != UISplitViewControllerDisplayModeAllVisible) {
        self.navigationItem.leftItemsSupplementBackButton = YES;
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }
    
}

#pragma mark - PARStarWarsUniverseViewControllerDelegate

-(void) starWarsUniverseViewController:(PARStarWarsUniverseViewController *)vc didSelectCharacter:(PARStarWarsCharacter *)character{
    self.model = character;
    [self syncViewWithModel];
}

#pragma mark - Utils

-(void) syncViewWithModel{
    //Sincronizar modelo con la vista
    self.photoView.image = self.model.photo;
    self.title = self.model.alias;

}

@end
