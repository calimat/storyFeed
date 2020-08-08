public class Story: FeedItem {
   
    private var _id:UUID
    private var _addedDate:Date?
    private var _expirationDate:Date?
    
    public var addedDate:Date? {
        return _addedDate
    }
    
    public func setAddeddate(date:Date?) {
        self._addedDate = date
    }
    
    public func setExpirationDate(date:Date?) {
        self._expirationDate = date 
    }
    
    public var expirationDate:Date? {
        return _expirationDate
    }
    
    public  var  id:  UUID  {
        return self._id
    }
    public init(id:UUID) {
        self._id = id
        self._addedDate = addedDate
    }
}
