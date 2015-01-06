//
//  ESMainViewController.h
//  EnergySystem
//
//  Created by tseg on 14-8-27.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

#import "ESSqliteUtil.h"
#import "ESUpdateConfigFile.h"
#import "ESUserConfigInfo.h"
#import "ESConfigTableViewController.h"

#import "MBProgressHUD.h"

@interface ESMainViewController : UIViewController
{
        id <ESDataManageProtocal> _delegate;
}

@property (nonatomic, strong) id <ESDataManageProtocal> delegate;
@property (nonatomic) int firstTouchOnConfigButton;

- (IBAction)changeFirstTouchOnConfigButton:(id)sender;
- (IBAction)logout:(id)sender;
- (void)getUserConfigInfo;

@end
