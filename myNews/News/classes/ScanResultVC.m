
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
//#import "UIBarButtonItem+Extension.h"

@interface ScanResultVC ()

@end

@implementation ScanResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self buildLeftItem];
    [self buildUI];
}
//- (void)buildLeftItem
//{
//    UIBarButtonItem *leftItem = [UIBarButtonItem barButtonItemWithTitle:@"返回" target:self action:@selector(back)];
//    self.navigationItem.leftBarButtonItem = leftItem;
//}

- (void)buildUI
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 64, ScreenWidth-40, 20)];
    label.textColor = [UIColor blackColor];
    label.text =[NSString stringWithFormat:@"扫描结果%@",_result];
    [self.view addSubview:label];
}


- (void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
