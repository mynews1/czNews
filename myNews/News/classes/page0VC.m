//
//  page0VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page0VC.h"

@interface page0VC ()

@end

NSArray *_Array,*_ArrayMp4Url,*_ArrayImg;

@implementation page0VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.;
    NSLog(@"page 1 has loaded");
    NSURL *rul = [NSURL URLWithString:@"https://c.m.163.com/nc/video/home/0-20.html"];
    NSURLRequest *req = [[NSURLRequest alloc]initWithURL:rul cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    //其实代码就是在这里写成了异步处理而已。而且用了一个回调，用来检测是否出现错误。
     [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue]
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
                                    NSLog(@"*********************************************************************************************************");
                                    
                                    
                                    
                                }
                                else
                                    NSLog(@"报错");
                                NSLog(@"%@",connectionError);
                            }];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
