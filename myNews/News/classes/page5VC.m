//
//  page5VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page5VC.h"
#import "page4VC.h"
#import <ContactsUI/ContactsUI.h>
//屏幕宽度、高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#import <AVFoundation/AVFoundation.h><AVCaptureMetadataOutputObjectsDelegate>

@interface page5VC ()

@property(nonatomic,strong)UIButton *backBtn;

@end

@interface page5VC ()<CNContactPickerDelegate>
{
    UIButton * btn;

}
@end

@implementation page5VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
//    //test
//    //底部view
//    UIImageView * downView = [[UIImageView alloc] initWithFrame:CGRectMake(30, ScreenWidth, (ScreenWidth-60), (ScreenHeight-(self.view.center.y-(ScreenWidth-60)/2)))];
//    downView.alpha = 0.5;
//    downView.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:downView];

//    UIButton *cancleBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMinY(downView.frame), ScreenWidth-60, 60)];
//    [cancleBtn setTitle:@"返回" forState:UIControlStateNormal];
//    // [cancleBtn setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
//    [cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:cancleBtn];

    //[self.navigationController pushViewController:resultVC animated:YES];

    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"读取通讯录" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 800, 100);
    btn.backgroundColor = [UIColor brownColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)cancleBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)pressBtn{

    //让用户给权限,没有的话会被拒绝
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusNotDetermined) {
        CNContactStore *store = [[CNContactStore alloc] init];
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (error) {
                NSLog(@"weishouquan ");
            }else
            {
                NSLog(@"chenggong ");//用户给权限了
                CNContactPickerViewController * picker = [CNContactPickerViewController new];
                picker.delegate = self;
                picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];//只显示手机号
                [self presentViewController: picker  animated:YES completion:nil];
            }
        }];
    }

    if (status == CNAuthorizationStatusAuthorized) {//有权限时
        CNContactPickerViewController * picker = [CNContactPickerViewController new];
        picker.delegate = self;
        picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
        [self presentViewController: picker  animated:YES completion:nil];
    }
    else{
        NSLog(@"您未开启通讯录权限,请前往设置中心开启");
    }
}


-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{

    CNPhoneNumber * num = nil;
    NSString * string = nil;
    if (contact.phoneNumbers.count >0) {
        num = contact.phoneNumbers[0].value;
        string = [NSString stringWithFormat:@"%@%@   %@",contact.familyName,contact.givenName,[num valueForKey:@"digits"]];
    }else{
        string = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];

    }

    NSLog(@"%@",string);

    [btn setTitle:string forState:UIControlStateNormal];

}
/*
 #pragma mark - Navigation
 
  In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  Get the new view controller using [segue destinationViewController].
  Pass the selected object to the new view controller.
 }
 */

@end

