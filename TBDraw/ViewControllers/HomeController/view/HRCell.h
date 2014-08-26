//
//  HRCell.h
//  TBDraw
//
//  Created by XiangChenyu on 14-8-26.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRCell : UITableViewCell
{
    UIView *contentView;
}

- (void)drawContentView:(CGRect)rect;

@end

