//
//  page0VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page0VC.h"
#import "SPCycleScrollView.h"
#import "SecondViewController.h"


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kCycleScrollViewH 200

#define isIPhoneX [UIScreen mainScreen].bounds.size.height >= 812
#define topMargin (isIPhoneX ? 44 : 0)
#define bottomMargin (isIPhoneX ? 34 : 0)
#define statusBarH (isIPhoneX ? 44 : 20)
#define kHeadHeight    300

#define HScreen [[UIScreen mainScreen] bounds].size.height
#define WScreen [[UIScreen mainScreen] bounds].size.width

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface page0VC ()<UITableViewDataSource, UITableViewDelegate, SPCycleScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) SPCycleScrollView *cycleScrollView;

@property (nonatomic, strong) NSArray *localPhotos;

@property (nonatomic, strong) NSArray *urlPhotos;

@property (nonatomic,strong)UIScrollView *scollerTop;
@property (nonatomic,strong)UIScrollView *scollerView;

@property (nonatomic, strong) NSMutableArray *tableArray;

@property (nonatomic, assign) CGPoint lastContentOffset;



@end

struct CellData {
    NSString *url;
    NSString *title;
    UITableViewCell *cell;
};



static NSMutableArray *_Array0,*_ArrayUrl,*_ArrayImg0,*_ArrayTitle;
static bool newsToken;
NSArray *_Array,*_ArrayMp4Url,*_ArrayImg;

NSString *url;//跨页面传递的URL新闻地址
@implementation page0VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.;
    //图片
    newsToken=false;
    NSLog(@"加载新闻列表");
    NSURL *url1 = [NSURL URLWithString:@"https://c.m.163.com/nc/article/headline/T1348647853363/0-20.html"];
    NSURLRequest *req1 = [[NSURLRequest alloc]initWithURL:url1 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //其实代码就是在这里写成了异步处理而已。而且用了一个回调，用来检测是否出现错误。
     [NSURLConnection sendAsynchronousRequest:req1 queue:[NSOperationQueue mainQueue]
                            completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                                if (connectionError==0) {
                                    //将json数据转字符串
                                    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                    //字符串转码
                                    NSString *zhuanma = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                                    NSData *jsonData = [zhuanma dataUsingEncoding:NSUTF8StringEncoding];
                                    NSError *err;
                                    //转字典
                                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:&err];
                                    
                                    NSArray *value = [dic objectForKey:@"T1348647853363"];
                                    //NSLog(@"%@",zhuanma);
                                
                                
                                    
                                    
                                    _Array0=[[NSMutableArray alloc] init];//docid存储
                                    _ArrayTitle=[[NSMutableArray alloc] init];
                                    _ArrayUrl=[[NSMutableArray alloc] init];//新闻详情页
                                    //NSMutableArray *titleAdd = [[NSMutableArray alloc] init];
                                    
                                    for (int i = 0; i < value.count; i ++) {
                                        NSString *str4 = [value[i] valueForKey:@"docid"];
//                                        NSString *mp4url = [value[i] valueForKey:@"mp4_url"];
//                                        NSString *img = [value[i] valueForKey:@"cover"];
                                        NSString *title0 = [value[i] valueForKey:@"title"];
                                        [_Array0 addObject:str4];
                                        [_ArrayTitle addObject:title0];
                                        
                                        NSLog(@"标题是：%@", _ArrayTitle[i]);
                                        
                                        NSString *str0=[NSString stringWithFormat:@"https://c.m.163.com/news/a/%@.html?spss=newsapp",_Array0[i]];
                                        //NSLog(@"测试链接**********************************");
                                        [_ArrayUrl addObject:str0];
                                        //NSLog(@"显示新闻链接：%@",_ArrayUrl[i]);
                                    }
                                   // NSLog(@"array has filled!");
                                    //NSLog(@"**************************");
                                    //_tableView.dataSource=self;
                                    NSLog(@"新闻列表加载 完毕");
                                    newsToken=true;
                                }
                                else
                                {
                                    NSLog(@"报错");
                                    //NSLog(@"%@",connectionError);
                                    
                                }
                            }];
    
    //视频
    NSLog(@"****************************");
    NSURL *url2 = [NSURL URLWithString:@"https://c.m.163.com/nc/video/home/0-20.html"];
    NSURLRequest *req2 = [[NSURLRequest alloc]initWithURL:url2 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //其实代码就是在这里写成了异步处理而已。而且用了一个回调，用来检测是否出现错误。
     [NSURLConnection sendAsynchronousRequest:req2 queue:[NSOperationQueue mainQueue]
                            completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                                if (connectionError==0) {
                                    //将json数据转字符串
                                    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                    //字符串转码
                                    NSString *zhuanma = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                                    NSData *jsonData = [zhuanma dataUsingEncoding:NSUTF8StringEncoding];
                                    NSError *err;
                                    //转字典
                                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                                        options:NSJSONReadingMutableContainers
                                                                                          error:&err];
                                    
                                    NSArray *value = [dic objectForKey:@"videoList"];
                                    
                                    //爬取数据
                                    _Array=[[NSMutableArray alloc] init];
                                    _ArrayMp4Url=[[NSMutableArray alloc] init];
                                    _ArrayImg=[[NSMutableArray alloc] init];//我们使用多个数组来存放视屏地址和标题以及图片
                                    //NSMutableArray *titleAdd = [[NSMutableArray alloc] init];

                                    for (int i = 0; i < value.count; i ++) {
                                        NSString *str2 = [value[i] valueForKey:@"title"];
                                        NSString *mp4url = [value[i] valueForKey:@"mp4_url"];
                                        NSString *img = [value[i] valueForKey:@"cover"];
                                        [_Array addObject:str2];
                                        [_ArrayMp4Url addObject:mp4url];
                                        [_ArrayImg addObject:img];
                                       // [titleAdd addObject:str2];
                                        // NSLog(@"打印标题");
                                        // [self->_Array addObject:[Province provinceWithCities:@" ":@[[value[i] objectForKey:@"title"]]]];
                                        // NSLog(@"标题是：%@", _Array[i]);
                                        // NSLog(@"标题是：%@",titleAdd[i]);
                                    }
                                    NSLog(@"array has filled!");
                                    //_tableView.dataSource=self;
                                    }
                                else{
                                    NSLog(@"报错");
                                    NSLog(@"%@",connectionError);
                                }
                            }];
    [self.view addSubview:self.tableView];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    // 本地图片数组
    self.localPhotos = @[@"景1.jpg",@"景2.jpg",@"景3.jpg",@"景4.jpg",@"景5.jpg",@"dog.gif"];
    
    // 网络图片数组
    self.urlPhotos = @[
                       @"http://pic-bucket.ws.126.net/photo/0001/2019-06-18/EHVJQU8Q00AP0001NOS.jpg",
                       @"http://10.10.254.10/cache/5/04/cms-bucket.ws.126.net/daaddd061e7f00030cd690ca69604eb4/69132480ba0b4e61867a7e6397bb774d.png",
                       @"http://cms-bucket.ws.126.net/2019/06/18/1790b80fd24a4895aba03788b815a5f0.png",
                       @"http://cms-bucket.ws.126.net/2019/06/18/3a504ff41e9f41e8aa52e84d653d866d.png",
                       @"http://cms-bucket.ws.126.net/2019/06/18/b561b6a8483848dba490c33296f1d6d3.png",
                       @"http://cms-bucket.ws.126.net/2019/06/18/31f796e525e04e9cb38f0a5a43b69cb6.png",
                       @"http://cms-bucket.ws.126.net/2019/06/18/63f05941a79a446480145ee77faf9f73.png",
                       @"http://cms-bucket.ws.126.net/2019/06/18/a52038602d38408eb0ec6845ce9e2abb.png"
                       ];
    
    // 示例1
    //    [self localTest1];
    
    // 示例2
    //    [self localTest2];
    
    // 示例3
    //    [self urlTest3];
    
    // 示例4
    [self urlTest3];
    
    
    // 不要直接把self.headerView赋值给tableView.tableHeaderView,否则无法实现下拉放大
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kCycleScrollViewH)];
    [tableHeaderView addSubview:self.cycleScrollView];
    
    self.tableView.tableHeaderView = tableHeaderView;
    

}




-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 图片存于pic中
        UIImage *image = [UIImage imageNamed:@"xinwen.png"];
        CGImageRef imageRef = image.CGImage;
        self.tabBarItem.image = [[UIImage imageWithCGImage:imageRef scale:2 orientation:
                                          UIImageOrientationDown] imageWithRenderingMode:
                                         UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.cycleScrollView adjustWhenControllerViewWillAppear];
    
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - 本地图片示例
// 示例1    本地图片,类方法创建
- (void)localTest1 {
    
    SPCycleScrollView *cycleScrollView = [SPCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kCycleScrollViewH) localImages:self.localPhotos placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.cycleScrollView = cycleScrollView;
}

// 示例2    本地图片,alloc init创建
- (void)localTest2 {
    SPCycleScrollView *cycleScrollView = [[SPCycleScrollView alloc] init];
    self.cycleScrollView = cycleScrollView;
    cycleScrollView.frame = CGRectMake(0, 0, kScreenWidth, kCycleScrollViewH);
    cycleScrollView.pageControl.pageIndicatorTintColor = [UIColor redColor];
    cycleScrollView.pageControl.hidesForSinglePage = NO;
    cycleScrollView.localImages = self.localPhotos;
    //    cycleScrollView.autoScroll = NO;
    
}

#pragma mark - 网络图片示例
// 示例3    网络图片,类方法创建
- (void)urlTest3 {
    SPCycleScrollView *cycleScrollView = [SPCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kCycleScrollViewH) urlImages:self.urlPhotos placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    cycleScrollView.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    self.cycleScrollView = cycleScrollView;
}

// 示例4    网络图片,alloc init创建
- (void)urlTest4 {
    SPCycleScrollView *cycleScrollView = [[SPCycleScrollView alloc] init];
    cycleScrollView.frame = CGRectMake(0, 0, kScreenWidth, kCycleScrollViewH);
    cycleScrollView.pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"currentDot"];
    cycleScrollView.pageControl.pageIndicatorImage = [UIImage imageNamed:@"otherDot"];
    cycleScrollView.pageControlPosition = SPPageContolPositionBottomRight;
    
    //    cycleScrollView.titleLabelBackgroundColor = [UIColor clearColor];
    //    cycleScrollView.titleLabelTextColor = [UIColor redColor];
    //    cycleScrollView.titleLabelFont = [UIFont boldSystemFontOfSize:16];
    cycleScrollView.urlImages = self.urlPhotos;
    cycleScrollView.titles = @[@"两只小猫咪",@"两只小狗",@"戴毛巾的狗",@"gif图",@"好难过",@"含情脉脉",@"3只狗吐舌头",@"一只浪漫多情的狗"];
    
    self.cycleScrollView = cycleScrollView;
    
}

#pragma mark - SPCycleScrollViewDelegate
- (void)cycleScrollView:(SPCycleScrollView *)cycleScrollView clickedImageAtIndex:(NSUInteger)index {
    NSLog(@"代理方式:点击了第%zd张图片",index);
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    //a.定义重用标示,static 静态变量,初始化一次, 降低内存的消耗
    //static NSString *identifier = @"CELL";
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld",indexPath.row];
    //b.去重用队列中根据标识符取可重用的 cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  //  cell.backgroundColor=[UIColor lightGrayColor];
    //c. 判断是否获取到可重用的 cell( 最后要空间释放 )
    if (!cell) {//!cell 相当于 cell == nil
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
       // extern NSArray *_ArrayTitle;
        //NSLog(@"title:%@",_ArrayTitle[indexPath.row]);
       // cell.textLabel.text=@"aa";}
        //cell.textLabel.text = _ArrayTitle[(long)indexPath.row];
       // cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
        //多线程去等待
        
        struct NewsItem item;
        item.i=indexPath.row;
        item.cell=cell;
        
        NSValue *param = [NSValue valueWithBytes:&item objCType:@encode(struct NewsItem)];
        [NSThread detachNewThreadSelector:@selector(threadLoadingNews:) toTarget:self withObject:param];
        
    }
    
    return cell;
}



- (void)threadLoadingNews:(NSValue *)_data{
    struct NewsItem data;
    [_data getValue: &data];
    //while等待资源加载
    while(!newsToken){
        //在线程中等待，直到资源加载完毕，再填充
        NSLog(@"还木有加载完成哦。。好蓝瘦");
    }
    NSLog(@"完成惹!!!");
    data.cell.textLabel.text=[NSString stringWithFormat:@"%@",_ArrayTitle[data.i]];
                              
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    url=[[NSString alloc]initWithFormat:@"%@",_ArrayUrl[(long)indexPath.row]];//j获取数据链接push到新页面
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SecondViewController *secVc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secVc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat width = self.view.frame.size.width;
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (scrollView == self.tableView) {
        
        // 偏移的y值
        if(offsetY < 0) {
            CGFloat totalOffset = kCycleScrollViewH + fabs(offsetY);
            CGFloat f = totalOffset / kCycleScrollViewH;
            // 拉伸后的图片的frame应该是同比例缩放。
            self.cycleScrollView.frame = CGRectMake(-(width*f-width) / 2.0, offsetY, width * f, totalOffset);
        }
    }
}

// 这2个方法几乎可以不实现，这里z实现的目的为了解决下拉放大时的那一刻刚好碰到轮播图在切换的时候可能会闪一下，尽管这种几率很小，实现下面两个代理方法后就可以避免这个问题
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.cycleScrollView.autoScroll = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.cycleScrollView.autoScroll = YES;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topMargin, kScreenWidth, kScreenHeight-topMargin-bottomMargin) style:UITableViewStylePlain];
        //_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topMargin, kScreenWidth, kScreenHeight-topMargin-bottomMargin) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
