//
//  OnlineMusicList.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "OnlineMusicInfo.h"

@interface OnlineMusicList : Jastor

@property (nonatomic, copy) NSString *retcode;
@property (nonatomic,retain) NSArray *songlist;

@end
