//
//  ESRoomSearchCondition.h
//  EnergySystem
//
//  Created by tseg on 15-3-3.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESRoomSearchCondition : NSObject

@property (strong,nonatomic) NSNumber *uid;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *province;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *couty;
@property (strong,nonatomic) NSString *building;
@property (strong,nonatomic) NSString *room;
@property (strong,nonatomic) NSString *kpi;
@property (strong,nonatomic) NSString *time;
@property (strong,nonatomic) NSString *order;

@end
