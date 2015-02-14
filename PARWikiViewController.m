//
//  PARWikiViewController.m
//  StarWars
//
//  Created by Pablo Parejo Camacho on 7/2/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARWikiViewController.h"
#import "PARStarWarsUniverseViewController.h"

@interface PARWikiViewController ()

@end

@implementation PARWikiViewController

#pragma mark - Init
-(id) initWithModel: (PARStarWarsCharacter *) model{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
        self.title = @"Wiki";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Eliminamos comportamiento por defecto iOS7
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Sincronizar modelo con vista
    self.browser.delegate = self;
    [self syncViewWithModel];
}

// CHARACTER_DID_CHANGE_NOTIFICATION
-(void) notifyThatCharacterDidChange:(NSNotification *)n{
    self.model = [n.userInfo objectForKey:CHARACTER_KEY];
    [self syncViewWithModel];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatCharacterDidChange:)
               name:CHARACTER_DID_CHANGE_NOTIFICATION
             object:nil];
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Memory warning!!!");
}


#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    [self.activity stopAnimating];
    self.activity.hidden = YES;
}

-(BOOL) webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) ||
         navigationType == UIWebViewNavigationTypeFormSubmitted) {
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - Utils

-(void) syncViewWithModel{
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiPage]];
    self.activity.hidden = NO;
    [self.activity startAnimating];
}


@end
