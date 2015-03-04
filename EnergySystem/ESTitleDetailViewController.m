//
//  ESTitleDetailViewController.m
//  EnergySystem
//
//  Created by tseg on 15-3-4.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESTitleDetailViewController.h"

@interface ESTitleDetailViewController ()

@end

@implementation ESTitleDetailViewController

@synthesize name = _name;
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@",self.name);
    _data = [[NSMutableArray alloc] init];
    
    //查询标题详情
    [self loadTitleDetailInfoFromDB];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
	// Do any additional setup after loading the view.
}

- (void) loadTitleDetailInfoFromDB
{
    NSString *querySQL =[NSString stringWithFormat:@"SELECT * FROM TITLETABLE WHERE NAME = '%@'",self.name];
    
    ESSqliteUtil *sqlUtil = [[ESSqliteUtil alloc] init];
    sqlite3_stmt *stmt;
    
    
    if ([sqlUtil open])
    {
        if (sqlite3_prepare_v2(sqlUtil.db, [querySQL UTF8String], -1, &stmt, nil) == SQLITE_OK)
        {
            
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,1)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,2)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,3)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,4)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,5)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,6)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,7)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,8)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,9)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,10)]];
                [_data addObject:[[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(stmt,11)]];
            }
        }
        [sqlUtil close];
    } else {
        NSLog(@"数据库打开失败");
        [sqlUtil close];
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
    NSLog(@"%d",[_data count]);
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"titleDetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    switch (row) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"标题名称："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"类型："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 2:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"省："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 3:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"市："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 4:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"区县："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 5:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"机楼："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 6:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"机房："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 7:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"基站："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 8:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"KPI："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 9:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"时间："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
        case 10:
            cell.textLabel.text = [NSString stringWithFormat:@"%@",@"排序："];
            cell.textLabel.text = [cell.textLabel.text stringByAppendingString:[_data objectAtIndex:row]];
            break;
            
        default:
            break;
    }
    
    //cell.textLabel.text = [_data objectAtIndex:row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [tableView release];
    [super dealloc];
}
@end
