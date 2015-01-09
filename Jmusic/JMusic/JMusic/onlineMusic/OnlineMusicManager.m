//
//  OnlineMusicManager.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "OnlineMusicManager.h"
#import "OnlineMusicDownloader.h"
#import "JSONKit.h"
#import "OnlineMusicList.h"

@implementation OnlineMusicManager

-(void)onFinished:(NSString *)result{
    NSLog(@"onLineMusicManager");
    NSRange range1 = [result rangeOfString:@"JsonCallback("];
    int startIndex = range1.length;

    range1 = [result rangeOfString:@"}]})"];
    int endIndex = range1.location+3-startIndex;
    NSRange range2 = {startIndex,endIndex};
    NSString *json = [result substringWithRange:range2];
 
    
//    json = @"{\"id\":\"1913719\", \"type\":3, \"url\":\"http://stream3.qqmusic.qq.com:0/1913719.wma\"}";
    
    NSMutableString * tmpJson = [[NSMutableString alloc] initWithString:json];
    NSRange range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"{retcode" withString:@"{\"retcode\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"songlist" withString:@"\"songlist\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"{id" withString:@"{\"id\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"type" withString:@"\"type\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"url" withString:@"\"url\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"songName" withString:@"\"songName\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"singerId" withString:@"\"singerId\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"singerName" withString:@"\"singerName\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"albumId" withString:@"\"albumId\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"albumName" withString:@"\"albumName\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"albumLink" withString:@"\"albumLink\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
    [tmpJson replaceOccurrencesOfString:@"playtime" withString:@"\"playtime\"" options:NSCaseInsensitiveSearch range:range3];
    range3 = NSMakeRange(0,[tmpJson length]);
//    NSLog(@"json = %@",tmpJson);
    
//    NSString *json = @"{\"name\": \"Foo\",\"categories\": [{ \"name\": \"Bar Category 1\" },{ \"name\": \"Bar Category 2\" },{ \"name\": \"Bar Category 3\" }]}";
//    NSDictionary* dic = [json objectFromJSONString];
//    Product *product = [[Product alloc] initWithDictionary:dic];
//    NSLog(@"%@",product.name);
//    NSLog(@"%d",[product.categories count]);
    
    NSDictionary* rootDic = [tmpJson objectFromJSONString];

    OnlineMusicList *list = [[OnlineMusicList alloc]initWithDictionary:rootDic];
//    NSLog(@"%@",list);
    if (self.delegate != nil) {
        [self.delegate onSongListFinished:list];
    }

}

-(void)getOnlineMusics:(NSString *)url{
    OnlineMusicDownloader *downloader = [[OnlineMusicDownloader alloc] init];
    downloader.delegate = self;
    [downloader startDownloadWithURLString:url];
}

@end
