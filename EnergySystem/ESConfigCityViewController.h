//
//  ESConfigCityViewController.h
//  EnergySystem
//
//  Created by tseg on 14-11-15.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESConfigCountyViewController.h"
#import "ESDataManageDelegate.h"
#import "ESUserConfigInfo.h"

@interface ESConfigCityViewController : UITableViewController
{
    id <ESDataManageProtocal> _delegate;
    NSMutableArray *_cityList;
    NSString *_province;
}

@property (nonatomic, strong) id <ESDataManageProtocal> delegate;
@property (nonatomic, strong) NSMutableArray *cityList;
@property (nonatomic, strong) NSString *province;

@end
