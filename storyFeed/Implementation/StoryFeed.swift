import Foundation

public class StoryFeed : Feed {
    public var stories:[Story]!
    public init() {
        stories = []
    }
    public func add(_ story:FeedItem, addedDate:Date? = Date()) {
        stories.append(story as! Story)
        story.setAddeddate(date: addedDate)
        let expirationDate = calendar.date(byAdding: .hour, value: HOURS_EXPIRATIONTIME, to: addedDate!)
        story.setExpirationDate(date: expirationDate)
    }
    
    public func remove(_ storyId: UUID?) throws {
        if(stories.count < 1) {
            throw NSError(domain: "Error", code: 0)
        } else {
            stories = stories.filter { $0.id != storyId }
        }
        
    }
}
