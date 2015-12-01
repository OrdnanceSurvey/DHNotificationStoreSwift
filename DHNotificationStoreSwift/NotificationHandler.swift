//
//  NotificationHandler.swift
//  DHNotificationStoreSwift
//
//  Created by Dave Hardiman on 01/12/2015.
//  Copyright © 2015 David Hardiman. All rights reserved.
//
import Foundation
import DHFoundation
import ObjectiveC.runtime

/// Protocol to conform to to gain DHNotificationStore functionality
public protocol NotificationHandler: class {

    /// Notification store to use
    var dh_notificationStore: DHNotificationStore { get }
}

private var dh_notificationStoreKey: UInt8 = 0
public extension NotificationHandler {

    var dh_notificationStore: DHNotificationStore {
        get {
            var store = objc_getAssociatedObject(self, &dh_notificationStoreKey) as? DHNotificationStore
            if store == nil {
                store = DHNotificationStore()
                objc_setAssociatedObject(self, &dh_notificationStoreKey, store, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return store!
        }
    }
}
