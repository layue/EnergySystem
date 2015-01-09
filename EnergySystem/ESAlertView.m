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
        
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                         frame.size.width*0.75,
                                                         frame.size.height*0.25)];
        _view.center = self.center;
        _view.backgroundColor = [UIColor whiteColor];
        
        _progressView = [[UIProgressView alloc]
                         initWithProgressViewStyle:UIProgressViewStyleBar];
        _progressView.progress = 0.0f;
        _progressView.frame = CGRectMake(_view.frame.size.width*0.125,
                                         _view.frame.size.height*0.65,
                                         _view.frame.size.width*0.75, 10);
        
        _label = [[UILabel alloc] init];
        _label.text = [NSString stringWithFormat:@"开始下载0%%"];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.frame = CGRectMake(_view.frame.size.width*0.25,
                                  _view.frame.size.height*0.3,
                                  _view.frame.size.width*0.5,40);
        
        _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 50, 60, 30)];
        _confirmBtn.backgroundColor = [UIColor yellowColor];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor blueColor]
                          forState:UIControlStateNormal];
        
        [_view addSubview:_label];
        [_view addSubview:_progressView];
        //[_view addSubview:_confirmBtn];
        [self addSubview:_view];
        
        
    }
    return self;
}

- (id)initWithMessage:(CGRect)frame:(NSString *)message
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //根据屏幕尺寸进行自适应大小设计
        self.windowLevel = UIWindowLevelAlert;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
        
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                         frame.size.width*0.75,
                                                         frame.size.height*0.25)];
        _view.center = self.center;
        _view.backgroundColor = [UIColor whiteColor];
        
        _label = [[UILabel alloc] init];
        _label.text = message;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.frame = CGRectMake(_view.frame.size.width*0.125,
                                  _view.frame.size.height*0.3,
                                  _view.frame.size.width*0.75,40);
        
        [_view addSubview:_label];
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

- (void) updateMessage:(NSString *) message
{
    _label.text = message;
}

- (void) addProgressInfoOnAlertView
{
    _progressView = [[UIProgressView alloc]
                     initWithProgressViewStyle:UIProgressViewStyleBar];
    _progressView.progress = 0.0f;
    _progressView.frame = CGRectMake(_view.frame.size.width*0.125,
                                     _view.frame.size.height*0.65,
                                     _view.frame.size.width*0.75, 10);
    
    _label.text = [NSString stringWithFormat:@"开始下载0%%"];
    
    [_view addSubview:_progressView];
}

- (void) updateProgress:(float) info
{
    [_progressView setProgress:info];
    _label.text = [NSString stringWithFormat:@"下载配置文件%2.0f%%",info*100];
}

- (void) finishedProgress :(NSString *) message
{
    [_progressView setProgress:1.0f];
    _label.text = message;
    
    _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 50, 60, 30)];
    _confirmBtn.backgroundColor = [UIColor yellowColor];
    [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [_confirmBtn setTitleColor:[UIColor blueColor]
                      forState:UIControlStateNormal];
   // [_view addSubview:_confirmBtn];
}

- (void) dismiss {
    [self resignKeyWindow];
    [self release];
}

@end
