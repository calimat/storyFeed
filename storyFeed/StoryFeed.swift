import Foundation


public class StoryFeed {
    public var numberOfStories:Int!
    public init() {
        self.numberOfStories = 0
    }
    public func add(_ story:Story) {
        self.numberOfStories = 1
    }
}
