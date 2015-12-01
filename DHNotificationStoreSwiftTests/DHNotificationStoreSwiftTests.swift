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
    
    func testItIsPossibleToReceiveANotification() {
        class TestClass: NotificationHandler {
            var notificationReceived = false
            init() {
                dh_notificationStore.addObserverForName("Test") { [unowned self] note in
                    self.notificationReceived = true
                }
            }
        }
        let test = TestClass()
        NSNotificationCenter.defaultCenter().postNotificationName("Test", object: nil)
        XCTAssertTrue(test.notificationReceived)
    }
    
}
