//
//  TYLeftJoyStick.h
//  TYJoySticker
//
//  Created by Yang on 2017/6/19.
//  Copyright © 2017年 Tina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYLeftJoyStick;

@protocol TYLeftJoyStickDelegate <NSObject>

@optional
- (void)leftStickDidChangeValue:(TYLeftJoyStick *)leftStick;
- (void)leftStickDidMoveEnd:(TYLeftJoyStick *)leftStick;
@end

@interface TYLeftJoyStick : UIView

@property (nonatomic, readonly) CGFloat xValue;
@property (nonatomic, readonly) CGFloat yValue;
@property (nonatomic, assign) BOOL invertedYAxis;
@property (nonatomic, assign) id <TYLeftJoyStickDelegate> delegate;
@property (nonatomic, readonly) UIImageView *backgroundImageView;
@property (nonatomic, readonly) UIImageView *handleImageView;

@end
