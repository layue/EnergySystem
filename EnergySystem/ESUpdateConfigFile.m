//
//  ESUpdateConfigFile.m
//  EnergySystem
//
//  Created by tseg on 15-1-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESUpdateConfigFile.h"

@implementation ESUpdateConfigFile

- (void)getUserConfigInfo
{
    ESDataManageDelegate *configDelegate = [[ESDataManageDelegate alloc] init];
    
   // [self showCheckingAlert];
    NSMutableData *data = [[NSMutableData alloc] init];
    [configDelegate getUserConfigInfoDelegate:data];
    
    
    if ([data length] > 0) {
        
        //验证返回的配置文件MD5验证码
        extern NSDictionary *userInfoDictionary;
        NSNumber *companyIdNSInt = [userInfoDictionary objectForKey:@"companyId"];
        NSString *companyIdNSString = [companyIdNSInt stringValue];
        companyIdNSString = [companyIdNSString stringByAppendingString:@".cfg"];
        
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)
                          lastObject];
        path = [path stringByAppendingString:@"/"];
        path = [path stringByAppendingString:companyIdNSString];
        
        ESMD5Util *md5Util = [[ESMD5Util alloc] init];
        NSString *md5 = [md5Util generateFileMD5CheckCode:path];
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",md5);
        
        if ([md5 isEqualToString:result]) {
            NSLog(@"配置文件已是最新");
        } else {
            NSLog(@"Downloading...");
            ESDownLoadFile *dlf = [[ESDownLoadFile alloc] init];
            [dlf downloadFile];
            
        }
        /*
         //解析JSON格式的数据,存入Sqlite本地
         NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
         [self.delegate storeConfigInfoToDBDelegate:resultData];
         */
    }
    
    [data release];
    [configDelegate release];
}

- (void) showCheckingAlert
{
    _alertView = [[UIAlertView alloc] initWithTitle:@"更新配置文件"
                                                        message:@"正在检查更新..."
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil,nil];
    [_alertView show];
}


@end
