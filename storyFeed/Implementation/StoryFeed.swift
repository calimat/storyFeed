import Foundation

public class StoryFeed : Feed {
    private let anyError = NSError(domain: "Error", code: 0)
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
            throw anyError
        } else {
            stories = stories.filter { $0.id != storyId }
        }
        
    }
    
    public func validate(_ date: Date?) throws {
        if( date == nil ) {
            throw anyError
        }
        for story in stories {
            if(story.expirationDate! <= date!) {
                try? remove(story.id)
            }
        }
    }
}
