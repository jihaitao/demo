//
//  OnlineMusicManager.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnlineMusicDownloader.h"
#import "OnlineMusicList.h"

@protocol OnlineMusicMangagerDelegate <NSObject>

-(void)onSongListFinished:(OnlineMusicList*)list;

@end


@interface OnlineMusicManager : NSObject<OnlineMusicDownloaderDelegate>{

}

-(void)getOnlineMusics:(NSString*) url;

@property id<OnlineMusicMangagerDelegate> delegate;

@end
