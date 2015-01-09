//
//  TudouMVManager.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TudouDownloader.h"

@interface TudouMVManager : NSObject<TudouMVDownloaderDelegate>

-(void) getMVList:(NSString *)urlString;

@end
