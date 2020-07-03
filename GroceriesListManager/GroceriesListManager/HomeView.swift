//
//  HomeView.swift
//  GroceriesListManager
//
//  Created by Matías Gil Echavarría on 6/28/20.
//  Copyright © 2020 Matías Gil Echavarría. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var data: AppData
    @State private var isEditMode: EditMode = .inactive
    @State private var isAddingProduct = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.items, id: \.self) { item in
                    ProductRow(name: item.name, observation: item.observation, type: item.category)
                }
                .onDelete(perform: onDelete)
            }
            .navigationBarItems(leading:EditButton(), trailing: self.addButton)
            .environment(\.editMode, self.$isEditMode)
            .navigationBarTitle(Text("Products"))
            
        }
    }
    
    private var addButton: some View {
        switch isEditMode {
        case .inactive:
            return AnyView(
                Button(action: self.onAdd) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $isAddingProduct, onDismiss: {
                    print("Disiss")
                }) {
                    AddProduct(isAddingProduct: self.$isAddingProduct).environmentObject(self.data)
                }
            )
        default:
            return AnyView(EmptyView())
        }
    }
    
    private func onAdd() {
        self.isAddingProduct = true
    }

    private func onDelete(offsets: IndexSet) {
        self.data.items.remove(atOffsets: offsets)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(AppData())
    }
}
