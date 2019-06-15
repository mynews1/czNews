//
//  TableViewCell.m
//  test11
//
//  Created by Kwangchiu on 2019/6/15.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

//cell自定义用的是-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //这里顺便介绍小UIButton的创建
        //设置button的类型是UIButtonTypeRoundedRect
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        //设置button的frame
        button.frame = CGRectMake(20, 20, 50, 50);
        
        //button正常状态title设置为Yes，被选择状态title设置为No
        [button setTitle:@"Yes" forState:UIControlStateNormal];
        [button setTitle:@"No" forState:UIControlStateSelected];
        
        //设置button响应点击事件的方法是buttonPressed：
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        //添加到cell
        [self addSubview:button];
        
        //创建imageView添加到cell中
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Totoro副本"]];
        imageView.frame = CGRectMake(150, 20, 150, 100);
        [self addSubview:imageView];
        
    }
    return self;
}

//buttonPressed:方法
-(void)buttonPressed:(UIButton *)button
{
    //实现按钮状态的切换
    button.selected = !button.selected;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
