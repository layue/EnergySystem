//
//  ESConfigViewController.h
//  EnergySystem
//
//  Created by tseg on 14-11-15.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESDataManageDelegate.h"
#import "ESUserConfigInfo.h"

@interface ESConfigFinalViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    id <ESDataManageProtocal> _delegate;

    NSString *_county;
    NSMutableArray *_roomList;
    NSMutableArray *_siteList;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) id <ESDataManageProtocal> delegate;
@property (nonatomic, strong) NSString *county;
@property (nonatomic, strong) NSMutableArray *roomList;
@property (nonatomic, strong) NSMutableArray *siteList;

@end
