//
//  HomeViewController.m
//  superProgram
//
//  Created by 朱孟乐 on 14-10-10.
//  Copyright (c) 2014年 朱孟乐. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize _blockLabel;

@synthesize _notificationlabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _blockLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 100.0, 30.0)];
    
    [_blockLabel setText:@"blockLabel"];
    
    [self.view addSubview:_blockLabel];
    
    _notificationlabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 50.0, 200.0, 30.0)];
    
    [_notificationlabel setText:@"notificationlabel"];
    
    [self.view addSubview:_notificationlabel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.apple.com"];
    
    reach.reachableBlock = ^(Reachability *reachability){
    
        dispatch_async(dispatch_get_main_queue(), ^{
            _blockLabel.text=@"链接成功！";
        });
        
    };
    
    reach.unreachableBlock = ^(Reachability *reachability){
    
        dispatch_async(dispatch_get_main_queue(), ^{
        
            _blockLabel.text=@"链接失败！";
            
        });
        
    };
    
    [reach startNotifier];
    
    
    // Do any additional setup after loading the view.
}

-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        _notificationlabel.text = @"Notification Says Reachable";
    }
    else
    {
        _notificationlabel.text = @"Notification Says Unreachable";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
