//
//  page3TVC.m
//  test11
//
//  Created by Kwangchiu on 2019/6/15.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "page3TVC.h"
#import "TableViewCell.h"
#import "page3VC.h"
#import "WRCellView/WRCellView.h"


@interface page3TVC ()<UITableViewDelegate>

@end
NSDictionary *dic;

extern  NSString *str1,*str2,*str3;
extern WRCellView*   nameView;
@implementation page3TVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    //从文件中获得数据，填充到输入框
//    extern NSString *str1;
//    NSString *path = [self dataFilePath];
//    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
//        NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];
//        str1 = [array objectAtIndex:0];
//        str2 = [array objectAtIndex:1];
//        str3 = [array objectAtIndex:2];
    
    }
    
////添加通知
//    UIApplication *application = [UIApplication sharedApplication];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:application];
//

////返回保存文件的路径及文件名
//-(NSString *)dataFilePath{
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
//    NSLog(@"%@",path);
//    NSString *filePath = [path stringByAppendingPathComponent:@"page3TVC.plist"];
//    return filePath;
//};
////调用通知方法，将输入框的输入内容保存到指定文件中
//-(void)applicationWillResignActive:(NSNotification *)notification{
//    NSLog(@"notification");
//    NSMutableArray *array1,*array2,*array3 = [[NSMutableArray alloc]init];
//    [array1 addObject:str1];
//    [array2 addObject:str2];
//    [array3 addObject:str3];
//    [array1,array2,array3 writeToFile:[self dataFilePath] atomically:YES];
//
//}

//-(void)showAlertDialog{
//    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
//        @"提示" message:@"欢迎使用App" delegate:self
//        cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//    [alertView show];
//}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    switch (buttonIndex) {
//        case 0:
//            NSLog(@"点击了确定按钮");
//
//            break;
//
//        case 1:
//            NSLog(@"点击了取消按钮");
//
//            break;
//
//        default:
//            break;
//    }
//}



//用来指定表视图的分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //分区设置为1
    return 1;
}

//用来指定特定分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //设置为20行
    return 1;
}


//配置特定行中的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"identify";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        
        //单元格样式设置为UITableViewCellStyleDefault
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.backgroundColor = [UIColor brownColor];
    cell.delegate = self;
    return cell;
}
//实现代理
- (void)myTabVClick:(UIButton *)btn
{
//    [self showAlertDialog];
//    NSIndexPath *index = [self.tableView indexPathForCell:cell];
//    NSLog(@"%ld",(long)index.row);
    extern UITextField *text1,*text2,*text3;
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSLog(@"----------------------------------********************************%@,%@,%@",text1.text,text2.text,text3.text);
    path = [path stringByAppendingPathComponent:@"page3TVC"];
    dic=@{
                        @"name":text1.text,
                        @"ID":text2.text,
                        @"sex":text3.text
                        };
    [dic writeToFile:path atomically:YES];
    
    
    //分配初始化提示控制窗口
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"录入数据库提示"message:@"录入成功✌️" preferredStyle:UIAlertControllerStyleAlert];
    
    //将确定按钮添加到提示框内
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    
    //模态窗口显示提示窗
    [self presentViewController:alert animated:YES completion:nil];
    
   nameView.rightLabel.text =[dic objectForKey:@"name"];
    
}
//设置单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat
{
    //这里设置成150
    return 1000;
}





@end
