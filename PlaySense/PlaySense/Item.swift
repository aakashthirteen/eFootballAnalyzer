//
//  Item.swift
//  PlaySense
//
//  Created by Preeti Kumari on 26/05/25.
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
