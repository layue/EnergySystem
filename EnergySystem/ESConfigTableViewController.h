//
//  ESConfigTableViewController.h
//  EnergySystem
//
//  Created by tseg on 14-11-13.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESUserConfigInfo.h"
#import "ESDataManageDelegate.h"
#import "ESConfigCityViewController.h"
#import "ESUpdateConfigFile.h"

#import "MBProgressHUD.h"

@interface ESConfigTableViewController : UITableViewController
{
    id <ESDataManageProtocal> _delegate;
    NSMutableArray *_provinces;
}

@property (nonatomic, strong) id delegate;
@property (nonatomic, strong) NSMutableArray *provinces;

- (IBAction)updateConfigInfo:(id)sender;

@end
