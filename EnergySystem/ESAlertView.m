//
//  ESAlertView.m
//  EnergySystem
//
//  Created by tseg on 15-1-7.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESAlertView.h"

@implementation ESAlertView

@synthesize view;
@synthesize progressView;
@synthesize label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //根据屏幕尺寸进行自适应大小设计
        self.windowLevel = UIWindowLevelAlert;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
        
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
        _view.center = CGPointMake(160, 240);
        _view.backgroundColor = [UIColor whiteColor];
        
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        _progressView.progress = 0.0f;
        _progressView.frame = CGRectMake(10, 40, 150, 10);
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 60, 20)];
        _label.text = [NSString stringWithFormat:@"0%%"];
        _label.frame = CGRectMake(160, 40, 200, 10);
        
        _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 50, 60, 30)];
        _confirmBtn.backgroundColor = [UIColor yellowColor];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_view addSubview:_label];
        [_view addSubview:_progressView];
        [_view addSubview:_confirmBtn];
        [self addSubview:_view];
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) show
{
    [self makeKeyAndVisible];
}

- (void) updateProgress :(float) info
{
    [_progressView setProgress:info];
    _label.text = [NSString stringWithFormat:@"%2.0f%%",info*100];
}

- (void) dismiss {
    [self resignKeyWindow];
    [self release];
}

@end
