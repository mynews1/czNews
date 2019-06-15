//
//  page1VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page1VC.h"
#import "page0VC.h"
#import "MediaCell.h"
#import "MediaPlayer/MediaPlayer.h"
#import "AVKit/AVKit.h"
#import <AVFoundation/AVFoundation.h>

#define kToolViewHieght 40
@interface page1VC ()<AVPlayerViewControllerDelegate>

@property (nonatomic, strong) AVPlayerViewController * playerView;

/* 播放器 */

//@property (nonatomic, strong)
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) MPMoviePlayerController *MPPlayer;

//播放器基本
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;


@end

@implementation page1VC


//-(void)playUrl:(NSString *)url{
//    //传入URL，调用函数播放视频
//    NSURL *_url=[NSURL URLWithString:url];
//    MPMoviePlayerController *MPPlayer = [[MPMoviePlayerController alloc]initWithContentURL:_url]; //将传入的url用于初始化播放qi
//    //设置播放器的视图
//    [self.view addSubview:MPPlayer.view];
//    MPPlayer.view.frame = self.view.bounds;
//    self.MPPlayer = MPPlayer;
//
//    //适配播放器View，实现旋转
//    [self.MPPlayer.view setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:@{@"view":self.MPPlayer.view}]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:@{@"view":self.MPPlayer.view}]];
//    //准备播放
//    [self.MPPlayer prepareToPlay];
//    [self.MPPlayer play];
//}




#pragma mark *** AVPlayerViewControllerDelegate ***
- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
-(void)playUrl:(NSString *)url{

    //传入URL t调用函数播放视频
//    NSURL *_url = [NSURL URLWithString:url];
//    _playerItem = [[AVPlayerItem alloc] initWithURL:_url];
//    _player = [AVPlayer playerWithPlayerItem:_playerItem];
//    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
//    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
//    //[self.view addSubview:_player];
//    [self.view.layer addSublayer:_playerLayer];
//    [_player play];

    // 配置媒体播放控制器
    _playerView = [[AVPlayerViewController alloc]  init];
    // 设置媒体源数据
    _playerView.player = [AVPlayer playerWithURL:[NSURL URLWithString:url]];
    // 设置拉伸模式
    _playerView.videoGravity = AVLayerVideoGravityResizeAspect;
    // 设置是否显示媒体播放组件
    _playerView.showsPlaybackControls = YES;
    // 设置大力
    _playerView.delegate = self;
    // 播放视频
    [_playerView.player play];
    // 设置媒体播放器视图大小
    _playerView.view.bounds = CGRectMake(0, 0, 350, 300);
    _playerView.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), 64 + CGRectGetMidY(_playerView.view.bounds) + 30);
    // 4、推送播放
    // 推送至媒体播放器进行播放
    // [self presentViewController:_playerViewController animated:YES completion:nil];
    // 直接在本视图控制器播放
    [self addChildViewController:_playerView];
    [self.view addSubview:_playerView.view];

    
    //根据媒体资源地址创建AVPlayerItem
    NSURL *_url = [NSURL URLWithString:url];
    _playerItem = [[AVPlayerItem alloc] initWithURL:_url];
    //根据AVPlayerItem创建媒体播放器
    _player = [[AVPlayer alloc] initWithPlayerItem:_playerItem];
    //创建AVPlayerLayer，用于呈现视频
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    _playerLayer.frame = CGRectMake(0, 100, 375, 300);
    [self.view.layer addSublayer:_playerLayer];
    
    [_player play];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark 一共有多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark 第section组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //第几组的总行数
    return 19;
}

#pragma mark 每一行的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //cell重用机制(复用机制),用于降低内存消耗
    //方法内部的实现
    //a.定义重用标示,static 静态变量,初始化一次, 降低内存的消耗
    static NSString *identifier = @"CELL";
    //b.去重用队列中根据标识符取可重用的 cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //c. 判断是否获取到可重用的 cell( 最后要空间释放 )
    if (!cell) {//!cell 相当于 cell == nil
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
   // cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    extern NSArray *_Array,*_ArrayMp4Url;
    cell.textLabel.text=_Array[indexPath.row];
    //现在我们先给cell添加点击事件试试
    return cell;
}

// 选中了 cell 时触发，我们主要在这里实现视屏的播放操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"测试");
    extern NSArray *_Array,*_ArrayMp4Url;
    NSLog(@"视频地址为 %@", _ArrayMp4Url[(long)indexPath.row]);
    //函数写好了，我们调用他就可以啦
    [self playUrl:_ArrayMp4Url[(long)indexPath.row]];
}

#pragma mark  - 滑到最底部
- (void)scrollTableToFoot:(BOOL)animated
{
    NSInteger s = [self.tableView numberOfSections];  //有多少组
    if (s<1) return;  //无数据时不执行 要不会crash
    NSInteger r = [self.tableView numberOfRowsInSection:s-1]; //最后一组有多少行
    if (r<1) return;
    NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1];  //取最后一行数据
    [self.tableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:animated]; //滚动到最后一行
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    UIImage *image = [UIImage imageNamed:@"shipin.png"];
    CGImageRef imageRef = image.CGImage;
    self.tabBarItem.image = [[UIImage imageWithCGImage:imageRef scale:2 orientation:
                                          UIImageOrientationDown] imageWithRenderingMode:
                                         UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}



@end
