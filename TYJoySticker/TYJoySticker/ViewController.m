//
//  ViewController.m
//  TYJoySticker
//
//  Created by Yang on 2017/5/10.
//  Copyright © 2017年 Tina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController{
    UILabel *showLabel;
    
    CGFloat rockerRightX;
    CGFloat rockerRightY;
    CGFloat rockerLeftX;
    CGFloat rockerLeftY;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //左摇杆
    TYLeftJoyStick *leftJS = [[TYLeftJoyStick alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height-210, 160, 160)];
    leftJS.delegate = self;
    [self.view addSubview:leftJS];

    //右摇杆
    TYRightJoyStick *rightJS = [[TYRightJoyStick alloc]initWithFrame:CGRectMake(self.view.frame.size.width-210, leftJS.frame.origin.y, 160, 160)];
    rightJS.delegate = self;
    [self.view addSubview:rightJS];
    
    //label
    rockerLeftX = 0;
    rockerLeftY = 0;
    rockerRightX = 0;
    rockerRightY = 0;
    showLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-200, 10, 400, 50)];
    showLabel.textAlignment = NSTextAlignmentCenter;
    showLabel.text = [NSString stringWithFormat:@"leftX:%.2f,leftY:%.2f,rightX:%.2f,rightY:%.2f",rockerLeftX,rockerLeftY,rockerRightX,rockerRightY];
    [self.view addSubview:showLabel];
}

- (void)leftStickDidChangeValue:(TYLeftJoyStick *)leftStick{
    rockerLeftX = leftStick.xValue;
    rockerLeftY = leftStick.yValue;
    [self touchJoyStickWithLeftX:rockerLeftX withLeftY:rockerLeftY withRightX:rockerRightX withRightY:rockerRightY];
}

- (void)leftStickDidMoveEnd:(TYLeftJoyStick *)leftStick{
    rockerLeftX = leftStick.xValue;
    rockerLeftY = leftStick.yValue;
    [self touchJoyStickWithLeftX:rockerLeftX withLeftY:rockerLeftY withRightX:rockerRightX withRightY:rockerRightY];
}

- (void)rightStickDidChangeValue:(TYRightJoyStick *)rightStick{
    rockerRightX = rightStick.xValue;
    rockerRightY = rightStick.yValue;
    [self touchJoyStickWithLeftX:rockerLeftX withLeftY:rockerLeftY withRightX:rockerRightX withRightY:rockerRightY];
}

- (void)rightStickDidMoveEnd:(TYRightJoyStick *)rightStick{
    rockerRightX = rightStick.xValue;
    rockerRightY = rightStick.yValue;
    [self touchJoyStickWithLeftX:rockerLeftX withLeftY:rockerLeftY withRightX:rockerRightX withRightY:rockerRightY];
}

- (void)touchJoyStickWithLeftX:(CGFloat)leftX withLeftY:(CGFloat)leftY withRightX:(CGFloat)rightX withRightY:(CGFloat)rightY{
    showLabel.text = [NSString stringWithFormat:@"leftX:%.2f,leftY:%.2f,rightX:%.2f,rightY:%.2f",rockerLeftX,rockerLeftY,rockerRightX,rockerRightY];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
