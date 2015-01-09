//
//  OnlineMusicDownloader.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OnlineMusicDownloaderDelegate <NSObject>
-(void) onFinished:(NSString*)result;

@end

@interface OnlineMusicDownloader : NSObject<NSURLConnectionDataDelegate>{
    NSMutableData *_receivedData;
    NSURLConnection *_connection;
    id<OnlineMusicDownloaderDelegate> _delegate;
}
-(void)startDownloadWithURLString:(NSString *)urlString;
-(void)cancelDownload;

@property NSMutableData *receivedData;
@property NSURLConnection *connection;
@property id<OnlineMusicDownloaderDelegate> delegate;
@end
