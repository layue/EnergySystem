//
//  ESConfigCityViewController.m
//  EnergySystem
//
//  Created by tseg on 14-11-15.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import "ESConfigCityViewController.h"

@interface ESConfigCityViewController ()

@end

@implementation ESConfigCityViewController

@synthesize delegate = _delegate;
@synthesize cityList = _cityList;
@synthesize province = _province;

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
    NSString *querySQL = [NSString stringWithFormat:@"SELECT DISTINCT CITY FROM CONFIG WHERE USERID = %d AND PROVINCE = '%@'",[configData.userid intValue], self.province];
    
    self.cityList = [[NSMutableArray alloc] init];
    [self.delegate getConfigInfoFromDBDelegate:self.cityList :querySQL :colIndex];
    
    
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
    return [self.cityList count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.cityList objectAtIndex:row];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"countyConfigView"]) {
        if ([segue.destinationViewController isKindOfClass:[ESConfigCountyViewController class]]) {
            ESConfigCountyViewController *escvc = (ESConfigCountyViewController *)segue.destinationViewController;
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            
            escvc.city = cell.textLabel.text;
        }
        
    }
}

@end
