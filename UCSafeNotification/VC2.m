//
//  VC2.m
//  UCSafeNotification
//
//  Created by 范杨 on 2018/7/26.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "VC2.h"
#import "UCSafeNotificationManager.h"
@interface VC2 ()<UCSafeNotificationProtocol>

@end

@implementation VC2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UCSafeNotificationManager shareManager] addNotifyObj:self notifiName:@"notifi1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ucSafeNotificationWithNotifiName:(NSString *)notifiName notifiObj:(id)notifiObj{
    
    NSLog(@"%s, %@, %@",__func__, notifiName, notifiObj);
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}
@end
