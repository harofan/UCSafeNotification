# UCSafeNotification
一个用代理和NSHashTable去做的安全的通知,在释放的时候可以不用刻意去移除观察者,另外由于`NSHashTable`的特殊性,不需要担心添加重复对象.顺带一下`NSPointerArray`也能实现类似的功能.

## 安装

支持`cocoapods`,在`podfile`中输入

	pod 'UCSafeNotification'
	
## 使用

### 注册通知
导入`UCSafeNotificationManager.h`文件

	[[UCSafeNotificationManager shareManager] addNotifyObj:object notifiName:@"notifiName"];
	
如果一个对象想成为多个通知的接受者,必须全部注册,例如

	[[UCSafeNotificationManager shareManager] addNotifyObj:object notifiName:@"notifiName1"];
	[[UCSafeNotificationManager shareManager] addNotifyObj:object notifiName:@"notifiName2"];
	
遵守`UCSafeNotificationProtocol`协议,实现`ucSafeNotificationWithNotifiName:notifiObj:`代理方法即可,例如

	- (void)ucSafeNotificationWithNotifiName:(NSString *)notifiName notifiObj:(id)notifiObj{
        
        NSLog(@"%s, %@, %@",__func__, notifiName, notifiObj);
    }
	
### 发送通知

	[[UCSafeNotificationManager shareManager] sendNotifiName:@"notifiName" notifyArgument:@"支持id类型"];
	
### 移除通知

`不需要`刻意去移除,如果非要在对象生命周期结束前移除,那么可以使用下面这三个API.

	//在所有的通知里移除这个对象
	- (void)removeNotifyObjFromAllNotify:(id)notifyObj;
	//移除这个通知中的所有对象
	- (void)removeNotifyName:(NSString *)notifyName;
	//移除某个通知中的某个对象
	- (void)removeNotifyObj:(id)notifyObj fromNotifyName:(NSString *)notifyName;