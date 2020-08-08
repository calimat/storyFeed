import XCTest
import storyFeed

class storyFeedTests: XCTestCase {

    let sut = StoryFeed()
    
    func test_storyFeedInitializesWithZeroStories() {
        XCTAssertEqual(sut.numberOfStories, 0)
    }
    
    func test_add_AddsOneStoryToTheFeedAndNumberOFStoriesShouldBeOne() {
        let story = Story()
        sut.add(story)
        XCTAssertEqual(sut.numberOfStories, 1)
        
    }

}
