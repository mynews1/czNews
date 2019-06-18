//
//  TableViewCell.h
//  News
//
//  Created by Kwangchiu on 2019/6/15.
//  Copyright © 2019年 Kwangchiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol myTabVdelegate<NSObject>

-(void)myTabVClick:(UITableViewCell *)cell;
@end

@interface TableViewCell : UITableViewCell

@property(strong,nonatomic)UIButton *btn;
@property(assign,nonatomic)id<myTabVdelegate>delegate;
@end



