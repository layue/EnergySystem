//
//  ESMD5Util.h
//  EnergySystem
//
//  Created by tseg on 15-1-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface ESMD5Util : NSObject
{
    NSString *_md5;
    NSString *_path;
}

@property (strong,nonatomic) NSString *md5;

- (NSString *)generateFileMD5CheckCode: (NSString *)path;

@end
