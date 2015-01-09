//
//  GlobalOnlineMusic.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "GlobalOnlineMusic.h"

@implementation GlobalOnlineMusic
+(GlobalOnlineMusic*) getSingleton{
    
    static GlobalOnlineMusic *singleton;
    @synchronized(self){
        
        if (singleton == nil) {
            singleton = [[GlobalOnlineMusic alloc] init];
        }
        return singleton;
    }
}
@end
