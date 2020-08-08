import Foundation

public protocol FeedItem {
    var id:UUID { get}
    var addedDate:Date? { get }
    var expirationDate:Date? { get }
    func setAddeddate(date:Date?)
    func setExpirationDate(date:Date?)
}
