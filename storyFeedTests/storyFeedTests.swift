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
    
    func test_add_AddsTwoStoriesToTheFeedAndNumberOfStoriesShouldBeTwo() {
        let story1 = Story()
        let story2 = Story()
        sut.add(story1)
        sut.add(story2)
        XCTAssertEqual(sut.numberOfStories, 2)
    }
    

}
