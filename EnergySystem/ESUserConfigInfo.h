//
//  ESUserConfigInfo.h
//  EnergySystem
//
//  Created by tseg on 14-8-28.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESUserConfigInfo : NSObject

@property (strong, nonatomic) NSString *province;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *county;
@property (strong, nonatomic) NSString *building;
@property (strong, nonatomic) NSString *room;
@property (strong, nonatomic) NSString *site;
@property (strong, nonatomic) NSNumber *userid;

- (void)setRoomValue:(NSDictionary *)value;
- (void)setSiteValue:(NSDictionary *)value;

@end
