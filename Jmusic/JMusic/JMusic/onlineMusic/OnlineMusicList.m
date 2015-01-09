//
//  OnlineMusicList.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "OnlineMusicList.h"

@implementation OnlineMusicList
+ (Class)songlist_class {
    return [OnlineMusicInfo class];
}

@end
