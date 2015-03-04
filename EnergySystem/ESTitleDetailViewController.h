//
//  ESTitleDetailViewController.h
//  EnergySystem
//
//  Created by tseg on 15-3-4.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESSqliteUtil.h"

@interface ESTitleDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSString *_name;
    NSMutableArray *_data;
}

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSString *name;

@end
