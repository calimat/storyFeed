import XCTest
import storyFeed

class storyFeedTests: XCTestCase {

    let sut = StoryFeed()
    let anyID = UUID()
    
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
        XCTAssertThrowsError(try sut.remove(anyID))
    }
    
    func test_remove_WhenThereIsOneStoryDoesNotThrowError() {
        addOneStoryToTheFeed()
        XCTAssertNoThrow(try sut.remove(anyID))
       
    }
    
    func test_remove_WhenThereAreTwoStoriesDoesNotThrowError() {
        addTwoStoriesToTheFeed()
        XCTAssertNoThrow(try sut.remove(anyID))
    }
    
    func test_remove_WhenThereAreTwoStoriesItRemovesTheCorrectOne() {
        addTwoStoriesToTheFeed()
        let storyIdToRemove = sut.stories[0].id
        let storyIdNotRemoved = sut.stories[1].id
        
        try? sut.remove(storyIdToRemove)
        
        XCTAssertEqual(sut.stories.count, 1)
        XCTAssertEqual(sut.stories[0].id, storyIdNotRemoved)
    }
    
    func test_removeWhenThereAreThreeStorieAndRemovesTheMiddleOneIsNotThere() {
        addOneStoryToTheFeed()
        addTwoStoriesToTheFeed()
        let storyIDtoBeRemoved = sut.stories[1].id
        let firstStoryID = sut.stories[0].id
        let thirdSToryID = sut.stories[2].id
        
        try? sut.remove(storyIDtoBeRemoved)
        XCTAssertEqual(sut.stories.count, 2)
        XCTAssertEqual(sut.stories[0].id, firstStoryID)
        XCTAssertEqual(sut.stories[1].id, thirdSToryID)
    }
    

}
