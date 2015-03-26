//
//  ESSearchResultChartViewController.m
//  EnergySystem
//
//  Created by tseg on 15-3-25.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESSearchResultChartViewController.h"

@interface ESSearchResultChartViewController ()
{
    UUChart *_chartLineView;
    UUChart *_chartBarView;
}
@end

@implementation ESSearchResultChartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _chartLineView = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(100, 100, 100, 100) withSource:self withStyle:UUChartLineStyle];
    _chartBarView = [[UUChart alloc] initwithUUChartDataFrame:CGRectMake(100, 100, 100, 100) withSource:self withStyle:UUChartBarStyle];
    
    
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    NSArray * array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    return array;
}

- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSArray * array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"2",nil];
    return @[array];
}

- (BOOL)UUChart:(UUChart *)chart ShowHorizonLineAtIndex:(NSInteger)index
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"chartCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    
    

    NSInteger section = [indexPath section];
    
    if (section == 0) {
        [_chartLineView showInView:cell.contentView];
    } else {
        [_chartBarView showInView:cell.contentView];
    }
    
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  200;
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
