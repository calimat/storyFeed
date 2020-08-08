import Foundation


public class StoryFeed {
    public var stories:[Story]!
    public init() {
        stories = []
    }
    public func add(_ story:Story) {
        stories.append(story)
    }
}
