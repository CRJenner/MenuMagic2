//
//  RecipeBookView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct RecipeBookView: View {
    @State private var recipes = [
        "Spaghetti Bolognese",
        "Tacos",
        "Vegetable Stir-Fry"
    ] // Example data, replace with your data source
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(recipes, id: \.self) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipeName: recipe)) {
                            Text(recipe)
                                .font(.headline)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("My Recipe Book")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Action to open AddRecipeView
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

