//
//  TudouDownloader.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "TudouDownloader.h"

@implementation TudouDownloader

-(void)startDownload:(NSString *)urlString{
    
    self.receivedData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    NSLog(@"MV list start dowloading");
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{

    [self.receivedData appendData:data];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{

    
    NSString * result = [[NSString alloc] initWithData:[self receivedData] encoding:NSUTF8StringEncoding];
//    NSLog(@"数据请求完成 %@",result);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    if (self.delegate) {
        [self.delegate onMVListFinished:result];
    }else{
        NSLog(@"delegate = nil");
    }
}


@end
