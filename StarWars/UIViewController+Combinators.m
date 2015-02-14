//
//  UIViewController+Combinators.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 14/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "UIViewController+Combinators.h"

@implementation UIViewController (Combinators)

-(UINavigationController *) wrappedInNavigationController{
    UINavigationController *navVC = [UINavigationController new];
    [navVC pushViewController:self animated:NO];
    return navVC;
}

@end
