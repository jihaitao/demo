//
//  OnlineMusicDownloader.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "OnlineMusicDownloader.h"
#import <UIKit/UIKit.h>

@implementation OnlineMusicDownloader

-(void)startDownloadWithURLString:(NSString *)urlString{

    NSLog(@"startDownloadWithURLString = %@",urlString);
    self.receivedData = [NSMutableData data];
    _connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] delegate:self];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

-(void)cancelDownload{
    if (_connection != nil) {
        [self.connection cancel];
        self.connection = nil;
        self.receivedData = nil;
    }

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError");
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
     NSLog(@"didReceiveAuthenticationChallenge");

}

-(void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    NSLog(@"didCancelAuthenticationChallenge");
}

-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    NSLog(@"willSendRequestForAuthenticationChallenge");
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [[self receivedData] appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString * result = [[NSString alloc] initWithData:[self receivedData] encoding:gbkEncoding];
    NSLog(@"数据请求完成");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    if (self.delegate) {
        [self.delegate onFinished:result];
    }else{
        NSLog(@"delegate = nil");
    }
}

@end
