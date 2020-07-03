//
//  ProductRow.swift
//  GroceriesListManager
//
//  Created by Matías Gil Echavarría on 6/28/20.
//  Copyright © 2020 Matías Gil Echavarría. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
//    @State private var observation = "2 libras"
    var name: String
    var observation: String
    var type: Product.Category
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.type.rawValue)
                    .font(.caption)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
      
                
                Text(self.name)
                    .font(.title)
            }
            
            Spacer()
            Divider()
 
            VStack(alignment: .trailing) {
                Text("Observation")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
                

                Text(self.observation)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .font(.callout)
            }
        }
        .padding()
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(name: "Arroz  largo largo texto largo", observation: "Lo que sea", type: .snacks).previewLayout(.fixed(width: 300, height: 70))
    }
}
