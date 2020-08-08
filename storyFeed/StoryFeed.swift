import Foundation


public class StoryFeed {
    public var stories:[Story]!
    public init() {
        stories = []
    }
    public func add(_ story:Story, addedDate:Date? = Date()) {
        stories.append(story)
        story.setAddeddate(date: addedDate)
        story.setExpirationDate(date: Date())
    }
    
    public func remove(_ storyId: UUID?) throws {
        if(stories.count < 1) {
            throw NSError(domain: "Error", code: 0)
        } else {
            stories = stories.filter { $0.id != storyId }
        }
        
    }
}
