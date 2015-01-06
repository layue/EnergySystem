//
//  ESSqliteUtil.h
//  EnergySystem
//
//  Created by tseg on 14-8-27.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#define ESDBNAME @"esdb"

@interface ESSqliteUtil : NSObject
{
    @public sqlite3 *_db;
}

- (BOOL)open;
- (BOOL)close;
- (BOOL)execSQL:(NSString *)sql;

@property (nonatomic) sqlite3 *db;

@end
