//
//  UCSafeNotificationManager.h
//  UCSafeNotification
//
//  Created by 范杨 on 2018/7/26.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UCSafeNotificationProtocol<NSObject>
@required
- (void)ucSafeNotificationWithNotifiName:(NSString *)notifiName
                               notifiObj:(id)notifiObj;
@end

@interface UCSafeNotificationManager : NSObject

+ (instancetype)shareManager;
+ (void)destroyManager;

- (void)addNotifyObj:(id)notifyObj
          notifiName:(NSString *)notifyName;

- (void)removeNotifyObjFromAllNotify:(id)notifyObj;
- (void)removeNotifyName:(NSString *)notifyName;
- (void)removeNotifyObj:(id)notifyObj
         fromNotifyName:(NSString *)notifyName;

- (BOOL)sendNotifiName:(NSString *)notifyName
        notifyArgument:(id)notifyArgument;

@end
