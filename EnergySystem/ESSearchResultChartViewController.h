//
//  ESSearchResultChartViewController.h
//  EnergySystem
//
//  Created by tseg on 15-3-25.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UUChart.h"

@interface ESSearchResultChartViewController : UIViewController <UUChartDataSource,UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end


