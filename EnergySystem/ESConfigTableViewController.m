//
//  ESConfigTableViewController.m
//  EnergySystem
//
//  Created by tseg on 14-11-13.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import "ESConfigTableViewController.h"

@interface ESConfigTableViewController ()

@end

@implementation ESConfigTableViewController

@synthesize delegate = _delegate;
@synthesize provinces = _provinces;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ESUserConfigInfo *configData = [[ESUserConfigInfo alloc] init];
    configData.userid = [userInfoDictionary objectForKey:@"uid"];
    
    ESDataManageDelegate *dataManageDelegate = [[ESDataManageDelegate alloc] init];
    self.delegate = dataManageDelegate;

    int colIndex = 0;
    NSString *querySQL = [NSString stringWithFormat:@"SELECT DISTINCT PROVINCE FROM CONFIG WHERE USERID = %d",[configData.userid intValue]];
    
    self.provinces = [[NSMutableArray alloc] init];
    [self.delegate getConfigInfoFromDBDelegate:self.provinces :querySQL :colIndex];
    
    
    [configData release];
    [dataManageDelegate release];
    self.delegate = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.provinces count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"provinceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.provinces objectAtIndex:row];
    
    return cell;
}

- (IBAction)updateConfigInfo:(id)sender
{
    MBProgressHUD *getUserConfigInfoHUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:getUserConfigInfoHUD];
    getUserConfigInfoHUD.labelText = @"正在更新配置信息...";
    
    [getUserConfigInfoHUD showWhileExecuting:@selector(getUserConfigInfoDetail) onTarget:self
                                  withObject:nil animated:YES];
    
    [getUserConfigInfoHUD release];
    [self.tableView reloadData];
}

- (void)getUserConfigInfoDetail
{
    ESDataManageDelegate *configDelegate = [[ESDataManageDelegate alloc] init];
    self.delegate = configDelegate;
    
    NSMutableData *data = [[NSMutableData alloc] init];
    [self.delegate getUserConfigInfoDelegate:data];
    
    if ([data length] > 0) {
        //解析JSON格式的数据,存入Sqlite本地数据库
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:kNilOptions error:nil];
        
        NSNumber *status = [resultData objectForKey:@"status"];
        
        if ([status intValue] == 200 && [self.delegate storeConfigInfoToDBDelegate:resultData]) {
            
            [self performSelectorOnMainThread:@selector(showHudMessage:)
                                   withObject:@"更新配置信息成功" waitUntilDone:YES];
            
        } else {
            [self performSelectorOnMainThread:@selector(showHudMessage:)
                                   withObject:@"更新配置信息失败" waitUntilDone:YES];
        }
    }
    
    [configDelegate release];
    
}

//提示获取数据结果信息，Block形式
- (void)showHudMessage:(NSString *)labelText
{
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.labelText = labelText;
    HUD.mode=MBProgressHUDModeCustomView;
    [HUD showAnimated:YES
  whileExecutingBlock:^{
      sleep(HUDSLEEPSECONDS);
  }
      completionBlock:^{
          [HUD removeFromSuperview];
      }];
    [HUD release];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"cityConfigView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        if ([segue.destinationViewController isKindOfClass:[ESConfigCityViewController class]]) {
            ESConfigCityViewController *escvc = (ESConfigCityViewController *)segue.destinationViewController;
            escvc.province = cell.textLabel.text;
        }
    }
}

@end
