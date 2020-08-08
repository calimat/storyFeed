//
//  storyFeedTests.swift
//  storyFeedTests
//
//  Created by Ricardo Herrera Petit on 8/7/20.
//  Copyright © 2020 Ricardo Herrera Petit. All rights reserved.
//

import XCTest
@testable import storyFeed


class storyFeedTests: XCTestCase {

    func test_storyFeedInitializesWithZeroStories() {
        let sut = StoryFeed()
        XCTAssertEqual(sut.numberOfStories, 0)
    }

}
