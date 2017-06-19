//
//  TYRightJoyStick.m
//  TYJoySticker
//
//  Created by Yang on 2017/6/19.
//  Copyright © 2017年 Tina. All rights reserved.
//

#import "TYRightJoyStick.h"
#define RADIUS ([self bounds].size.width / 2)

@implementation TYRightJoyStick

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self commonInit];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Back_01.png"]];
    CGRect backgroundImageFrame = [_backgroundImageView frame];
    backgroundImageFrame.size = [self bounds].size;
    backgroundImageFrame.origin = CGPointZero;
    [_backgroundImageView setFrame:backgroundImageFrame];
    [self addSubview:_backgroundImageView];
    
    _handleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Button_04_Normal_Virgin.png"]];
    CGRect handleImageFrame = [_handleImageView frame];
    handleImageFrame = CGRectMake(0, 0, 62, 62);
    [_handleImageView setFrame:handleImageFrame];
    _handleImageView.center = _backgroundImageView.center;
    [self addSubview:_handleImageView];
    
    _xValue = 0;
    _yValue = 0;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [[touches anyObject] locationInView:self];
    
    CGFloat normalisedX = (location.x / RADIUS) - 1;
    CGFloat normalisedY = ((location.y / RADIUS) - 1) * -1;
    
    if (normalisedX > 1.0)
    {
        location.x = [self bounds].size.width;
        normalisedX = 1.0;
    }
    else if (normalisedX < -1.0)
    {
        location.x = 0.0;
        normalisedX = -1.0;
    }
    
    if (normalisedY > 1.0)
    {
        location.y = 0.0;
        normalisedY = 1.0;
    }
    else if (normalisedY < -1.0)
    {
        location.y = [self bounds].size.height;
        normalisedY = -1.0;
    }
    
    if (self.invertedYAxis)
    {
        normalisedY *= -1;
    }
    
    _xValue = normalisedX;
    _yValue = normalisedY;
    
    CGPoint handleImageCenter;
    
    if ([self DistanceBetweenTwoPointsWithPoint1:location withPoint2:_backgroundImageView.center] > RADIUS) {
        double vX = location.x - _backgroundImageView.center.x;
        double vY = location.y - _backgroundImageView.center.y;
        double magV = sqrt(vX*vX + vY*vY);
        handleImageCenter.x = _backgroundImageView.center.x + vX / magV * RADIUS;
        handleImageCenter.y = _backgroundImageView.center.y + vY / magV * RADIUS;
    }else{
        handleImageCenter.x = location.x;
        handleImageCenter.y = location.y;
    }
    _handleImageView.center = handleImageCenter;
    
    if ([self.delegate respondsToSelector:@selector(rightStickDidChangeValue:)])
    {
        [self.delegate rightStickDidChangeValue:self];
    }
}

- (CGFloat)DistanceBetweenTwoPointsWithPoint1:(CGPoint)point1 withPoint2:(CGPoint)point2{
    CGFloat dx = point2.x - point1.x;
    CGFloat dy = point2.y - point1.y;
    CGFloat distance = sqrt(dx*dx + dy*dy);
    
    return distance;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [[touches anyObject] locationInView:self];
    
    CGFloat normalisedX = (location.x / RADIUS) - 1;
    CGFloat normalisedY = ((location.y / RADIUS) - 1) * -1;
    
    if (normalisedX > 1.0)
    {
        location.x = [self bounds].size.width;
        normalisedX = 1.0;
    }
    else if (normalisedX < -1.0)
    {
        location.x = 0.0;
        normalisedX = -1.0;
    }
    
    if (normalisedY > 1.0)
    {
        location.y = 0.0;
        normalisedY = 1.0;
    }
    else if (normalisedY < -1.0)
    {
        location.y = [self bounds].size.height;
        normalisedY = -1.0;
    }
    
    if (self.invertedYAxis)
    {
        normalisedY *= -1;
    }
    
    _xValue = normalisedX;
    _yValue = normalisedY;
    
    CGPoint handleImageCenter;
    if ([self DistanceBetweenTwoPointsWithPoint1:location withPoint2:_backgroundImageView.center] > RADIUS) {
        double vX = location.x - _backgroundImageView.center.x;
        double vY = location.y - _backgroundImageView.center.y;
        double magV = sqrt(vX*vX + vY*vY);
        handleImageCenter.x = _backgroundImageView.center.x + vX / magV * RADIUS;
        handleImageCenter.y = _backgroundImageView.center.y + vY / magV * RADIUS;
    }else{
        handleImageCenter.x = location.x;
        handleImageCenter.y = location.y;
    }
    _handleImageView.center = handleImageCenter;
    
    if ([self.delegate respondsToSelector:@selector(rightStickDidChangeValue:)])
    {
        [self.delegate rightStickDidChangeValue:self];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    _xValue = 0.0;
    _yValue = 0.0;
    
    _handleImageView.center = _backgroundImageView.center;
    
    if ([self.delegate respondsToSelector:@selector(rightStickDidChangeValue:)])
    {
        [self.delegate rightStickDidChangeValue:self];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _xValue = 0.0;
    _yValue = 0.0;
    
    _handleImageView.center = _backgroundImageView.center;
    
    if ([self.delegate respondsToSelector:@selector(rightStickDidMoveEnd:)])
    {
        [self.delegate rightStickDidMoveEnd:self];
    }
}


@end
