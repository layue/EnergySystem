//
//  ESSeachInfoViewController.h
//  EnergySystem
//
//  Created by tseg on 15-1-15.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESConstants.h"
#import "ESRoomSearchCondition.h"
#import "ESSqliteUtil.h"

@interface ESSeachInfoViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_data;
}

@property (retain, nonatomic) IBOutlet UITextField *provinceText;
@property (retain, nonatomic) IBOutlet UITextField *cityText;
@property (retain, nonatomic) IBOutlet UITextField *countyText;
@property (retain, nonatomic) IBOutlet UITextField *buildingText;
@property (retain, nonatomic) IBOutlet UITextField *roomText;
@property (retain, nonatomic) IBOutlet UITextField *kpiText;
@property (retain, nonatomic) IBOutlet UITextField *timeText;
@property (retain, nonatomic) IBOutlet UITextField *orderText;



@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UIButton *provinceBtn;
@property (retain, nonatomic) IBOutlet UIButton *cityBtn;
@property (retain, nonatomic) IBOutlet UIButton *countyBtn;
@property (retain, nonatomic) IBOutlet UIButton *buildingBtn;
@property (retain, nonatomic) IBOutlet UIButton *roomBtn;
@property (retain, nonatomic) IBOutlet UIButton *kpiBtn;
@property (retain, nonatomic) IBOutlet UIButton *timeBtn;
@property (retain, nonatomic) IBOutlet UIButton *orderBtn;


- (IBAction)getConfigList:(id)sender;
- (IBAction)getStaticConfigList:(id)sender;
- (IBAction)saveSearchCondition:(id)sender;

@end
