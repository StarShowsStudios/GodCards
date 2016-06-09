//
//  Card.swift
//  ConversationalCards
//
//  Created by Avi Tannenbaum on 3/20/16.
//  Copyright © 2016 Avi Tannenbaum. All rights reserved.
//

import Foundation

class Card {
    var name:String?
    var group:String?
    var title:String?
    var color:String?
    var mode:String?
    var customText:String?
    
    init(name: String, group:String, title:String, color:String, mode:String, customText:String) {
        self.name = name
        self.group = group
        self.title = title
        self.color = color
        self.mode = mode
        self.customText = customText
    }
}