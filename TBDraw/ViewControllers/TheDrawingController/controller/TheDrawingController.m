//
//  TheDrawingController.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TheDrawingController.h"
#import "TheDrawingScrollView.h"
#import "TheDrawingPaintView.h"

@interface TheDrawingController ()

@end

@implementation TheDrawingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}

- (void) initViews
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];

    
    TheDrawingScrollView *zeroScrollView = [[TheDrawingScrollView alloc] initWithFrame:
                                      CGRectMake(0, self.view.frame.size.height - 64 - TheDrawingScrollViewHeight, self.view.bounds.size.width, TheDrawingScrollViewHeight)];
    [self.view addSubview:zeroScrollView];
    
    TheDrawingPaintView *zeroPaintView = [[TheDrawingPaintView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, zeroScrollView.frame.origin.y)];
    [self.view addSubview:zeroPaintView];
//    [self.view.layer addSublayer:zeroPaintView.layer];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
