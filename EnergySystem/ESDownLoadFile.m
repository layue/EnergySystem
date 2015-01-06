//
//  ESDownLoadFile.m
//  EnergySystem
//
//  Created by tseg on 15-1-6.
//  Copyright (c) 2015年 tseg. All rights reserved.
//

#import "ESDownLoadFile.h"

@implementation ESDownLoadFile

- (void)downloadFile
{
    NSString *url = @"http://10.103.241.63:8080/EnergySystem/resources/downloads/1.cfg";
    NSURL *nsurl = [NSURL URLWithString:url];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:nsurl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0f];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"receive response");
    _data = [[NSMutableData alloc] init];
    
    /*
    _processView.progress = 0;
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSDictionary *httpResponseHeaderFields = [httpResponse allHeaderFields];
    _totalLength = [[httpResponseHeaderFields objectForKey:@"Content-Length"] longLongValue];
     */
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"receiving data");
    [_data appendData:data];
    
    //[self updateProgress];
}

- (void)connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSLog(@"loading finish");
    
    NSString *savePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    savePath = [savePath stringByAppendingPathComponent:@"1.cfg"];
    NSLog(@"%@",savePath);
    [_data writeToFile:savePath atomically:YES];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",error.localizedDescription);
}


@end
