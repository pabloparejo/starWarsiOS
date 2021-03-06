//
//  PARStarWarsTableViewCell.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 28/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARStarWarsTableViewCell.h"

@implementation PARStarWarsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.characterPhotoView.layer.cornerRadius = 46/2;
    self.forceSidePhotoView.layer.cornerRadius = 30/2;
}

-(void)prepareForReuse{
    // Buen sitio para darse de baja de notificaciones etc.
    // Habría que dejar la celda en estado nulo (en nuestro caso no es importante)
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(NSString *) cellId{
    return [[self class] description];
}

+(CGFloat) height{
    return 55;
}

@end
