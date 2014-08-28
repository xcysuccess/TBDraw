//
//  TheDrawingPaintView.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-27.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TheDrawingPaintView.h"
#define BRUSH_SIZE 32

@interface TheDrawingPaintView()
@property (nonatomic, strong) NSMutableArray *strokes;
@end

@implementation TheDrawingPaintView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initViews];
    }
    return self;
}

-(void) initViews
{
    self.backgroundColor = [UIColor whiteColor];
    
    //create array
    self.strokes = [NSMutableArray array];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add brush stroke
    [self addBrushStrokeAtPoint:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the touch point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add brush stroke
    [self addBrushStrokeAtPoint:point];
}

- (void)addBrushStrokeAtPoint:(CGPoint)point
{
    //add brush stroke to array
    [self.strokes addObject:[NSValue valueWithCGPoint:point]];
    
    //set dirty rect
    [self setNeedsDisplayInRect:[self brushRectForPoint:point]];
}

- (CGRect)brushRectForPoint:(CGPoint)point
{
    return CGRectMake(point.x - BRUSH_SIZE/2, point.y - BRUSH_SIZE/2, BRUSH_SIZE, BRUSH_SIZE);
}

- (void)drawRect:(CGRect)rect
{
    //redraw strokes
    for (NSValue *value in self.strokes) {
        //get point
        CGPoint point = [value CGPointValue];
        
        //get brush rect
        CGRect brushRect = [self brushRectForPoint:point];
        
        //only draw brush stroke if it intersects dirty rect
        if (CGRectIntersectsRect(rect, brushRect)) {
            //draw brush stroke
            [[UIImage imageNamed:@"myplan.png"] drawInRect:brushRect];
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
