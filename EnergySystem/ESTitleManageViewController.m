//
//  ESTitleManageViewController.m
//  EnergySystem
//
//  Created by tseg on 15-3-4.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESTitleManageViewController.h"

@implementation ESTitleManageViewController

@synthesize tableView;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //加载数据库中的标题
    _data = [[NSMutableArray alloc] init];
    //[_data retain];
    [self loadTitleTable];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
    
    
}

- (void)loadTitleTable
{
    NSLog(@"TITLEMANAGEVIEW");
    extern NSDictionary *userInfoDictionary;
    NSNumber *userID = [userInfoDictionary objectForKey:@"uid"];

    ESSqliteUtil *sqlUtil = [[ESSqliteUtil alloc] init];
    sqlite3_stmt *stmt;
    
    if ([sqlUtil open]) {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT USERID,NAME,TYPE FROM TITLETABLE WHERE USERID = %d",[userID intValue]];
        if (sqlite3_prepare_v2(sqlUtil.db, [querySQL UTF8String], -1, &stmt, nil) == SQLITE_OK)
        {
            
            while (sqlite3_step(stmt) == SQLITE_ROW) {
               [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,1)]];
            }
        }
        [sqlUtil close];
    } else {
        NSLog(@"数据库打开失败");
        [sqlUtil close];
    }
    if ([sqlUtil open]) {
        
        
    }
}

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
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"titleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [_data objectAtIndex:row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
}


- (void)dealloc {
    //[_tableView release];
    [super dealloc];
}
@end
