//
//  Product.swift
//  GroceriesListManager
//
//  Created by Matías Gil Echavarría on 6/28/20.
//  Copyright © 2020 Matías Gil Echavarría. All rights reserved.
//

import UIKit

struct Product: Hashable {
    var name: String
    var observation: String
    var category: Category
    
    init(name: String, observation: String, category: Category) {
        self.name = name
        self.observation = observation
        self.category = category
    }

    enum Category: String, CaseIterable {
        case vegetables = "Vegetables"
        case dairy = "Dairy products"
        case snacks = "Snacks"
        case none = "None"
    }
}
