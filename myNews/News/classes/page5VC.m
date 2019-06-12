//
//  page5VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

//#import "page5VC.h"
//
//@interface page5VC ()
//
//@end
//
//@implementation page5VC
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end

#import "page5VC.h"
#import <AVFoundation/AVFoundation.h><AVCaptureMetadataOutputObjectsDelegate>

@interface page5VC ()

@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (weak, nonatomic) IBOutlet UIView *outputView;//xib中扫描的View
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (strong, nonatomic) NSTimer * timer;//为了做扫描动画的定时器
@property (strong, nonatomic) UIImageView * lineImage;//扫描动画的横线

@end

@implementation page5VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.view.backgroundColor = [UIColor whiteColor];
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

