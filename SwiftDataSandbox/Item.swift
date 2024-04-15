//
//  Item.swift
//  SwiftDataSandbox
//
//  Created by gurrium on 2024/04/15.
//

import Foundation
import SwiftData

@Model
final class Shop {
    var name: String

    @Relationship(inverse: \Item.shop)
    var items: [Item]
    @Relationship(inverse: \Item.shop)
    var highlightedItem: Item?

    init(name: String) {
        self.name = name
        self.items = []
    }
}

@Model
final class Item {
    var timestamp: Date

    var shop: Shop?

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
