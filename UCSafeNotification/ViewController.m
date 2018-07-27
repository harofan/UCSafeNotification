//
//  ViewController.m
//  UCSafeNotification
//
//  Created by 范杨 on 2018/7/26.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "ViewController.h"
#import "UCSafeNotificationManager.h"
#import "VC1.h"
@interface ViewController ()<UCSafeNotificationProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[UCSafeNotificationManager shareManager] addNotifyObj:self notifiName:@"notifi2"];
    [[UCSafeNotificationManager shareManager] addNotifyObj:self notifiName:@"notifi3"];
}

- (void)ucSafeNotificationWithNotifiName:(NSString *)notifiName notifiObj:(id)notifiObj{
    
    NSLog(@"%s, %@, %@",__func__, notifiName, notifiObj);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    VC1 *vc = [VC1 new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
