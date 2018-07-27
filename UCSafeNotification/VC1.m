//
//  VC1.m
//  UCSafeNotification
//
//  Created by 范杨 on 2018/7/26.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "VC1.h"
#import "UCSafeNotificationManager.h"
#import "VC2.h"
@interface VC1 ()<UCSafeNotificationProtocol>

@end

@implementation VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
- (IBAction)didClickSendNotifi:(id)sender {
    [[UCSafeNotificationManager shareManager] sendNotifiName:@"" notifyArgument:@"支持id类型"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    VC2 *vc = [VC2 new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
