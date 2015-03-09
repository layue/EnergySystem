//
//  ESSiteSearchInfoViewController.h
//  EnergySystem
//
//  Created by tseg on 15-3-5.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESSqliteUtil.h"
#import "ESConstants.h"
#import "ESSiteSearchCondition.h"

@interface ESSiteSearchInfoViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_data;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UITextField *provinceText;
@property (retain, nonatomic) IBOutlet UITextField *cityText;
@property (retain, nonatomic) IBOutlet UITextField *countyText;
@property (retain, nonatomic) IBOutlet UITextField *siteText;
@property (retain, nonatomic) IBOutlet UITextField *KPIText;
@property (retain, nonatomic) IBOutlet UITextField *timeText;
@property (retain, nonatomic) IBOutlet UITextField *orderText;
@property (retain, nonatomic) IBOutlet UIButton *provinceBtn;
@property (retain, nonatomic) IBOutlet UIButton *cityBtn;
@property (retain, nonatomic) IBOutlet UIButton *countyBtn;
@property (retain, nonatomic) IBOutlet UIButton *siteBtn;
@property (retain, nonatomic) IBOutlet UIButton *KPIBtn;
@property (retain, nonatomic) IBOutlet UIButton *timeBtn;
@property (retain, nonatomic) IBOutlet UIButton *orderBtn;
- (IBAction)getConfigList:(id)sender;
- (IBAction)getStaticConfigList:(id)sender;
- (IBAction)saveSearchConditionIntoDB:(id)sender;

@end
