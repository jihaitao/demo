//
//  GlobalMusicPlayRow.m
//  BobMusic
//
//  Created by Angus Bob on 12-10-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GlobalMusicPlayRow.h"

@implementation GlobalMusicPlayRow
@synthesize musicPlayRow;
@synthesize musicTableViewArray;
@synthesize playStatus;
@synthesize nNewmusicPlayRow;
@synthesize streamer;
@synthesize qqMusicHitList;

@synthesize musicLrcArray;
@synthesize _lrc;


+ (GlobalMusicPlayRow*) sharedSingleton{
    static GlobalMusicPlayRow * sharedSingleton ;
    @synchronized(self){
        if (!sharedSingleton){
            sharedSingleton = [[GlobalMusicPlayRow alloc] init];
        }
        return sharedSingleton;
    }
}
@end
