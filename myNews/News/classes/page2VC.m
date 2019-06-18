//
//  page2VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page2VC.h"
#import "page3TVC.h" //个人信息录入
#import "page4VC.h" //二维码扫描
#import "page5VC.h" //我的通讯录
//#import <ContactsUI/ContactsUI.h>

@interface page2VC ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>


//**************************设置控件的坐标*********************************


//屏幕宽高
#define screenWidth   self.view.frame.size.width
#define screenHeight   self.view.frame.size.height

//qq头像宽高
#define qqY   screenHeight*0.2
#define qqW   0.25*screenWidth
#define qqX   screenWidth*0.4
#define qqH   qqW



//************声明头像*********************************

@property(nonatomic,strong)UIButton *headBtn ;

//************二维码***********************************
@property(nonatomic,strong)UIButton *QRBtn ;

@end

//@interface page2VC ()<CNContactPickerDelegate>
//{
//    UIButton * btn;
//
//}
//@end

@implementation page2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //*****************************qq头像******************************
    
    //分配初始化qq头像按钮
    self.headBtn =[[UIButton alloc]initWithFrame:CGRectMake(qqX, qqY, qqW, qqH)];
    
    //设置qq头像
    [_headBtn setBackgroundImage:[UIImage imageNamed:@"head1.jpg" ] forState:UIControlStateNormal];
    
    //添加图层蒙版，圆角化
    _headBtn.layer.cornerRadius=qqH/2;
    _headBtn.layer.masksToBounds=YES;
    //[_headBtn addTarget:self action:@selector(changHeadAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加头像按钮到视图
    [self.view addSubview:_headBtn];
    
    //******************二维码扫描button************************
    
//    btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setTitle:@"读取通讯录" forState:UIControlStateNormal];
//    btn.frame = CGRectMake(0, 100, 800, 100);
//    btn.backgroundColor = [UIColor brownColor];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"mine.png"];
        CGImageRef imageRef = image.CGImage;
        self.tabBarItem.image = [[UIImage imageWithCGImage:imageRef scale:2 orientation:
                                  UIImageOrientationDown] imageWithRenderingMode:
                                 UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

//个人信息跳转
- (IBAction)goTopage3VC:(id)sender{
    page3TVC * VCShow = [[page3TVC alloc] init];
    [self.navigationController pushViewController:VCShow animated:YES];
    //    //Xib的跳转和纯代码的跳转优点区别，挑战时需要在初始化的VC中带上要跳到Xib的名称，如下为跳转方法
    //    NSLog(@"123");
    //    testViewController *_vc = [[testViewController alloc]initWithNibName:@"testVC" bundle:[NSBundle mainBundle]];
    //    [self.navigationController pushViewController:_vc animated:YES];
    
    
}

//二维码跳转
- (IBAction)goTopage4VC:(id)sender{
    page4VC * VCShow = [[page4VC alloc] init];
    [self.navigationController pushViewController:VCShow animated:YES];
    //    //Xib的跳转和纯代码的跳转优点区别，挑战时需要在初始化的VC中带上要跳到Xib的名称，如下为跳转方法
    //    NSLog(@"123");
    //    testViewController *_vc = [[testViewController alloc]initWithNibName:@"testVC" bundle:[NSBundle mainBundle]];
    //    [self.navigationController pushViewController:_vc animated:YES];
    
    
}

//通讯录跳转
- (IBAction)goTopage5VC:(id)sender{
    page5VC * VCShow = [[page5VC alloc] init];
    [self.navigationController pushViewController:VCShow animated:YES];
    //    //Xib的跳转和纯代码的跳转优点区别，挑战时需要在初始化的VC中带上要跳到Xib的名称，如下为跳转方法
    //    NSLog(@"123");
    //    testViewController *_vc = [[testViewController alloc]initWithNibName:@"testVC" bundle:[NSBundle mainBundle]];
    //    [self.navigationController pushViewController:_vc animated:YES];


}



//- (void)cancleBtnClick
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//-(void)pressBtn{
//    
//    //让用户给权限,没有的话会被拒绝
//    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
//    if (status == CNAuthorizationStatusNotDetermined) {
//        CNContactStore *store = [[CNContactStore alloc] init];
//        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
//            if (error) {
//                NSLog(@"weishouquan ");
//            }else
//            {
//                NSLog(@"chenggong ");//用户给权限了
//                CNContactPickerViewController * picker = [CNContactPickerViewController new];
//                picker.delegate = self;
//                picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];//只显示手机号
//                [self presentViewController: picker  animated:YES completion:nil];
//            }
//        }];
//    }
//    
//    if (status == CNAuthorizationStatusAuthorized) {//有权限时
//        CNContactPickerViewController * picker = [CNContactPickerViewController new];
//        picker.delegate = self;
//        picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
//        [self presentViewController: picker  animated:YES completion:nil];
//    }
//    else{
//        NSLog(@"您未开启通讯录权限,请前往设置中心开启");
//    }
//}
//
//
//
//-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
//    
//    CNPhoneNumber * num = nil;
//    NSString * string = nil;
//    if (contact.phoneNumbers.count >0) {
//        num = contact.phoneNumbers[0].value;
//        string = [NSString stringWithFormat:@"%@%@   %@",contact.familyName,contact.givenName,[num valueForKey:@"digits"]];
//    }else{
//        string = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
//        
//    }
//    
//    NSLog(@"%@",string);
//    
//    [btn setTitle:string forState:UIControlStateNormal];
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
