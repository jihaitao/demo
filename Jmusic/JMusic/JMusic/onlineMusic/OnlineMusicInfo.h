//
//  OnlineMusicInfo.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"

@interface OnlineMusicInfo : Jastor

@property (nonatomic,copy)NSString *id;
@property int type;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *songName;
@property (nonatomic,copy)NSString *singerId;
@property (nonatomic,copy)NSString *singerName;
@property (nonatomic,copy)NSString *albumId;
@property (nonatomic,copy)NSString *albumName;
@property (nonatomic,copy)NSString *albumLink;
@property (nonatomic,copy)NSString *playtime;


@end
