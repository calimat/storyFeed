//
//  storyTests.swift
//  storyFeedTests
//
//  Created by Ricardo Herrera Petit on 8/8/20.
//  Copyright © 2020 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
import storyFeed

class storyTests: XCTestCase {

    func test_StoryHasID() {
        let storyID = UUID()
        let sut = Story(id: storyID)
        XCTAssertNotNil(sut.id)
    }

    func test_StoryHasExpirationDate() {
        let storyID = UUID()
        let sut = Story(id: storyID)
        XCTAssertNotNil(sut.creationDate)
    }
}
