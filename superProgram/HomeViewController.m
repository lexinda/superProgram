//
//  HomeViewController.m
//  superProgram
//
//  Created by 朱孟乐 on 14-10-10.
//  Copyright (c) 2014年 朱孟乐. All rights reserved.
//

#import "HomeViewController.h"

#import "TSActionSheet.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize _blockLabel;

@synthesize _notificationlabel;

@synthesize _pressButton;

@synthesize _hud;

-(void)loadView{

    CGRect rect = [[UIScreen mainScreen] bounds];
    
    UIView *mainView = [[UIView alloc] initWithFrame:rect];
    
    self.view  = mainView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.contentMode = UIViewContentModeScaleAspectFill;
    
    UIBarButtonItem * topRightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(showActionSheet:forEvent:)];
    self.navigationItem.leftBarButtonItem = topRightButton;
    self.navigationItem.rightBarButtonItem = topRightButton;
    self.navigationController.toolbarHidden = NO;
    
    _blockLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 20.0+44.0, 100.0, 30.0)];
    
    [_blockLabel setText:@"blockLabel"];
    
    [self.view addSubview:_blockLabel];
    
    _notificationlabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, _blockLabel.frame.origin.y+_blockLabel.frame.size.height+10.0, 200.0, 30.0)];
    
    [_notificationlabel setText:@"notificationlabel"];
    
    [self.view addSubview:_notificationlabel];
    
    _pressButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_pressButton setFrame:CGRectMake(10.0, 10.0, 100.0, 20.0)];
    
    [_pressButton setTitle:@"press" forState:UIControlStateNormal];
    
    [_pressButton setCenter:self.view.center];
    
    [_pressButton addTarget:self action:@selector(showWithLabel:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_pressButton];
    
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

-(void)showWithLabel:(id)sender{
    
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    
    [self.view addSubview:_hud];
    
    _hud.delegate = self;
    
    _hud.labelText = @"Loading";
    
    [_hud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
    
}

-(void)myTask{
    
    sleep(3);
    
}

-(void) showActionSheet:(id)sender forEvent:(UIEvent*)event
{
    TSActionSheet *actionSheet = [[TSActionSheet alloc] initWithTitle:@"action sheet"];
    [actionSheet destructiveButtonWithTitle:@"hoge" block:nil];
    [actionSheet addButtonWithTitle:@"hoge1" block:^{
        NSLog(@"pushed hoge1 button");
    }];
    [actionSheet addButtonWithTitle:@"moge2" block:^{
        NSLog(@"pushed hoge2 button");
    }];
    [actionSheet cancelButtonWithTitle:@"Cancel" block:nil];
    actionSheet.cornerRadius = 5;
    
    [actionSheet showWithTouch:event];
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
