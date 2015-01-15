//
//  ESSeachInfoViewController.m
//  EnergySystem
//
//  Created by tseg on 15-1-15.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESSeachInfoViewController.h"

@interface ESSeachInfoViewController ()

@end

@implementation ESSeachInfoViewController

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
    _data = [[NSArray alloc] initWithObjects:@"1",@"2",nil];
	// Do any additional setup after loading the view.
        
}

- (IBAction)showProvince:(id)sender
{
    UITableView *province = [[UITableView alloc] initWithFrame:CGRectMake(self._provinceBtn.frame.origin.x, self._provinceBtn.frame.origin.y, 100, 200) style:UITableViewStyleGrouped];
    
    province.dataSource = self;
    province.delegate = self;
    
    [self.view addSubview:province];
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
    return [_data count];;
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
    cell.textLabel.text = [_data objectAtIndex:row];
    
    return cell;
}



- (void)dealloc {
    [__provinceBtn release];
    [super dealloc];
}
@end
