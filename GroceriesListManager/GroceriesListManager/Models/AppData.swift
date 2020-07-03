//
//  Data.swift
//  GroceriesListManager
//
//  Created by Matías Gil Echavarría on 7/3/20.
//  Copyright © 2020 Matías Gil Echavarría. All rights reserved.
//

import Foundation

class AppData: ObservableObject {
    @Published var items: [Product] = (0..<5).map {
        Product(name: "Item \($0 + 1)", observation: "Observation \($0 + 1)", category: .dairy)
    }
}
