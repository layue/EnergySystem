//
//  ESSeachInfoViewController.h
//  EnergySystem
//
//  Created by tseg on 15-1-15.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESSeachInfoViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_data;
}


@property (retain, nonatomic) IBOutlet UIButton *_provinceBtn;

- (IBAction)showProvince:(id)sender;

@end
