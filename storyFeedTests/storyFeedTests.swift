import XCTest
import storyFeed

class storyFeedTests: XCTestCase {

    let sut = StoryFeed()
    
    func test_storyFeedInitializesWithZeroStories() {
        XCTAssertEqual(sut.stories.count, 0)
    }
    
    func addOneStoryToTheFeed() {
        let story = Story()
        sut.add(story)
    }
    
    func addTwoStoriesToTheFeed() {
        let story1 = Story()
        let story2 = Story()
        sut.add(story1)
        sut.add(story2)
    }
    
    func test_add_AddsOneStoryToTheFeedAndNumberOFStoriesShouldBeOne() {
        addOneStoryToTheFeed()
        XCTAssertEqual(sut.stories.count, 1)
    }
    
    func test_add_AddsTwoStoriesToTheFeedAndNumberOfStoriesShouldBeTwo() {
        addTwoStoriesToTheFeed()
        XCTAssertEqual(sut.stories.count, 2)
    }
    
    func test_remove_WhenStoriesAreEmptyThrowsAnError() {
        XCTAssertThrowsError(try sut.remove())
    }
    
    func test_remove_WhenThereIsOneStoryDoesNotThrowError() {
        addOneStoryToTheFeed()
        XCTAssertNoThrow(try sut.remove())
       
    }
    
    func test_remove_WhenThereAreTwoStoriesDoesNotThrowError() {
        addTwoStoriesToTheFeed()
        XCTAssertNoThrow(try sut.remove())
    }
    

}
