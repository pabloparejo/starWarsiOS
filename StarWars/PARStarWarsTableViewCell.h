//
//  PARStarWarsTableViewCell.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 28/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PARStarWarsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *characterPhotoView;
@property (weak, nonatomic) IBOutlet UILabel *aliasView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UIImageView *forceSidePhotoView;

+(NSString*) cellId;
+(CGFloat) height;

@end
