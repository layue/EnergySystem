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

@interface ESDownLoadFile : NSObject
{
    ESAlertView *_alertView;
    UIProgressView *_progressView;
    UILabel *_progressLabel;
    NSMutableData *_data;
    long long _totalLength;
    NSString *_fileName;
}

- (id)initWithESAlertView:(ESAlertView *) alertView;
- (void)downloadFile:(NSString *) fileName;
@end
