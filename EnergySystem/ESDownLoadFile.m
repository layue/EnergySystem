//
//  ESDownLoadFile.m
//  EnergySystem
//
//  Created by tseg on 15-1-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESDownLoadFile.h"

@implementation ESDownLoadFile

- (id) initWithESAlertView:(ESAlertView *) alertView
{
    [alertView addProgressInfoOnAlertView];
    _alertView = alertView;
    return self;
}

- (void)downloadFile:(NSString *) fileName
{
    _fileName = [fileName mutableCopy];
    
    NSString *url = [serverHttpUrl copy];
    url = [url stringByAppendingString:configFilePath];
    url = [url stringByAppendingString:fileName];
    
    NSLog(@"%@",url);
    
    NSURL *nsurl = [NSURL URLWithString:url];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:nsurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0f];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"receive response");
    _data = [[NSMutableData alloc] init];
    
    _progressView.progress = 0;
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSDictionary *httpResponseHeaderFields = [httpResponse allHeaderFields];
    _totalLength = [[httpResponseHeaderFields objectForKey:@"Content-Length"] longLongValue];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //NSLog(@"receiving data");
    [_data appendData:data];
    [self updateProgress];
}

- (void)connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSLog(@"loading finish");
    
    NSString *savePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    savePath = [savePath stringByAppendingPathComponent:_fileName];
    NSLog(@"%@",savePath);
    [_data writeToFile:savePath atomically:YES];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",error.localizedDescription);
}

- (void) updateProgress
{
    if (_data.length == _totalLength) {
        NSLog(@"下载完成");
        [_alertView finishedProgress:@"正在加载..."];
        
    } else {
        [_alertView updateProgress:(float)_data.length/_totalLength];
    }
}


- (void) showESAlert
{
    [_alertView show];
}

/*
- (void) showProgressAlert
{
    _alertView = [[UIAlertView alloc] initWithTitle:@"下载配置文件"
                                            message:@"正在下载..."
                                           delegate:nil
                                  cancelButtonTitle:nil
                                  otherButtonTitles:nil, nil];
    //_progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    
    
    _progressLabel = [[UILabel alloc] init];
    _progressLabel.text = @"0%";
    
    //_progressView.frame = CGRectMake(10, 20, 100, 10);
    //_progressView.progress = 0.5f;
    _progressView.hidden = NO;
    
    [_alertView setValue:_progressView forKey:@"accessoryView"];
    //[_alertView setValue:_progressLabel forKey:@"accessoryView"];
    [_alertView show];
}
*/

@end
