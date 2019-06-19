
//
//  ScanResultVC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

//屏幕宽度、高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "ScanResultVC.h"
#import "page2VC.h"
//#import "UIBarButtonItem+Extension.h"

@interface ScanResultVC ()

@end

@implementation ScanResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self buildLeftItem];
    [self buildUI];
    [self buildLeftItem];
}
- (void)buildLeftItem
{
    //UIBarButtonItem *leftItem = [UIBarButtonItem  target:self action:@selector(back)];
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回我的" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
//    self.navigationItem.hidesBackButton = YES;
//    self.navigationItem.backBarButtonItem = leftItem;
    UIImage* backImage = [UIImage imageNamed:@"fanhui.png"];
    
    CGRect backframe = CGRectMake(0,0,54,30);
    
    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
    
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
   // [backButton setTitle:@"返回我的" forState:UIControlStateNormal];
    //backButton.backgroundColor=[UIColor blackColor];
    backButton.titleLabel.font=[UIFont systemFontOfSize:13];
    [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.hidesBackButton = YES;
    //UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
  
}

- (void)buildUI
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, ScreenWidth-40, 20)];
    label.textColor = [UIColor blackColor];
    label.text =[NSString stringWithFormat:@"扫描结果是：%@",_result];
    [self.view addSubview:label];
    
}


- (void)back:(UIButton *)btn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
