//
//  Item.swift
//  SwiftDataSample
//
//  Created by Yuki Kuwashima on 2024/07/31.
//

import SwiftData
import Foundation

@Model
class Item {
    var title: String
    var date: Date
    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
}
