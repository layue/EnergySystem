//
//  ESUserConfigInfo.m
//  EnergySystem
//
//  Created by tseg on 14-8-28.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import "ESUserConfigInfo.h"

@implementation ESUserConfigInfo

@synthesize province;
@synthesize city;
@synthesize county;
@synthesize building;
@synthesize room;
@synthesize site;

- (void)setRoomValue:(NSDictionary*)value
{
    self.province = [value objectForKey:@"province"];
    self.city = [value objectForKey:@"city"];
    self.county = [value objectForKey:@"county"];
    self.building = [value objectForKey:@"building"];
    self.room = [value objectForKey:@"room"];
}

- (void)setSiteValue:(NSDictionary *)value
{
    self.province = [value objectForKey:@"province"];
    self.city = [value objectForKey:@"city"];
    self.county = [value objectForKey:@"county"];
    self.building = [value objectForKey:@"building"];
    self.site = [value objectForKey:@"site"];
}
@end
