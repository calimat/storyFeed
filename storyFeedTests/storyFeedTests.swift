import XCTest
import storyFeed

class storyFeedTests: XCTestCase {

    let sut = StoryFeed()
    let anyID = UUID()
    
    func test_storyFeedInitializesWithZeroStories() {
        XCTAssertEqual(sut.stories.count, 0)
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
    
    func test_addStory_changesStoryAddedDateToCurrentDate() {
        addOneStoryToTheFeed()
        XCTAssertNotNil(sut.stories[0].addedDate)
    }
    
    func test_addStory_changesStoryAddedDateToNow() {
        let currentDate = getDate()
        addOneStoryToTheFeed(addedDate: currentDate)
        XCTAssertEqual(sut.stories[0].addedDate, currentDate)
        
    }
    
    func test_addStoryChangesStoryExpirationDateAfterAdding() {
        addOneStoryToTheFeed()
        XCTAssertNotNil(sut.stories[0].expirationDate)
    }
    
    func test_addStory_ExpirationDateChangesForExpirationTimeInHours() {
        let currentDate = getDate()
        let expirationDate = getDate(day:9)
        addOneStoryToTheFeed(addedDate: currentDate)
        XCTAssertEqual(sut.stories[0].expirationDate, expirationDate)
    }
    
    //MARK: - Helpers
    func getDate(day:Int? = 8, month:Int? = 8, year:Int? = 2020, hour:Int = 1, minute:Int? = 29, second:Int? = 0, timeZone:TimeZone = TimeZone(abbreviation: "BOT") ?? TimeZone.current) -> Date? {
        let calendar = Calendar.current
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
        components.timeZone = TimeZone(abbreviation: "BOT")
        let currentDate = calendar.date(from: components)
        return currentDate
    }
    
    func addOneStoryToTheFeed(addedDate:Date? = Date()) {
        let storyID1 = UUID()
        let story = Story(id: storyID1)
        sut.add(story, addedDate: addedDate)
    }
    
    func addTwoStoriesToTheFeed() {
        let storyID1 = UUID()
        let storyID2 = UUID()
        let story1 = Story(id: storyID1)
        let story2 = Story(id: storyID2)
        sut.add(story1)
        sut.add(story2)
    }
    
    

}
