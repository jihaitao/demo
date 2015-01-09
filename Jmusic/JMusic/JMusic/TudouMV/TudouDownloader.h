//
//  TudouDownloader.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TudouMVDownloaderDelegate <NSObject>

-(void)onMVListFinished:result;

@end

@interface TudouDownloader : NSObject<NSURLConnectionDataDelegate>{

    NSMutableData *_receivedData;
}

@property NSMutableData *receivedData;
@property NSURLConnection *connection;
-(void)startDownload:(NSString *)urlString;

@property id<TudouMVDownloaderDelegate> delegate;
@end
