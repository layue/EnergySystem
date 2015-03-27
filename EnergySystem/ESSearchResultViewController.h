//
//  ESSearchResultViewController.h
//  EnergySystem
//
//  Created by tseg on 15-3-24.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESConstants.h"

@interface ESSearchResultViewController : UIViewController
                    <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *pTableView;
@property (strong,nonatomic) NSArray *data;
@end
