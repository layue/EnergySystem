//
//  ESViewController.h
//  EnergySystem
//
//  Created by tseg on 14-8-25.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESDataManageDelegate.h"
#import "ESSqliteUtil.h"
#import "ESMainViewController.h"
#import "ESConstants.h"

#import "MBProgressHUD.h"

@interface ESLoginViewController : UIViewController
{
    id <ESDataManageProtocal> _delegate;
}

@property (strong, nonatomic) id <ESDataManageProtocal> delegate;

@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *saveUserNameButton;

- (IBAction)loginStartOn:(UIButton *)sender;
- (IBAction)dismissKeyboardTapBackground:(UIControl *)sender;
- (IBAction)userNameTextFieldDidEndOnExit:(id)sender;
- (IBAction)passWordTextFieldDidEndOnExit:(id)sender;
- (IBAction)checkBoxButton:(id)sender;

@end
