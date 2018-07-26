//
//  UCSafeNotificationManager.m
//  UCSafeNotification
//
//  Created by 范杨 on 2018/7/26.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "UCSafeNotificationManager.h"

@interface UCSafeNotificationManager()

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSHashTable<id<UCSafeNotificationProtocol>> *> *notifyArrayDict;
@end

@implementation UCSafeNotificationManager

#pragma mark public
static UCSafeNotificationManager *_share = nil;
static dispatch_once_t _once = 0;
+ (instancetype)shareManager{
    dispatch_once(&_once, ^{
        _share = [[super allocWithZone:NULL] init];
    });
    return _share;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self shareManager];
}

+ (void)destroyManager{
    _once = 0;
    _share = nil;
}

- (void)addNotifyObj:(id)notifyObj notifiName:(NSString *)notifyName{
    NSHashTable *hashTable = self.notifyArrayDict[notifyName];
    if (!hashTable) {
        hashTable = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
        self.notifyArrayDict[notifyName] = hashTable;
    }
    [hashTable addObject:notifyObj];
}

- (void)removeNotifyObjFromAllNotify:(id)notifyObj{
    for (NSString *key in self.notifyArrayDict.allKeys) {
        NSHashTable *hashTable = self.notifyArrayDict[key];
        if (!hashTable) {
            [hashTable removeObject:notifyObj];
        }
    }
}
- (void)removeNotifyObj:(id)notifyObj
         fromNotifyName:(NSString *)notifyName{
    NSHashTable *hashTable = self.notifyArrayDict[notifyName];
    if (!hashTable) {
        [hashTable removeObject:notifyObj];
    }
}

- (void)removeNotifyName:(NSString *)notifyName{
    [self.notifyArrayDict removeObjectForKey:notifyName];
}

- (BOOL)sendNotifiName:(NSString *)notifyName notifyArgument:(id)notifyArgument{
    NSHashTable *hashTable = self.notifyArrayDict[notifyName];
    if (!hashTable) return NO;
    if (hashTable.count == 0) return NO;

    for (id<UCSafeNotificationProtocol> obj in hashTable) {
        if (obj && [obj respondsToSelector:@selector(ucSafeNotificationWithNotifiName:notifiObj:)]) {
            [obj ucSafeNotificationWithNotifiName:notifyName notifiObj:notifyArgument];
        }
    }
    return YES;
}

#pragma mark - set && get
- (NSMutableDictionary<NSString *,NSHashTable<id<UCSafeNotificationProtocol>> *> *)notifyArrayDict{
    if (!_notifyArrayDict) {
        _notifyArrayDict = [NSMutableDictionary dictionary];
    }
    return _notifyArrayDict;
}

@end
