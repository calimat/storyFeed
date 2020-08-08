import XCTest
import storyFeed

class storyFeedTests: XCTestCase {

    let sut = StoryFeed()
    
    func test_storyFeedInitializesWithZeroStories() {
        XCTAssertEqual(sut.stories.count, 0)
    }
    
    func test_add_AddsOneStoryToTheFeedAndNumberOFStoriesShouldBeOne() {
        let story = Story()
        sut.add(story)
        XCTAssertEqual(sut.stories.count, 1)
    }
    
    func test_add_AddsTwoStoriesToTheFeedAndNumberOfStoriesShouldBeTwo() {
        let story1 = Story()
        let story2 = Story()
        sut.add(story1)
        sut.add(story2)
        XCTAssertEqual(sut.stories.count, 2)
    }
    
    func test_remove_WhenStoriesAreEmptyThrowsAnError() {
        XCTAssertThrowsError(try sut.remove())
    }
    
    func test_remove_WhenThereIsOneStoryDoesNotThrowError() {
        let story = Story()
        sut.add(story)
        XCTAssertNoThrow(try sut.remove())
       
    }
    
    func test_remove_WhenThereAreTwoStoriesDoesNotThrowError() {
        let story1 = Story()
        let story2 = Story()
        sut.add(story1)
        sut.add(story2)
        
        XCTAssertNoThrow(try sut.remove())
    }
    

}
