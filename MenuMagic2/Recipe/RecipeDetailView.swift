//
//  RecipeDetailView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct RecipeDetailView: View {
    let recipeName: String
    @State private var selectedDay: String?
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(recipeName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Ingredients")
                    .font(.headline)
                //  ingredients list TODO IMAGES
                Text("• 200g Spaghetti\n• 100g Ground Beef\n• Tomato Sauce")
                    .padding(.bottom)
                
                Text("Instructions")
                    .font(.headline)
                Text("1. Cook the spaghetti.\n2. Brown the ground beef.\n3. Add sauce and combine with spaghetti.")
                    .padding(.bottom)
                
                Button(action: {
                    // TODO Action to add recipe to a specific day
                }) {
                    Text("Add to Meal Plan")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top)
                .actionSheet(isPresented: .constant(selectedDay != nil)) {
                    ActionSheet(
                        title: Text("Select a day to add this recipe"),
                        buttons: days.map { day in
                            .default(Text(day)) {
                                selectedDay = day
                                // add recipe to the day
                            }
                        } + [.cancel()]
                    )
                }
            }
            .padding()
        }
    }
}


