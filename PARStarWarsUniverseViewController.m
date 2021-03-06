//
//  PARStarWarsUniverseViewController.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARStarWarsUniverseViewController.h"
#import "PARCharacterViewController.h"
#import "PARStarWarsTableViewCell.h"
#import "settings.h"
@interface PARStarWarsUniverseViewController ()

@property PARStarWarsUniverse *model;

@end

@implementation PARStarWarsUniverseViewController

-(id) initWithModel:(PARStarWarsUniverse *) model
              style:(UITableViewStyle) style{
    
    if (self = [super initWithStyle:style]) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Star Wars Universe"];
    
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == IMPERIAL_SECTION) {
        return [self.model imperialCount];
    }else{
        return [self.model rebelCount];
    }

}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PARStarWarsCharacter *character;
    UIImage *sidePhoto = nil;
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
        sidePhoto = [UIImage imageNamed:@"imperial.png"];
    }else{
        character = [self.model rebelAtIndex:indexPath.row];
        sidePhoto = [UIImage imageNamed:@"alliance.gif"];
    }
    
    // Creamos la celda
    PARStarWarsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PARStarWarsTableViewCell cellId] forIndexPath:indexPath];
    
    // setting up the cell
    cell.characterPhotoView.image = character.photo;
    cell.aliasView.text= character.alias;
    cell.nameView.text = character.name;
    cell.forceSidePhotoView.image = sidePhoto;
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [PARStarWarsTableViewCell height];
}

-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    if (section == IMPERIAL_SECTION) {
        return @"Galactic Empire";
    }else{
         return @"Rebel Alliance";
    }
}

#pragma mark - TableView Delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PARStarWarsCharacter *character;
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    }else{
        character = [self.model rebelAtIndex:indexPath.row];
    }
    
    // Message to delegate
    if ([self.delegate respondsToSelector:@selector(starWarsUniverseViewController:didSelectCharacter:)]) {
        
        [self.delegate starWarsUniverseViewController:self
                                   didSelectCharacter:character];
    }
    
    // Sending notification
    NSDictionary *dict = @{CHARACTER_KEY: character};
    NSNotification *notification = [NSNotification notificationWithName:CHARACTER_DID_CHANGE_NOTIFICATION object:self userInfo:dict];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    NSArray *coords = @[@(indexPath.section), @(indexPath.row)];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def  setObject:coords forKey:LAST_SELECTED_CHARACTER_KEY];
    [def synchronize];
    
}

#pragma mark - PARStarWarsUniverseViewControllerDelegate
-(void) starWarsUniverseViewController:(PARStarWarsUniverseViewController *)vc
                    didSelectCharacter:(PARStarWarsCharacter *)character{
    
    PARCharacterViewController *charVC = [[PARCharacterViewController alloc] initWithModel:character];
    [self.navigationController pushViewController:charVC animated:YES];
}


#pragma mark - Utils
-(void) registerNibs{
    UINib *nib = [UINib nibWithNibName:@"PARStarWarsTableViewCell" bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:[PARStarWarsTableViewCell cellId]];
}

@end
