import XCTest
import storyFeed

class storyFeedTests: XCTestCase {

    func test_storyFeedInitializesWithZeroStories() {
        let sut = StoryFeed()
        XCTAssertEqual(sut.numberOfStories, 0)
    }
    
    func test_add_AddsOneStoryToTheFeedAndNumberOFStoriesShouldBeOne() {
        let sut = StoryFeed()
        let story = Story()
        sut.add(story)
        XCTAssertEqual(sut.numberOfStories, 1)
        
    }

}
