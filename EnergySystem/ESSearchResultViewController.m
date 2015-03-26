//
//  ESSearchResultViewController.m
//  EnergySystem
//
//  Created by tseg on 15-3-24.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESSearchResultViewController.h"

@interface ESSearchResultViewController ()
{
    NSDictionary *_data;
    NSArray *_cellData;
}
@end

@implementation ESSearchResultViewController

@synthesize kpi;
@synthesize province;
@synthesize city;
@synthesize county;
@synthesize building;
@synthesize room;
@synthesize site;
@synthesize placeType;
@synthesize time;
@synthesize startDate;
@synthesize endDate;
@synthesize sort;
@synthesize sort_target;
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //[tableView setDataSource:self];
    //[tableView setDelegate:self];
    
    
    [self translateKPI];
    NSString *url = [self generateURLString];
    NSLog(@"%@",url);
    
    //根据URL获取查询结果
    [self getSearchResultFromServer:url];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
}

- (void) translateKPI
{
    if ([self.kpi isEqualToString:@"机房空调耗电"] || [self.kpi isEqualToString:@"基站空调耗电"]) {
        self.kpi = [NSString stringWithFormat:@"%@",@"air_conditioner_en=1"];
        self.sort_target = [NSString stringWithFormat:@"%@",@"air_conditioner_en"];
    } else if ([self.kpi isEqualToString:@"机房照明耗电"] || [self.kpi isEqualToString:@"基站照明耗电"]) {
        self.kpi = [NSString stringWithFormat:@"%@",@"lighting_en=1"];
        self.sort_target = [NSString stringWithFormat:@"%@",@"lighting_en"];
    } else if ([self.kpi isEqualToString:@"机房主设备耗电"] || [self.kpi isEqualToString:@"基站主设备耗电"]) {
        self.kpi = [NSString stringWithFormat:@"%@",@"device_en=1"];
        self.sort_target = [NSString stringWithFormat:@"%@",@"device_en"];
    }
}

- (NSString *)generateURLString
{
    NSMutableString *url = [[NSMutableString alloc] init];
    extern NSDictionary *userInfoDictionary;
    NSNumber *userID = [userInfoDictionary objectForKey:@"uid"];
    
    [url appendFormat:@"%@%@uid=%d",serverHttpUrl,UserSettingAction,[userID intValue]];
    [url appendFormat:@"&province=%@",self.province];
    if (self.city != nil) {
        [url appendFormat:@"&city=%@",self.city];
    }
    
    if (self.county != nil) {
        [url appendFormat:@"&county=%@",self.county];
    }
    [url appendFormat:@"&placeType=%@",self.placeType];
    [url appendFormat:@"&%@",self.kpi];
    
    //时间粒度：如果为天，则显示地区前7天的数据；如果为小时，则显示地区当前最多24小时的数据，即当天的数据
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSDate *start = [NSDate date];
    NSDate *start = [dateFormatter dateFromString:@"2012-04-06"];
    NSDate *end = [[NSDate alloc] init];
    
    if ([self.time isEqualToString:@"日"]) {
        end = [NSDate dateWithTimeInterval:60*60*24*7 sinceDate:start];
        
        NSLog(@"%@ and %@",self.startDate,self.endDate);
    } else if ([self.time isEqualToString:@"小时"]) {
        end = [NSDate dateWithTimeInterval:60*60*24 sinceDate:start];
    }
    
    self.startDate = [dateFormatter stringFromDate:start];
    self.endDate = [dateFormatter stringFromDate:end];

    //排序信息，以当前选择的KPI作为排序指标
    if (self.sort != nil) {
        if ([self.sort isEqualToString:@"升序"]) {
            self.sort = @"asc";
        } else {
                self.sort = @"desc";
        }
        
        [url appendFormat:@"&sort=%@",self.sort];
        [url appendFormat:@"&sort_target=%@",self.sort_target];
    }
    
    [url appendFormat:@"&startDate=%@",self.startDate];
    [url appendFormat:@"&endDate=%@",self.endDate];
    
    return url;
}

- (void)getSearchResultFromServer:(NSString *)urlAsString
{
    urlAsString = [urlAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlAsString];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:NETWORKTIMEOUT];
    [urlRequest setHTTPMethod:@"POST"];
    
    //发送同步Http信息
    NSURLResponse *response = nil;
    NSError *connectionError = nil;
    NSData *tmpData = [NSURLConnection sendSynchronousRequest:urlRequest
                                            returningResponse:&response
                                                        error:&connectionError];
    if ([tmpData length] > 0) {
        /*
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:tmpData
                                                                   options:kNilOptions error:nil];
         */
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:tmpData options:NSJSONReadingMutableLeaves error:nil];
        
        
        NSNumber *status = [resultData objectForKey:@"status"];
        if ([status intValue] == 200) {
            if ([self.placeType isEqualToString:@"机房"]) {
                _data = [resultData objectForKey:@"room_data"];
                _cellData = [_data objectForKey:@"data"];
            } else if ([self.placeType isEqualToString:@"基站"]) {
                _data = [resultData objectForKey:@"site_data"];
                _cellData = [_data objectForKey:@"data"];
            }
            
            [_data retain];
            [tableView reloadData];
        }
    }
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
    return [_cellData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"resultDetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *tmp = [[NSString alloc] init];
    
    switch (row) {
        case 0:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"日期:",
                                   [[_cellData objectAtIndex:section]
                                                objectForKey:@"date"]];
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"地点:",
                                   [[_cellData objectAtIndex:section]
                                                objectForKey:@"location"]];
            break;
        case 2:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"总能耗:",
                                   [[_cellData objectAtIndex:section]
                                    objectForKey:@"sum"]];
            break;
        case 3:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"主设备能耗:",
                                   [[_cellData objectAtIndex:section]
                                    objectForKey:@"primaryDevice"]];
            break;
        case 4:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"空调能耗:",
                                   [[_cellData objectAtIndex:section]
                                    objectForKey:@"cooling"]];
            break;
        case 5:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"照明:",
                                   [[_cellData objectAtIndex:section]
                                    objectForKey:@"lighting"]];
            break;
        case 6:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"插座:",
                                   [[_cellData objectAtIndex:section]
                                    objectForKey:@"SMPS"]];
            break;
        case 7:
            cell.textLabel.text = [NSString stringWithFormat:@"%@%@",@"其他:",
                                   [[_cellData objectAtIndex:section]
                                    objectForKey:@"other"]];
            break;
        default:
            break;
    }
    
    return cell;
}


- (void)dealloc {
    [UITableView release];
    [_data release];
    [super dealloc];
}
@end
