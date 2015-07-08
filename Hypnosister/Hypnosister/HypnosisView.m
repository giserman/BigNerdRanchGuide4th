//
//  HypnosisView.m
//  Hypnosister
//
//  Created by chenchun on 1/9/15.
//  Copyright (c) 2015 Heath. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView ()
@property (strong, nonatomic) UIColor *circleColor;
@end
@implementation HypnosisView


- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //float radius = MIN(bounds.size.height, bounds.size.width) / 2.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    UIBezierPath *circlePath = [[UIBezierPath alloc] init];
    
    for (float radius = maxRadius; radius > 0; radius -= 20) {
        
        [circlePath moveToPoint:CGPointMake(center.x + radius, center.y)];
        [circlePath addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI * 2 clockwise:YES];
    }
    
    circlePath.lineWidth = 10.0;
    //[[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    [circlePath stroke];
    
   
    
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    
    CGContextSetShadow(currentContext, CGSizeMake(10, 17), 3);
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    
    CGFloat logoRectWidth = bounds.size.width / 2.0;
    CGFloat logoRectHeight = bounds.size.height / 2.0;
    CGFloat logoRectOriginX = logoRectWidth / 2.0;
    CGFloat logoRectOriginY = logoRectHeight / 2.0;
    
    [logoImage drawInRect:CGRectMake(logoRectOriginX, logoRectOriginY, logoRectWidth, logoRectHeight)];
    
    CGContextRestoreGState(currentContext);
    
    CGContextSaveGState(currentContext);
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0, 1.0, 1,0, 0.0, 1.0};
    
    CGPoint triangleTop = CGPointMake(logoRectWidth, logoRectOriginY - 20.0);
    CGPoint triangleBottomLeft = CGPointMake(logoRectOriginX - 10.0,
                                             logoRectOriginY + logoRectHeight + 20.0);
    CGPoint triangleBottomRight = CGPointMake(logoRectOriginX + logoRectWidth + 10.0,
                                              logoRectOriginY + logoRectHeight + 20.0);
    CGPoint triangleBottomMiddle = CGPointMake(logoRectWidth,
                                               logoRectOriginY + logoRectHeight + 20.0);
    UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
    
    [trianglePath moveToPoint:triangleTop];
    [trianglePath addLineToPoint:triangleBottomLeft];
    [trianglePath addLineToPoint:triangleBottomRight];
    
    [trianglePath addClip];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    
    CGContextDrawLinearGradient(currentContext, gradient, triangleTop, triangleBottomMiddle, 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(currentContext);
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    //UIColor *randomColor1 = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}
@end
