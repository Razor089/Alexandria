//
//  Item.swift
//  Alexandria
//
//  Created by Cosimo Davide Viggiano on 02/08/16.
//  Copyright © 2016 Cosimo Davide Viggiano. All rights reserved.
//

import UIKit

class Libro: NSObject, NSCoding {
    // MARK: Properties
    
    var name: String = ""
    var genre: String?
    var author: String?
    var mine: Bool = false
    var suggest: Bool = false
    
    struct PropertyKey {
        static let nameKey = "name"
        static let genreKey = "genre"
        static let authorKey = "author"
        static let mineKey = "mine"
        static let suggestKey = "suggest"
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("items")
    
    // MARK: Initialization
    
    init?(name: String, genre: String?, author: String?, mine: Bool, suggest: Bool) {
        
        self.name = name
        self.genre = genre
        self.author = author
        self.mine = mine
        self.suggest = suggest
        
        super.init()
        
        if name.isEmpty {
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(genre, forKey: PropertyKey.genreKey)
        aCoder.encodeObject(author, forKey: PropertyKey.authorKey)
        aCoder.encodeBool(mine, forKey: PropertyKey.mineKey)
        aCoder.encodeBool(suggest, forKey: PropertyKey.suggestKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let genre = aDecoder.decodeObjectForKey(PropertyKey.genreKey) as! String
        let author = aDecoder.decodeObjectForKey(PropertyKey.authorKey) as! String
        let mine = aDecoder.decodeBoolForKey(PropertyKey.mineKey)
        let suggest = aDecoder.decodeBoolForKey(PropertyKey.suggestKey)
        self.init(name: name, genre: genre, author: author, mine: mine, suggest: suggest)
    }
}
