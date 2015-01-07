//
//  ESConfigCountyViewController.m
//  EnergySystem
//
//  Created by tseg on 14-11-15.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import "ESConfigCountyViewController.h"

@interface ESConfigCountyViewController ()

@end

@implementation ESConfigCountyViewController

@synthesize delegate = _delegate;
@synthesize city = _city;
@synthesize countyList = _countyList;

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
    NSString *querySQL = [NSString stringWithFormat:@"SELECT DISTINCT COUNTY FROM CONFIG WHERE USERID = %d AND CITY = '%@'",[configData.userid intValue], self.city];
    
    self.countyList = [[NSMutableArray alloc] init];
    [self.delegate getConfigInfoFromDBDelegate:self.countyList :querySQL :colIndex];
    
    
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
    return [self.countyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"countyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.countyList objectAtIndex:row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"finalConfigView"]) {
        if ([segue.destinationViewController isKindOfClass:[ESConfigTabBarViewController class]]) {
            
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            ESConfigTabBarViewController *estbvc = (ESConfigTabBarViewController *)segue.destinationViewController;
            estbvc.county = cell.textLabel.text;
        }
    }
}

@end
