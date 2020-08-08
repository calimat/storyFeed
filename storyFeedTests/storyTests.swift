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
        XCTAssertNotNil(makeSUT().id)
    }

    func test_StoryHasAddedDateNil() {
        XCTAssertNil(makeSUT().addedDate)
    }
    
    func test_StoryHasExpirationDateNil() {
        XCTAssertNil(makeSUT().expirationDate)
    }
    
    //MARK: -Helpers
    
    func makeSUT() -> Story {
        let storyID = UUID()
        let sut = Story(id: storyID)
        return sut
    }
}
