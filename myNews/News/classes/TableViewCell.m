//
//  TableViewCell.m
//  test11
//
//  Created by Kwangchiu on 2019/6/15.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "TableViewCell.h"
#import "page3TVC.h"

@interface TableViewCell()
//@property(nonatomic,strong)UITextField * text1;
//@property(nonatomic,strong)UITextField * text2;
//@property(nonatomic,strong)UITextField * text3;
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UILabel *label3;

@end
NSString *str1;
NSString *str2;
NSString *str3;

UITextField * text1, * text2, * text3;

NSMutableArray *array;
@implementation TableViewCell


//cell自定义用的是-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(30.0,150.0,50,30)]; //这里x轴，Y轴，宽度，高度自己根据需求定义
        _label1.text = @"姓名";  //设置内容
        _label1.font = [UIFont fontWithName:@"Arial" size:20.0]; //设置字体大小，字体
        _label1.textColor = [UIColor blueColor]; //设置字体颜色
        
       _label2 = [[UILabel alloc] initWithFrame:CGRectMake(30.0,250,50,30)]; //这里x轴，Y轴，宽度，高度自己根据需求定义
        _label2.text = @"学号";  //设置内容
        _label2.font = [UIFont fontWithName:@"Arial" size:20.0]; //设置字体大小，字体
        _label2.textColor = [UIColor blueColor]; //设置字体颜色
        
       _label3 = [[UILabel alloc] initWithFrame:CGRectMake(30.0,350.0,50,30)]; //这里x轴，Y轴，宽度，高度自己根据需求定义
        _label3.text = @"性别";  //设置内容
        _label3.font = [UIFont fontWithName:@"Arial" size:20.0]; //设置字体大小，字体
        _label3.textColor = [UIColor blueColor]; //设置字体颜色
        //添加到cell
        
        text1 = [[UITextField alloc]initWithFrame:CGRectMake(130, 150, 200,40)];
        text1.borderStyle = UITextBorderStyleRoundedRect;
        typedef enum {
            UITextBorderStyleNone1,
            UITextBorderStyleLine1,
            UITextBorderStyleBezel1,
            UITextBorderStyleRoundedRect1
        } UITextBorderStyle1;
        
        //当输入框没有内容时，水印提示 提示内容为password
        text1.placeholder = @"请输入姓名";
        //设置输入框内容的字体样式和大小
        text1.font = [UIFont fontWithName:@"Arial" size:20.0f];
        
        //设置字体颜色
        text1.textColor = [UIColor blackColor];
        //再次编辑就清空
        text1.clearsOnBeginEditing = YES;
        
        //文本传给str1
        str1 = text1.text;
        
        [text1 addTarget:self action:@selector(textFieldEditChanged:)forControlEvents:UIControlEventEditingChanged];
        
        typedef enum {
            UIKeyboardTypeAlphabet1= UIKeyboardTypeDefault
            //  默认键盘，支持所有字符
        }UIKeyboardType1;
        //return键变成什么键
        text1.returnKeyType =UIReturnKeyDone;
        typedef enum {
            UIReturnKeyDeGo1
        }UIReturnKeyType1;
        
        
        
        
        
        text2 = [[UITextField alloc]initWithFrame:CGRectMake(130, 250, 200,40)];
        text2.borderStyle = UITextBorderStyleRoundedRect;
        typedef enum {
            UITextBorderStyleNone2,
            UITextBorderStyleLine2,
            UITextBorderStyleBezel2,
            UITextBorderStyleRoundedRect2
        } UITextBorderStyle2;
        
        //当输入框没有内容时，水印提示 提示内容为password
        
        
        text2.placeholder = @"请输入学号";
    
        //设置输入框内容的字体样式和大小
        text2.font = [UIFont fontWithName:@"Arial" size:20.0f];
        
        //设置字体颜色
        text2.textColor = [UIColor blackColor];
        //再次编辑就清空
        text2.clearsOnBeginEditing = YES;
        
        str2 = text2.text;
        typedef enum {
            UIKeyboardTypeAlphabet2 = UIKeyboardTypeDefault
            // 默认键盘，支持所有字符
        }UIKeyboardType2;
        //return键变成什么键
        text2.returnKeyType =UIReturnKeyDone;
        typedef enum {
            UIReturnKeyDeGo2
        }UIReturnKeyType2;
        
        
        
        text3 = [[UITextField alloc]initWithFrame:CGRectMake(130, 350, 200,40)];
        text3.borderStyle = UITextBorderStyleRoundedRect;
        typedef enum {
            UITextBorderStyleNone3,
            UITextBorderStyleLine3,
            UITextBorderStyleBezel3,
            UITextBorderStyleRoundedRect3
        } UITextBorderStyle3;
        
        //当输入框没有内容时，水印提示 提示内容为password
        text3.placeholder = @"性别";
        //设置输入框内容的字体样式和大小
        text3.font = [UIFont fontWithName:@"Arial" size:20.0f];
        
        //设置字体颜色
        text3.textColor = [UIColor blackColor];
        //再次编辑就清空
        text3.clearsOnBeginEditing = YES;
        
        str3 = text3.text;
        
        typedef enum {
            UIKeyboardTypeAlphabet3 = UIKeyboardTypeDefault
            // 默认键盘，支持所有字符
        }UIKeyboardType3;
        //return键变成什么键
        text3.returnKeyType =UIReturnKeyDone;
        typedef enum {
            UIReturnKeyDeGo3
        }UIReturnKeyType3;
        [self addSubview:_label1];
        [self addSubview:_label2];
        [self addSubview:_label3];
        [self addSubview:text1];
        [self addSubview:text2];
        [self addSubview:text3];
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame =CGRectMake(300,10, 100,30);
        [_btn setTitle:@"test"forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor blueColor]];
        [_btn addTarget:self action:@selector
        (test:)forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
        NSLog(@"__________________________________str1:%@___________________________________",text1.text);
        NSLog(@"__________________________________str2:%@___________________________________",text2.text);
        NSLog(@"__________________________________str3:%@___________________________________",text3.text);
        }
        return self;
    }
        
        //按钮事件
        -(void)test:(UIButton *)sender
    {
       [self.delegate myTabVClick:self] ;
    }

- (void)textFieldEditChanged:(UITextField*)textField

{
    NSLog(@"__________________________________str1:%@___________________________________",text1.text);
    NSLog(@"textfield text %@",textField.text);
    
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    
//    // Configure the view for the selected state
//}

@end
