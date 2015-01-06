//
//  ESConfigTabBarViewController.m
//  EnergySystem
//
//  Created by tseg on 14-11-21.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import "ESConfigTabBarViewController.h"

@interface ESConfigTabBarViewController ()

@end

@implementation ESConfigTabBarViewController

@synthesize county;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    for (int i = 0; i < [self.viewControllers count]; i++) {
        if ([self.viewControllers[i] isKindOfClass:[ESConfigFinalViewController class]]) {
            ESConfigFinalViewController *escfvc = (ESConfigFinalViewController *)self.viewControllers[i];
            escfvc.county = self.county;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
