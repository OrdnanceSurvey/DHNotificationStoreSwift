//
//  DHNotificationStoreSwiftTests.swift
//  DHNotificationStoreSwiftTests
//
//  Created by Dave Hardiman on 01/12/2015.
//  Copyright © 2015 David Hardiman. All rights reserved.
//

import XCTest
@testable import DHNotificationStoreSwift

class DHNotificationStoreSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class TestClass: NotificationHandler {
        var notificationReceived = false
        init() {
        }
    }

    func testItIsPossibleToReceiveANotification() {
        let test = TestClass()
        test.dh_notificationStore.addObserver(forName: "Test") { [unowned test] note in
            test.notificationReceived = true
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Test"), object: nil)
        XCTAssertTrue(test.notificationReceived)
    }

    func testNotificationBlocksDeRegisterAtDeallocation() {
        var notificationReceived = false
        autoreleasepool {
            var test: TestClass? = TestClass()
            _ = test?.dh_notificationStore.addObserver(forName: "Test") { note in
                notificationReceived = true
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Test"), object: nil)
            XCTAssertTrue(notificationReceived)
            notificationReceived = false
            test = nil
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Test"), object: nil)
        XCTAssertFalse(notificationReceived)
    }

}
