//
//  PARStarWarsUniverseViewController.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARStarWarsUniverseViewController.h"

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

    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    }else{
        character = [self.model rebelAtIndex:indexPath.row];
    }
    
    // Creamos la celda
    static NSString *cellId = @"StarWarsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    // configuramos celda
    
    cell.imageView.image = character.photo;
    cell.textLabel.text= character.alias;
    cell.detailTextLabel.text = character.name;
    
    // Devolvemos la celda
    return cell;
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

-(void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PARStarWarsCharacter *character;
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    }else{
        character = [self.model rebelAtIndex:indexPath.row];
    }
    
    PARCharacterViewController *cVC = [[PARCharacterViewController alloc] initWithModel:character];
    
    [self.navigationController pushViewController:cVC animated:YES];
}

@end
