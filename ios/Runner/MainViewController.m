//
//  MainViewController.m
//  Runner
//
//  Created by simon on 2020/5/6.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "MainViewController.h"
#import "GeneratedPluginRegistrant.h"
#import "TestViewController.h"

static NSString *const flutter_MethodChannel = @"flutter_to_native";
static NSString *const flutter_goToNativeTest = @"flutter_goToNative_Test";
static NSString *const flutter_goToNativeTestPresent = @"flutter_goToNative_Test_Present";

//15751004145
@interface MainViewController ()<FlutterBinaryMessenger>

@property (nonatomic, strong) FlutterMethodChannel *methodChannel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak __typeof (&*self)weakSelf = self;
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSString *method = call.method;
        if ([method isEqualToString:flutter_goToNativeTest])
        {
            NSDictionary *dic = call.arguments;
            NSString *token = [dic objectForKey:@"token"];
            TestViewController *vc = [[TestViewController alloc] init];
            vc.token = token;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            //此方法只能调用一次
            result(@"push后返回给flutter数据");
        }
        else if ([method isEqualToString:flutter_goToNativeTestPresent])
        {
            TestViewController *vc = [[TestViewController alloc] init];
            [weakSelf presentViewController:vc animated:YES completion:nil];
        }
    }];
    
    [GeneratedPluginRegistrant registerWithRegistry:self];
}

- (FlutterMethodChannel *)methodChannel
{
    if (!_methodChannel) {
        FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:flutter_MethodChannel binaryMessenger:self];
        _methodChannel = channel;
    }
    return _methodChannel;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
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
