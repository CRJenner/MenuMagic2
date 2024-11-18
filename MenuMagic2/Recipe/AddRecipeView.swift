//
//  AddRecipeView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct AddRecipeView: View {
    @State private var recipeName = ""
    @State private var ingredients = ""
    @State private var instructions = ""
    @State private var recipeImage: Image?
    @State private var showImagePicker = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Add New Recipe")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            TextField("Recipe Name", text: $recipeName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Ingredients")
                .font(.headline)
            TextEditor(text: $ingredients)
                .frame(height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            Text("Instructions")
                .font(.headline)
            TextEditor(text: $instructions)
                .frame(height: 150)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            
            if let recipeImage = recipeImage {
                recipeImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(10)
            } else {
                Button("Upload Photo") {
                    showImagePicker = true
                }
                .foregroundColor(.blue)
            }
            
            Button(action: {
                // Save recipe to data source
            }) {
                Text("Save Recipe")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top)
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            // Implement Image Picker for selecting a recipe image
        }
    }
}


