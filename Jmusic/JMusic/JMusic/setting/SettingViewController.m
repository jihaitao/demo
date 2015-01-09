//
//  SettingViewController.m
//  JMusic
//
//  Created by 陆 海涛 on 15/1/9.
//  Copyright (c) 2015年 jihaitao. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *downloadMusic;
@property (weak, nonatomic) IBOutlet UISwitch *downloadImages;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void )initView{
    
    NSString * downloadMusicTag = [[NSUserDefaults standardUserDefaults] objectForKey:@"downloadMusic"];
    NSLog(@"%@",downloadMusicTag);

    if (downloadMusicTag) {
        if ([downloadMusicTag isEqual:@"YES"]) {
            self.downloadMusic.on = YES;
        }else{
            self.downloadMusic.on = NO;
        }
    }
    
    NSString *downloadImagesTag = [[NSUserDefaults standardUserDefaults] objectForKey:@"downloadImages"];
    if (downloadMusicTag) {
        if ([downloadImagesTag isEqual:@"YES"]) {
            self.downloadImages.on = YES;
        }else{
            self.downloadImages.on = NO;
        }
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)downloadMusicSwitch:(id)sender {
    
    if (self.downloadMusic.isOn) {
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"downloadMusic"];
    }else{
     [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"downloadMusic"];
    }
    
}

- (IBAction)downloadImagesSwitch:(id)sender {
    if (self.downloadImages.isOn) {
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"downloadImages"];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"downloadImages"];
    }
}


@end
