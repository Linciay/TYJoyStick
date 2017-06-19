//
//  ViewController.h
//  TYJoySticker
//
//  Created by Yang on 2017/5/10.
//  Copyright © 2017年 Tina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TYLeftJoyStick.h"
#import "TYRightJoyStick.h"

@interface ViewController : UIViewController<TYLeftJoyStickDelegate,TYRightJoyStickDelegate>


@end

