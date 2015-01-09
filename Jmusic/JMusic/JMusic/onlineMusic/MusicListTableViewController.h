//
//  MusicListTableViewController.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OnlineMusicManager.h"
#import "OnlineMusicList.h"
#import "OnlineMusicInfo.h"
@interface MusicListTableViewController : UITableViewController<OnlineMusicMangagerDelegate,UIActionSheetDelegate>

@property OnlineMusicList *list;

@end
