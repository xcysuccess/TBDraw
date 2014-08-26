//
//  HomeTableViewCell.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-26.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeModel.h"


#define rNameFontSize 18.0f
#define rDetailFontSize 14.0f

static UIFont *NameFont;
static UIFont *DetailFont;
static CGRect titleRect;
static CGRect contentRect;
static CGRect imageRect;

@implementation HomeTableViewCell

+ (void)initialize
{
    NameFont   =   [UIFont systemFontOfSize : rNameFontSize];
    DetailFont =   [UIFont systemFontOfSize : rDetailFontSize];
    titleRect  =   CGRectMake(75, 10, 200, 30);
    contentRect   =   CGRectMake(75, 40, 200, 20);
    imageRect     =    CGRectMake(5, 5, 60, 60);
//    DetailFont = [UIFont fontWithName:@"American Typewriter" size:rDetailFontSize];
}

- (void)bindModel:(Animal *)animal
{
    if (_imageHeader != animal.imageHeader)
    {
        _imageHeader = animal.imageHeader;
    }
    if (_title != animal.title)
    {
        _title = animal.title;
    }
    if (_content != animal.content)
    {
        _content = animal.content;
    }
    
    [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch =  [touches anyObject];

    if(touch.tapCount == 1)
    {
        CGPoint currentLocation = [touch locationInView:self];

        if (CGRectContainsPoint(imageRect, currentLocation)) {
            mAlertView(@"点中了image", @"imageRect");
        }
    }
}

- (void)drawContentView:(CGRect)rect
{
    static UIColor *nameColor;
    nameColor = [UIColor blackColor];
    static UIColor *detailColor;
    detailColor = [UIColor darkGrayColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect cellRect = self.frame;
    
    if (self.highlighted || self.selected)
    {
        CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, cellRect.size.width, cellRect.size.height));
    }
    else
    {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, cellRect.size.width, cellRect.size.height));
    }
    
    UIImage *image = [UIImage imageNamed:_imageHeader];
    [image drawInRect:imageRect];
    
    [nameColor set];
    
    
    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentLeft;

    NSDictionary *attributesTitle = @{ NSFontAttributeName: NameFont,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    [_title drawInRect : titleRect
           withAttributes: attributesTitle];

    
    [detailColor set];
    NSDictionary *attributesContent = @{ NSFontAttributeName: DetailFont,
                                       NSParagraphStyleAttributeName: paragraphStyle };

    [_content drawInRect:contentRect
        withAttributes: attributesContent];
}


@end
