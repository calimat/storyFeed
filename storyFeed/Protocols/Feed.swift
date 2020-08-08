import Foundation

protocol Feed {
    func add(_ story:FeedItem, addedDate:Date?)
    func remove(_ storyId: UUID?) throws
}
