//
//  ESNetworkProtocal.h
//  EnergySystem
//
//  Created by tseg on 14-11-4.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ESDataManageProtocal <NSObject>

- (void)getUserConfigInfoDelegate:(NSMutableData *) data;

- (void)loginDeletegate:(NSString *) password
                       :(NSString *) username
                       :(NSDictionary *) result;

- (BOOL)storeConfigInfoToDBDelegate:(NSDictionary *) data;

- (BOOL)goToMainViewWithFirstLoginDelegate;

- (void)getConfigInfoFromDBDelegate:(NSMutableArray *) data;

- (void)getConfigInfoFromDBDelegate:(NSMutableArray *) data
                                   :(NSString *) querySQL
                                   :(int) colIndex;

@end
