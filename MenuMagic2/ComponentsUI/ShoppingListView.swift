//
//  ShoppingListView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct ShoppingListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Shopping List")
                .font(.headline)
                .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(["Tomatoes", "Pasta", " ", "Basil"], id: \.self) { item in
                        HStack {
                            Text(item)
                                .font(.body)
                            Spacer()
                            Button(action: {
                                // Toggle item as bought
                            }) {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


