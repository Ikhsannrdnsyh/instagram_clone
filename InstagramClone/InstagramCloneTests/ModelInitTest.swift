//
//  ModelInitTest.swift
//  InstagramCloneTests
//
//  Created by Mochamad Ikhsan Nurdiansyah on 26/11/24.
//

import XCTest
@testable import InstagramClone
import FirebaseFirestore

final class ModelInitTest: XCTestCase {
    func testUserInit() throws {
        // Given
        let dictionary: [String: Any] = [
            "email":"test@mail.com",
            "fullname":"Test User",
            "profileImage":"http://google.com",
            "username":"testuser",
            "uid":"123456",
        ]
        
        // When
        let user = User(dictionary: dictionary)
        
        // Then
        XCTAssertEqual(user.email, dictionary["email"] as! String)
        XCTAssertEqual(user.fullname, dictionary["fullname"] as! String)
        XCTAssertEqual(user.profileImage, dictionary["profileImage"] as! String)
        XCTAssertEqual(user.username, dictionary["username"] as! String)
        XCTAssertEqual(user.uid, dictionary["uid"] as! String)
        
        XCTAssertNotNil(user.stats)
        XCTAssertEqual(user.stats.followers, 0)
        XCTAssertEqual(user.stats.following, 0)
        XCTAssertFalse(user.isFollowed)
        
    }
    
    func testNotificationInit() throws {
        //Given
        let dictionary: [String: Any] = [
            "timestamp": Timestamp(date: Date(timeIntervalSince1970: 1609459200)),
            "id":"12345",
            "uid":"54321",
            "type": 1,
        ]
        
        // when
        let notification = Notification(dictionary: dictionary)
        
        // Then
        XCTAssertEqual(notification.timestamp, Timestamp(date: Date(timeIntervalSince1970: 1609459200)))
        XCTAssertEqual(notification.type, NotificationType.follow)
    }
}
