//
//  Item.swift
//  Alexandria
//
//  Created by Cosimo Davide Viggiano on 02/08/16.
//  Copyright © 2016 Cosimo Davide Viggiano. All rights reserved.
//

import UIKit

class Item {
    // MARK: Properties
    
    var name: String = ""
    var type: String?
    var genre: String?
    var author: String?
    var mine: Bool = false
    var suggest: Bool = false
    
    // MARK: Initialization
    
    init?(name: String, type: String?, genre: String?, author: String?, mine: Bool, suggest: Bool) {
        
        self.name = name
        self.genre = genre
        self.author = author
        self.type = type
        self.mine = mine
        self.suggest = suggest
        
        if name.isEmpty {
            return nil
        }
    }
}
