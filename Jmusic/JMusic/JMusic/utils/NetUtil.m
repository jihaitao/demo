//
//  NetUtil.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "NetUtil.h"
#import "Reachability.h"

@implementation NetUtil

+(NetUtil*)sharedSingleton{
    
    static NetUtil * singleton;
    
    @synchronized(self){
        if (singleton == nil) {
            singleton = [[NetUtil alloc] init];
        }
        return singleton;
    }
}


-(NSString*)getNet{
    NSString *result;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([reachability currentReachabilityStatus]) {
        case NotReachable:
            result = nil;
            break;
        case ReachableViaWWAN:
            result = @"3G";
            break;
        case ReachableViaWiFi:
            result = @"wifi";
            break;
        default:
            break;
    }
    
    return result;
    
}

@end
