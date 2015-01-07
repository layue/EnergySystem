//
//  ESAlertView.h
//  EnergySystem
//
//  Created by tseg on 15-1-7.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESAlertView : UIWindow
{
    UIView *_view;
    UILabel *_label;
    UIProgressView *_progressView;
    UIButton *_confirmBtn;
}

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) UILabel *label;

- (void)show;
- (void)updateProgress:(float) info;
- (void)dismiss;

@end
