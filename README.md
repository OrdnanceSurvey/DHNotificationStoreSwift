# DHNotificationStoreSwift
Notification store extension for Swift for use with DHFoundation

For swift classes that don't inherit from `NSObject`, you can add the same notification store functionality.

    import DHNotificationStoreSwift
    
    class MyClass: NotificationHandler {
    
        init() {
            dh_notificationStore.addObserver("TestNotification") { note in
                // Handle notification
            }
        }
      
    }
