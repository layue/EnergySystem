//
//  ESQueryInfo.h
//  EnergySystem
//
//  Created by tseg on 15-1-22.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESQueryInfo : NSObject
{
    NSString *_type;
    NSString *_province;
    NSString *_city;
    NSString *_county;
    NSString *_building;
    NSString *_macroom;
    NSString *_site;
}

@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) NSString *province;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *county;
@property (strong,nonatomic) NSString *building;
@property (strong,nonatomic) NSString *macroom;
@property (strong,nonatomic) NSString *site;


@end
