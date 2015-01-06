//
//  ESConfigCountyViewController.h
//  EnergySystem
//
//  Created by tseg on 14-11-15.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESDataManageDelegate.h"
#import "ESUserConfigInfo.h"
#import "ESConfigTabBarViewController.h"


@interface ESConfigCountyViewController : UITableViewController
{
    id <ESDataManageProtocal> _delegate;
    NSString *_city;
    NSMutableArray *_countyList;
}

@property (nonatomic, strong) id <ESDataManageProtocal> delegate;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSMutableArray *countyList;

@end
