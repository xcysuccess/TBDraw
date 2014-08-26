//
//  HRCell.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-26.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "HRCell.h"

@interface HRCellView : UIView
@end

@implementation HRCellView

- (void)drawRect:(CGRect)rect
{
    [(HRCell *)[self getCellFromContentviewSubview] drawContentView:rect];
}

- (UITableViewCell *)getCellFromContentviewSubview
{
    if ([[[self superview] superview] isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)[[self superview] superview];
    }
    else if ([[[[self superview] superview] superview] isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)[[[self superview] superview] superview];
    }
    else{
        NSLog(@"something Panic happens");
    }
    return nil;
}

@end

@implementation HRCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        contentView = [[HRCellView alloc] init];
        contentView.opaque = YES;
        [self addSubview:contentView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    CGRect b = [self bounds];
    b.size.height -= 1;
    contentView.frame = b;
}

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    [contentView setNeedsDisplay];
}

- (void)drawContentView:(CGRect)rect
{
    //子类实现
}

@end

