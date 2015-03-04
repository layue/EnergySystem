//
//  ESTitleManageViewController.h
//  EnergySystem
//
//  Created by tseg on 15-3-4.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ESUpdateConfigFile.h"
#import "ESSqliteUtil.h"
#import "ESConstants.h"

@interface ESTitleManageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_data;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
