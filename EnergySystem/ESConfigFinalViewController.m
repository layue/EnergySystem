//
//  ESConfigViewController.m
//  EnergySystem
//
//  Created by tseg on 14-11-15.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import "ESConfigFinalViewController.h"

@interface ESConfigFinalViewController ()

@end

@implementation ESConfigFinalViewController

@synthesize delegate = _delegate;
@synthesize county = _county;
@synthesize roomList = _roomList;
@synthesize siteList = _siteList;
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    ESUserConfigInfo *configData = [[ESUserConfigInfo alloc] init];
    configData.userid = [userInfoDictionary objectForKey:@"uid"];
    
    ESDataManageDelegate *dataManageDelegate = [[ESDataManageDelegate alloc] init];
    self.delegate = dataManageDelegate;
    
    if ([self.title isEqualToString:@"room"]) {
        int colIndex = 0;
        NSString *querySQLRoom = [NSString stringWithFormat:@"SELECT DISTINCT ROOM FROM CONFIG WHERE USERID = %d AND COUNTY = '%@' AND TYPE = 1",[configData.userid intValue], self.county];
        
        self.roomList = [[NSMutableArray alloc] init];
        [self.delegate getConfigInfoFromDBDelegate:self.roomList :querySQLRoom :colIndex];
    } else if ([self.title isEqualToString:@"site"]){
        int colIndex = 0;
        NSString *querySQLSite = [NSString stringWithFormat:@"SELECT DISTINCT SITE FROM CONFIG WHERE USERID = %d AND COUNTY = '%@' AND TYPE = 2",[configData.userid intValue], self.county];
        
        self.siteList = [[NSMutableArray alloc] init];
        [self.delegate getConfigInfoFromDBDelegate:self.siteList :querySQLSite :colIndex];

    }
    
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
    if ([self.title isEqualToString:@"room"]) {
        return [self.roomList count];
    } else {
        return [self.siteList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [[NSString alloc] init];
    UITableViewCell *cell = nil;
    
    if ([self.title isEqualToString:@"room"])
    {
        cellIdentifier = @"roomCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        
        NSUInteger row = [indexPath row];
        cell.textLabel.text = [self.roomList objectAtIndex:row];
        
    } else if ([self.title isEqualToString:@"site"]) {
    
        cellIdentifier = @"siteCell";
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:cellIdentifier];
        }
        
        NSUInteger row = [indexPath row];
        cell.textLabel.text = [self.siteList objectAtIndex:row];
    }
    return cell;
}


- (void)dealloc {
    [self.tableView release];
    [super dealloc];
}
@end
