//
//  GlobalOnlineMusic.h
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalOnlineMusic : NSObject{
    NSString *_category;
}
+(GlobalOnlineMusic*) getSingleton;
@property NSString *category;
@end
