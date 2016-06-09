//
//  DataSource.swift
//  ConversationalCards
//
//  Created by Avi Tannenbaum on 3/20/16.
//  Copyright © 2016 Avi Tannenbaum. All rights reserved.
//

import Foundation

// for data source of cards

class DataSource {
    
    init() {
        populateData()
    }
    
    var cards:[Card] = []
    var groups:[String] = []
    
    
    func numbeOfRowsInEachGroup(index: Int) -> Int {
        return cardsInGroup(index).count
    }
    
    func numberOfGroups() -> Int {
        return groups.count
    }
    
    func gettGroupLabelAtIndex(index:Int) -> String {
        return groups[index]
    }
    
    // Populating Data from cards.plist file
    
    func populateData() {
        if let path = NSBundle.mainBundle().pathForResource("cards", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let title = dict["title"] as! String
                        let group = dict["group"] as! String
                        let color = dict["color"] as! String
                        let mode = dict["mode"] as! String
                        let customText = dict["customText"] as! String
                        
                        let card = Card(name: name, group: group, title: title, color: color, mode: mode, customText: customText)
                        if !groups.contains(group){
                            groups.append(group)
                        }
                        cards.append(card)
                    }
                }
            }
        }
    }
    
    // Cards for each group
    
    func cardsInGroup(index: Int) -> [Card] {
        let item = groups[index]
        let filteredCards = cards.filter { (card: Card) -> Bool in
            return card.group == item
        }
        return filteredCards
    }
    
    // Add Add a card
    
    func addAndGetIndexForNewItem() -> Int {
        
        let card = Card(name: "Card One",  group: "Date One",title: "Sample title", color: "Test Blue", mode: "Sample mode", customText: "Sample Text")
        
        let count = cardsInGroup(0).count
        
        let index = count > 0 ? count-1: count
        cards.insert(card, atIndex: index)
        
        return index
    }
    
    // Delete Cards
   
    func deleteItems(items: [Card]) {
        
        for item in items {
            // remove item
            let index = cards.indexOfObject(item)
            if index != -1 {
                cards.removeAtIndex(index)
            }
        }
    }

}


extension Array {
    func indexOfObject<T:AnyObject>(item:T) -> Int {
        var index = -1
        for element in self {
            index += 1
            if item === element as? T {
                return index
            }
        }
        return index
    }
}
    