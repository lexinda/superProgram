//
//  HomeViewController.h
//  superProgram
//
//  Created by 朱孟乐 on 14-10-10.
//  Copyright (c) 2014年 朱孟乐. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

#import "Reachability.h"

@interface HomeViewController : UIViewController<MBProgressHUDDelegate>

@property(strong,nonatomic)UILabel *_blockLabel;

@property(strong,nonatomic)UILabel *_notificationlabel;

@property(strong,nonatomic)UIButton *_pressButton;

@property(strong,nonatomic)MBProgressHUD *_hud;

@end
