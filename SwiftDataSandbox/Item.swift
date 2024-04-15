//
//  Item.swift
//  SwiftDataSandbox
//
//  Created by gurrium on 2024/04/15.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
