//
//  MusicListTableViewController.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/8.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "MusicListTableViewController.h"
#import "GlobalOnlineMusic.h"
#import "NetUtil.h"
#import "SVProgressHUD.h"
#import "OnlineMusicManager.h"
#import "OnlineMusicDownloader.h"

@interface MusicListTableViewController ()

@end

@implementation MusicListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *catergory = [[GlobalOnlineMusic getSingleton] category];
    NSString *url = nil;
    if ([catergory isEqualToString:@"newSong"]) {
        self.title = @"新歌榜";
        url = @"http://music.qq.com/musicbox/shop/v3/data/hit/hit_newsong.js";
    }else{
        url = @"http://music.qq.com/musicbox/shop/v3/data/hit/hit_all.js";
        self.title = @"总歌榜";
    }
    
    [self loadMusicData:url];
}

-(void)loadMusicData:(NSString *)url{
    
    NSString *result = [[NetUtil sharedSingleton] getNet];
    if (![result isEqualToString:@"wifi"]) {
        [SVProgressHUD showImage:[UIImage imageNamed:@"action_delete.png"] status:@"没有检测到wifi信号"];
        return;
    }

    OnlineMusicManager *manager = [[OnlineMusicManager alloc] init];
    manager.delegate = self;
    [manager getOnlineMusics:url];
    [SVProgressHUD showWithStatus:@"榜单内容加载中..."];
}

-(void)onSongListFinished:(OnlineMusicList *)list{
    NSLog(@"onSongListFinished");
    [self setList:list];
    
    [self.tableView reloadData];
//    [SVProgressHUD showWithStatus:@"加载完成"];
    [SVProgressHUD showSuccessWithStatus:@"加载完成"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[self.list songlist] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"onlineMusicListCell" forIndexPath:indexPath];
    
    UILabel *lRow = (UILabel*)[cell viewWithTag:1];
    lRow.text = [NSString stringWithFormat:@"%d",[indexPath row]+1];
    
    UILabel *lSong = (UILabel*)[cell viewWithTag:2];
    lSong.text = [[self.list.songlist objectAtIndex:indexPath.row] songName];
    
    UILabel *lSinger = (UILabel*)[cell viewWithTag:3];
    lSinger.text = [[self.list.songlist objectAtIndex:indexPath.row] singerName];
    
    UILabel *lTime = (UILabel*)[cell viewWithTag:4];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"##.00;"];
    float playtime = [[[self.list.songlist objectAtIndex:indexPath.row] playtime] floatValue]/60;
    NSString *formattedNumber = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:playtime]];
    lTime.text = formattedNumber;
    
    
    return cell;
}

- (IBAction)dowloadMusick:(id)sender {
    
    UITableViewCell *cell = [[sender superview] superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    
    NSLog(@"row = %d",[path row]);
    
    OnlineMusicInfo *info = [self.list.songlist objectAtIndex:[path row]];
    
    NSString * title =[NSString stringWithFormat:@"是否下载%@-%@",info.songName,info.singerName];
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:title
                                                      delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [menu showInView:[UIApplication sharedApplication].keyWindow];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex = %d",buttonIndex);
    if (buttonIndex == 0) {
        NSLog(@"下载");
        
    }else{
       
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
