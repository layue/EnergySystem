//
//  ESDownLoadFile.h
//  EnergySystem
//
//  Created by tseg on 15-1-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ESAlertView.h"
#import "ESConstants.h"
#import "ESDataManageDelegate.h"

@interface ESDownLoadFile : NSObject
{
    ESAlertView *_alertView;
    UIProgressView *_progressView;
    UILabel *_progressLabel;
    long long _totalLength;
    
    NSMutableData *_data;
    NSString *_fileName;
    NSString *_path;
    NSString *_cfgFileContent;
    ESDataManageDelegate *_delegate;
}

@property (strong,nonatomic) ESDataManageDelegate *delegate;

- (id)initWithESAlertView:(ESAlertView *) alertView;
- (void)downloadFile:(NSString *) fileName;
- (void)loadConfigInfo:(NSString *) path;
@end
