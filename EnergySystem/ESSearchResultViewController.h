//
//  ESSearchResultViewController.h
//  EnergySystem
//
//  Created by tseg on 15-3-24.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESKPIList.h"
#import "ESConstants.h"

@interface ESSearchResultViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (strong,nonatomic) NSString *kpi;
@property (strong,nonatomic) NSString *province;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *county;
@property (strong,nonatomic) NSString *building;
@property (strong,nonatomic) NSString *room;
@property (strong,nonatomic) NSString *site;
@property (strong,nonatomic) NSString *time;
@property (strong,nonatomic) NSString *startDate;
@property (strong,nonatomic) NSString *endDate;
@property (strong,nonatomic) NSString *placeType;
@property (strong,nonatomic) NSString *sort;
@property (strong,nonatomic) NSString *sort_target;

@end
