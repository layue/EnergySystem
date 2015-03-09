//
//  ESKPIList.h
//  EnergySystem
//
//  Created by tseg on 15-3-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESKPIList : NSObject

@property (strong,nonatomic) NSNumber *art_conditioner_en;
@property (strong,nonatomic) NSNumber *business_ec;
@property (strong,nonatomic) NSNumber *device_en;
@property (strong,nonatomic) NSNumber *ec_cf;
@property (strong,nonatomic) NSNumber *enterprise_ec;
@property (strong,nonatomic) NSNumber *g2_db;
@property (strong,nonatomic) NSNumber *g2_vb;
@property (strong,nonatomic) NSNumber *g3_db;
@property (strong,nonatomic) NSNumber *g3_vb;
@property (strong,nonatomic) NSNumber *in_humidity;
@property (strong,nonatomic) NSNumber *out_humidity;
@property (strong,nonatomic) NSNumber *in_temperature;
@property (strong,nonatomic) NSNumber *out_temperature;
@property (strong,nonatomic) NSNumber *lighting_en;
@property (strong,nonatomic) NSNumber *pue;
@property (strong,nonatomic) NSNumber *source_en;
@property (strong,nonatomic) NSNumber *sum_cf;
@property (strong,nonatomic) NSNumber *sum_en;
@property (strong,nonatomic) NSNumber *sum_humidity;
@property (strong,nonatomic) NSNumber *sum_temperature;

@end
