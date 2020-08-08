//
//  Story.swift
//  storyFeed
//
//  Created by Ricardo Herrera Petit on 8/8/20.
//  Copyright © 2020 Ricardo Herrera Petit. All rights reserved.
//

import Foundation

public class Story {
   
    private var _id:UUID
    private var _addedDate:Date?
    
    public var addedDate:Date? {
        return _addedDate
    }
    
    public  var  id:  UUID  {
        return self._id
    }
    public init(id:UUID, addedDate:Date? = nil) {
        self._id = id
        self._addedDate = addedDate
    }
}
