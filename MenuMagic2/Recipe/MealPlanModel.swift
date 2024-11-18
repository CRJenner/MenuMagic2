//
//  MealPlanModel.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI
import Combine

class MealPlanModel: ObservableObject {
    @Published var mealPlan: [String: String] = [:] // E.g., ["Monday": "Spaghetti"]
    @Published var recipes: [String] = ["Spaghetti Bolognese", "Chicken Tacos", "Vegetable Stir-Fry"]
    
    func addRecipeToDay(recipe: String, day: String) {
        mealPlan[day] = recipe
    }
    
    func addNewRecipe(recipe: String) {
        recipes.append(recipe)
    }
}
