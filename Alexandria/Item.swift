//
//  Item.swift
//  Alexandria
//
//  Created by Cosimo Davide Viggiano on 05/08/16.
//  Copyright © 2016 Cosimo Davide Viggiano. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    // MARK: Properties
    
    var title: String = ""
    var genre: String?
    var type: String = ""
    var author: String?
    var mine: Bool
    var suggest: Bool
    
    struct ProductKey {
       static let titleKey = "title"
       static let genreKey = "genre"
       static let typeKey = "type"
       static let authorKey = "author"
       static let mineKey = "mine"
       static let suggestKey = "suggest"
    }
    
    // MARK: Initialization
    
    init?(title: String, genre: String?, type: String, author: String?, mine: Bool, suggest: Bool) {
        self.title = title
        self.genre = genre
        self.type = type
        self.author = author
        self.mine = mine
        self.suggest = suggest
        
        super.init()
        
        if title.isEmpty || type.isEmpty {
            return nil
        }
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("items")
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: ProductKey.titleKey)
        aCoder.encodeObject(genre, forKey: ProductKey.genreKey)
        aCoder.encodeObject(type, forKey: ProductKey.typeKey)
        aCoder.encodeObject(author, forKey: ProductKey.authorKey)
        aCoder.encodeBool(mine, forKey: ProductKey.mineKey)
        aCoder.encodeBool(suggest, forKey: ProductKey.suggestKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObjectForKey(ProductKey.titleKey) as! String
        let genre = aDecoder.decodeObjectForKey(ProductKey.genreKey) as! String
        let author = aDecoder.decodeObjectForKey(ProductKey.authorKey) as! String
        let type = aDecoder.decodeObjectForKey(ProductKey.typeKey) as! String
        let mine = aDecoder.decodeBoolForKey(ProductKey.mineKey)
        let suggest = aDecoder.decodeBoolForKey(ProductKey.suggestKey)
        
        self.init(title: title, genre: genre, type: type, author: author, mine: mine, suggest: suggest)
    }
}
