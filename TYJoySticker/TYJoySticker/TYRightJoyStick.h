//
//  TYRightJoyStick.h
//  TYJoySticker
//
//  Created by Yang on 2017/6/19.
//  Copyright © 2017年 Tina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYRightJoyStick;

@protocol TYRightJoyStickDelegate <NSObject>

@optional
- (void)rightStickDidChangeValue:(TYRightJoyStick *)rightStick;
- (void)rightStickDidMoveEnd:(TYRightJoyStick *)rightStick;
@end

@interface TYRightJoyStick : UIView
@property (nonatomic, readonly) CGFloat xValue;
@property (nonatomic, readonly) CGFloat yValue;
@property (nonatomic, assign) BOOL invertedYAxis;
@property (nonatomic, assign) id <TYRightJoyStickDelegate> delegate;
@property (nonatomic, readonly) UIImageView *backgroundImageView;
@property (nonatomic, readonly) UIImageView *handleImageView;
@end
