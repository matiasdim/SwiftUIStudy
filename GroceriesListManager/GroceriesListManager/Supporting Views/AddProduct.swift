//
//  AddProduct.swift
//  GroceriesListManager
//
//  Created by Matías Gil Echavarría on 6/30/20.
//  Copyright © 2020 Matías Gil Echavarría. All rights reserved.
//

import SwiftUI

struct AddProduct: View {
    
    @EnvironmentObject var data: AppData
    @Binding var isAddingProduct: Bool
    @State private var name: String = ""
    @State private var observation: String = ""
    @State private var category: String = Product.Category.none.rawValue
    
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Prodcut")) {
                    TextField("Name", text: $name)
                    
                    TextField("Observation", text: $observation)
                    
                    Picker("Categories", selection: $category) {
                        ForEach(Product.Category.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category.rawValue)
                        }
                    }
                    //.pickerStyle(SegmentedPickerStyle())
                }
                
                Button(action: {
                    let cat: Product.Category = Product.Category(rawValue: self.category) ?? Product.Category.none
                    self.data.items.append(Product(name: self.name, observation: self.observation, category: cat))
                    self.$isAddingProduct.wrappedValue = false
                }) {
                    Text("Save")
                }
                
                Button(action: {
                    self.$isAddingProduct.wrappedValue = false
                }) {
                    Text("Close")
                }
            }
        }
    }
}

struct AddProduct_Previews: PreviewProvider {
    static var previews: some View {
        AddProduct(isAddingProduct: .constant(true)).environmentObject(AppData())
    }
}
