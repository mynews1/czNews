//
//  page5VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page5VC.h"
#import "page4VC.h"
//屏幕宽度、高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#import <AVFoundation/AVFoundation.h><AVCaptureMetadataOutputObjectsDelegate>

@interface page5VC ()

@property(nonatomic,strong)UIButton *backBtn;

@end

@implementation page5VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.view.backgroundColor = [UIColor whiteColor];
    //test
    //底部view
    UIImageView * downView = [[UIImageView alloc] initWithFrame:CGRectMake(30, ScreenWidth, (ScreenWidth-60), (ScreenHeight-(self.view.center.y-(ScreenWidth-60)/2)))];
    downView.alpha = 0.5;
    downView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:downView];
    
    UIButton *cancleBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMinY(downView.frame), ScreenWidth-60, 60)];
    [cancleBtn setTitle:@"返回" forState:UIControlStateNormal];
    // [cancleBtn setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancleBtn];
    
    //[self.navigationController pushViewController:resultVC animated:YES];
    
}

- (void)cancleBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
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

