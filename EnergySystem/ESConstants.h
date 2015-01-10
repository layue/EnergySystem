//
//  ESConstants.h
//  EnergySystem
//
//  Created by tseg on 14-8-27.
//  Copyright (c) 2014年 tseg. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef ESDBNAME
#define ESDBNAME @"esdb"
#endif

#ifndef HUDSLEEPSECONDS
#define HUDSLEEPSECONDS 2
#endif

#ifndef NETWORKTIMEOUT
#define NETWORKTIMEOUT 60.0f
#endif

NSUserDefaults *userInfoSettings;
NSDictionary *userInfoDictionary;
BOOL firstLogin;

static NSString *serverHttpUrl = @"http://10.103.241.63:8080/EnergySystem/";
static NSString *loginAction   = @"Login_UserBasicAction.action?name=";
static NSString *configAction  = @"Configuration_UserBasicAction.action?companyId=";
static NSString *configFilePath = @"resources/downloads/";

@interface ESConstants : NSObject

@end
