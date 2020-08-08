import XCTest
import storyFeed

class storyFeedTests: XCTestCase {

    let sut = StoryFeed()
    
    func test_storyFeedInitializesWithZeroStories() {
        XCTAssertEqual(sut.stories.count, 0)
    }
    
    func addOneStoryToTheFeed() {
        let storyID1 = UUID()
        let story = Story(id: storyID1)
        sut.add(story)
    }
    
    func addTwoStoriesToTheFeed() {
        let storyID1 = UUID()
        let storyID2 = UUID()
        let story1 = Story(id: storyID1)
        let story2 = Story(id: storyID2)
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
