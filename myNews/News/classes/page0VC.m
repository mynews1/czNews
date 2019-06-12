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

@implementation page0VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
