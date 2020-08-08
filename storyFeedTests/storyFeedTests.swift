import XCTest
import storyFeed


class storyFeedTests: XCTestCase {

    func test_storyFeedInitializesWithZeroStories() {
        let sut = StoryFeed()
        XCTAssertEqual(sut.numberOfStories, 0)
    }

}
