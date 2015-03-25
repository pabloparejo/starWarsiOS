//
//  UIViewController+Combinators.h
//  StarWars
//
//  Created by Pablo Parejo Camacho on 14/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

@import UIKit;

@interface UIViewController (Combinators)

-(UINavigationController *) wrappedInNavigationController;

@end