//
//  page1VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page1VC.h"
#import "page0VC.h"
#import "MediaPlayer/MediaPlayer.h"
#import "AVKit/AVKit.h"
#import <AVFoundation/AVFoundation.h>

#define kToolViewHieght 40
@interface page1VC ()<AVPlayerViewControllerDelegate>

@property (nonatomic, strong) AVPlayerViewController * playerView;

/* 播放器 */

//@property (nonatomic, strong)
@property(nonatomic,strong)UITableView *tableView;//播放器基本
@property (nonatomic, strong) UIView *win;
@property (nonatomic, strong) UIButton *btn_close;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

//增加一个关闭按钮
@property (nonatomic, strong) UIControl *closeControl;

@property (weak, nonatomic)UIImageView *backgroundImage;

@end
struct CellData {
    NSString *url;
    NSString *title;
    UITableViewCell *cell;
};
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@implementation page1VC


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
- (void) pressBtn:(UIButton *)btn{//关闭视频按钮的逻辑
    NSLog(@"clicked!");
      UIApplication *ap = [UIApplication sharedApplication];
    //[ap.keyWindow removeFromSuperview];
    NSArray *viewsToRemove = [ap.keyWindow subviews];
    NSLog(@"%@",viewsToRemove);
    _win.frame=CGRectMake(0,0,0,0);
   //移除掉最上层view
    [UIView animateWithDuration:0.2
                     animations:^{
                         [UIView new].alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [ viewsToRemove[1]  removeFromSuperview];
                     }];
    

    _playerView=nil;
    _player=nil;
    _playerItem=nil;
    _playerLayer=nil;//释放player对象
    _btn_close=nil;
    _win=nil;
}
-(void)playUrl:(NSString *)url{

    // 配置媒体播放控制器
    _playerView = [[AVPlayerViewController alloc]  init];
    // 设置媒体源数据
    _playerView.player = [AVPlayer playerWithURL:[NSURL URLWithString:url]];
    // 设置拉伸模式
    _playerView.videoGravity = AVLayerVideoGravityResizeAspect;
    // 设置是否显示媒体播放组件
    _playerView.showsPlaybackControls = YES;
    //开启这个所有 item 播放完毕可以退出全屏
    _playerView.exitsFullScreenWhenPlaybackEnds = YES;
    // 设置大力
    _playerView.delegate = self;
    // 播放视频
    [_playerView.player play];
    // 设置媒体播放器视图大小
    _playerView.view.bounds = CGRectMake(0, 0, 350, 300);
    _playerView.view.center = CGPointMake(CGRectGetMidX(self.view.bounds), 64 + CGRectGetMidY(_playerView.view.bounds) + 30);
    
    // 4、推送播放
    // 推送至媒体播放器进行播放
    //[self presentViewController:_playerViewController animated:YES completion:nil];
    // 直接在本视图控制器播放
    
    _btn_close = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btn_close setFrame:CGRectMake(130, 50, 60, 30)];
    [_btn_close setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    //[_btn_close setTitle:@"关闭视频" forState:UIControlStateNormal];
    _btn_close.titleLabel.font = [UIFont systemFontOfSize:12];
    //_btn_close.backgroundColor=[UIColor redColor];
    [_btn_close addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchDown];//给退出按钮添加事件
    _win=[[UIView alloc]initWithFrame:CGRectMake(0, 30, 350, 330)];
   
    [_win addSubview:_playerView.view];
    [_win addSubview:_btn_close];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50,20, 30, 30)];
//
//    view.backgroundColor = [UIColor whiteColor];
//
//    view.layer.masksToBounds =YES;
//
//    view.layer.cornerRadius =15;
    
    //获取当前UIWindow 并添加一个视图
   
    UIApplication *ap = [UIApplication sharedApplication];
    [ap.keyWindow addSubview:_win];
    
    
    
    //[self addChildViewController:_playerView];
    //[self.view addSubview:_playerView.view];
    
//    //3 再把AVPlayer放到 AVPlayerLayer上
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player]; [self.view.layer addSublayer:playerLayer];
//    playerLayer.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.width);
   
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
//
//    playerLayer.masksToBounds= YES;
//
//    //playerLayer.borderColor = [UIColor redColor].CGColor;
//
//    playerLayer.borderWidth = 5.0f;
//
//    playerLayer.cornerRadius = 20.0f;
//
////    playerLayer.frame = self.clipView.bounds;
////
////    [self.clipView.layer addSublayer:playerLayer];
//    _playerLayer.frame = CGRectMake(0, 0, 350, 300);
//    [self.view.layer addSublayer:_playerLayer];
//
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
    extern NSArray *_Array,*_ArrayMp4Url,*_ArrayImg;    //cell重用机制(复用机制),用于降低内存消耗
    //方法内部的实现
    //a.定义重用标示,static 静态变量,初始化一次, 降低内存的消耗
    //static NSString *identifier = @"CELL";
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    //b.去重用队列中根据标识符取可重用的 cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor=[UIColor lightGrayColor];
    //c. 判断是否获取到可重用的 cell( 最后要空间释放 )
    if (!cell) {//!cell 相当于 cell == nil
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];

       
      // [ self downloadImg:_ArrayImg[(long)indexPath.row] :cell :_Array[(long)indexPath.row]];//现在我们把这个放到线程就可以了
        
        struct CellData data;
        data.cell=cell;
        data.title=_Array[(long)indexPath.row];
        data.url=_ArrayImg[(long)indexPath.row];
        
        NSValue *param = [NSValue valueWithBytes:&data objCType:@encode(struct CellData)];
        [NSThread detachNewThreadSelector:@selector(downloadImg:) toTarget:self withObject:param];
        
    }
    cell.textLabel.text=@"loading";
     
    NSLog(@"图片加载完成");
    //现在我们先给cell添加点击事件试试
    return cell;
}
- (void)downloadImg:(NSValue *) _data{
    //同步加载图片
   // NSURL *url=[NSURL URLWithString:_ArrayImg[(long)indexPath.row]];
    //NSLog(url);
    struct CellData data;
    [_data getValue: &data];
    NSLog(@"%@",data.url);
    NSString *_url=data.url;
    NSString *title=data.title;
    UITableViewCell *cell=data.cell;
    NSURL *url=[NSURL URLWithString:_url];
    NSData *imgdata=[NSData dataWithContentsOfURL:url];
    //UIImage *image =[UIImage imageWithData: imgdata];
    //图片加载完毕，开始填充
     UIImageView *userCellView=[[UIImageView alloc]init];
    //UIImageView *userCellView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-40, 210)];
    // CGFloat imageHeight = image.size.height * SCREEN_WIDTH/image.size.width;
    userCellView.image=[UIImage imageWithData:imgdata];
    userCellView.frame= CGRectMake(0, 30, SCREEN_WIDTH,180);
    UILabel *text=[[UILabel alloc] initWithFrame:CGRectMake(0,10, 270,10)];//x,y，宽，高
    text.text=title;
    text.backgroundColor = [UIColor lightGrayColor];
    //text.text=[NSString stringWithFormat:@"%d",indexPath.row];
    text.shadowColor=[UIColor clearColor];//添加阴影
    text.shadowOffset=CGSizeMake(1.0, 1.0);
    
    [cell addSubview:userCellView];
    [cell addSubview:text];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat
{
    //H = H*(SCREEN_WIDTH/W) = 高度*(屏幕/图片宽)
    //CGFloat imageHeight = image.size.height * SCREEN_WIDTH/image.size.width;
    return 210;

}



// 选中了 cell 时触发，我们主要在这里实现视屏的播放操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"测试");
    extern NSArray *_Array,*_ArrayMp4Url;
    NSLog(@"视频地址为 %@", _ArrayMp4Url[(long)indexPath.row]);
    //函数写好了，我们调用他就可以啦
    [self playUrl:_ArrayMp4Url[(long)indexPath.row]];
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
