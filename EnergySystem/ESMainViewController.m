//
//  ESMainViewController.m
//  EnergySystem
//
//  Created by tseg on 14-8-27.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import "ESMainViewController.h"


@interface ESMainViewController ()

@end

@implementation ESMainViewController

@synthesize delegate = _delegate;
@synthesize firstTouchOnConfigButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.firstTouchOnConfigButton = 0;
    [self dbCreateTable];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)dbCreateTable
{
    //查询config表是否已建立
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS CONFIG (USERID INTEGER,PROVINCE TEXT,CITY TEXT,COUNTY TEXT,BUILDING TEXT,ROOM TEXT,SITE TEXT,TYPE INTEGER)";
    
    ESSqliteUtil *sqlUtil = [[ESSqliteUtil alloc] init];
    if ([sqlUtil open]) {
        [sqlUtil execSQL:sqlCreateTable];
        [sqlUtil close];
    } else {
        NSLog(@"数据库打开失败");
    }
    
    [sqlUtil release];
    return YES;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Configuration Info"]) {
        
        /*
        firstLogin = YES;
        if (firstLogin) {
            ESUpdateConfigFile *esUpdCfg = [[ESUpdateConfigFile alloc] init];
            [esUpdCfg getUserConfigInfo];
        }
         */
    }

}

- (IBAction)changeFirstTouchOnConfigButton:(id)sender
{
    self.firstTouchOnConfigButton = self.firstTouchOnConfigButton + 1;
}

- (IBAction)logout:(id)sender {
    [self performSegueWithIdentifier:@"loginView" sender:self];
}

@end
