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
        
        if (self.firstTouchOnConfigButton == 1) {
            [self getUserConfigInfo];
        }
    }

}

- (void)getUserConfigInfo
{
    ESDataManageDelegate *configDelegate = [[ESDataManageDelegate alloc] init];
    self.delegate = configDelegate;
    
    NSMutableData *data = [[NSMutableData alloc] init];
    [self.delegate getUserConfigInfoDelegate:data];
    
    
    if ([data length] > 0) {
        
        //解析JSON格式的数据,存入Sqlite本地数据库
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        [self.delegate storeConfigInfoToDBDelegate:resultData];
    }
    
    [data release];
    [configDelegate release];
    self.delegate = nil;

}

- (IBAction)changeFirstTouchOnConfigButton:(id)sender
{
    self.firstTouchOnConfigButton = self.firstTouchOnConfigButton + 1;
}

- (IBAction)logout:(id)sender {
    [self performSegueWithIdentifier:@"loginView" sender:self];
}

@end