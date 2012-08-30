//
//  ViewController.m
//  HullHull
//
//  Created by 右京 和馬 on 2012/08/31.
//  Copyright (c) 2012年 yaakaito.org. All rights reserved.
//

#import "ViewController.h"
#import "HullToRefresh.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [HullToRefresh sharedHullHull];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(waruiSuraimu)
                                                 name:kDidHullHullNotification
                                               object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)waruiSuraimu {
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"スライム" message:@"僕悪いスライムじゃないよぉ" delegate:nil cancelButtonTitle:@"はい" otherButtonTitles:nil];
    [a show];
}
@end
