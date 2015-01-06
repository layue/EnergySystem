//
//  ESConfigTabBarViewController.h
//  EnergySystem
//
//  Created by tseg on 14-11-21.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ESConfigFinalViewController.h"

@interface ESConfigTabBarViewController : UITabBarController

{
    NSString *_county;
}

@property (nonatomic, strong) NSString *county;

@end


