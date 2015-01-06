//
//  ESDownLoadFile.h
//  EnergySystem
//
//  Created by tseg on 15-1-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESDownLoadFile : NSObject
{
    NSMutableData *_data;
    long long _totalLength;
}

- (void)downloadFile;
@end
