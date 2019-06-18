//
//  SecondViewController.m
//  SPCarouselView
//
//  Created by 乐升平 on 2018/10/29.
//  Copyright © 2018 iDress. All rights reserved.
//

#import "SecondViewController.h"
#import "page0VC.h"

extern NSString *url;

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface SecondViewController ()

@property(nonatomic,strong) UIWebView *webView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(url);
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.view addSubview:_webView];
    [_webView loadRequest:request];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}


@end
