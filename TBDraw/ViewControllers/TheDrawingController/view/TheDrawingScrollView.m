//
//  TheDrawingScrollView.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TheDrawingScrollView.h"

#define VIEWWidth 100
@interface TheDrawingScrollView()
{
    NSArray* arrayText;
}
@end


@implementation TheDrawingScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initData];
        [self initViews];
    }
    return self;
}

- (void) initData
{
    arrayText = @[@"粗体",@"斜体",@"正常",@"加粗",@"倾斜",@"橡皮擦"];
}

- (void) initViews
{
    self.backgroundColor = [UIColor yellowColor];
    self.contentSize = CGSizeMake(VIEWWidth * arrayText.count, self.bounds.size.height);

//    self.pagingEnabled = YES;
//    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator   = NO;
    self.delegate = self;
    
    
    for (int i = 0 ; i < arrayText.count; ++i)
    {
        NSString* text = [arrayText objectAtIndex:i];
        
        CGRect rect = CGRectZero;
        rect = CGRectMake(i * VIEWWidth, 0, VIEWWidth - 10, self.bounds.size.height);
        
        UIView * view = [[UIView alloc] initWithFrame:rect];
        view.backgroundColor = [UIColor orangeColor];
        view.layer.borderColor = [UIColor grayColor].CGColor;
        view.layer.borderWidth = 2.f;
        
        UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
        label.text = text;
        label.textAlignment = NSTextAlignmentCenter;
        
        [view addSubview:label];
        [self addSubview:view];
        view.tag = i;
        
        
        //手势
        UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(tapView:)];
        [view addGestureRecognizer:tapView];
        view.userInteractionEnabled = YES;
    }
}

-(void) tapView : (UITapGestureRecognizer*) sender
{
    UIView * tapView = sender.self.view;
    tapView.backgroundColor = [UIColor redColor];
    
    for (UIView *view in self.subviews) {
        if (view.tag != tapView.tag) {
            view.backgroundColor = [UIColor orangeColor];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
