//
//  ESUpdateConfigFile.h
//  EnergySystem
//
//  Created by tseg on 15-1-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ESDataManageDelegate.h"
#import "ESDownLoadFile.h"
#import "ESMD5Util.h"

@interface ESUpdateConfigFile : NSObject
{
    UIAlertView *_alertView;
}
- (void) getUserConfigInfo;

@end
