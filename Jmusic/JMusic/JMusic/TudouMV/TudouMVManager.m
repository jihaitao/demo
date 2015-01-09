//
//  TudouMVManager.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "TudouMVManager.h"
#import "TudouDownloader.h"

@implementation TudouMVManager

-(void) getMVList:(NSString *)urlString{

    TudouDownloader *downloader = [[TudouDownloader alloc] init];
    downloader.delegate = self;
    [downloader startDownload:urlString];

}

-(void)onMVListFinished:(id)result{
    NSLog(@"result = %@",result);
}

@end
