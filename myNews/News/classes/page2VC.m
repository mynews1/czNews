//
//  page2VC.m
//  News
//
//  Created by Kwangchiu on 2019/6/12.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page2VC.h"
#import "page3VC.h" //个人信息录入
#import "page5VC.h" //我的通讯录

@interface page2VC ()

@end

@implementation page2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    page3VC * VCShow = [[page3VC alloc] init];
    [self.navigationController pushViewController:VCShow animated:YES];
    //    //Xib的跳转和纯代码的跳转优点区别，挑战时需要在初始化的VC中带上要跳到Xib的名称，如下为跳转方法
    //    NSLog(@"123");
    //    testViewController *_vc = [[testViewController alloc]initWithNibName:@"testVC" bundle:[NSBundle mainBundle]];
    //    [self.navigationController pushViewController:_vc animated:YES];
    
    
}

//通讯里跳转
- (IBAction)goTopage5VC:(id)sender{
    page5VC * VCShow = [[page5VC alloc] init];
    [self.navigationController pushViewController:VCShow animated:YES];
    //    //Xib的跳转和纯代码的跳转优点区别，挑战时需要在初始化的VC中带上要跳到Xib的名称，如下为跳转方法
    //    NSLog(@"123");
    //    testViewController *_vc = [[testViewController alloc]initWithNibName:@"testVC" bundle:[NSBundle mainBundle]];
    //    [self.navigationController pushViewController:_vc animated:YES];
    
    
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
