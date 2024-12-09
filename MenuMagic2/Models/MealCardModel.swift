//
//  MealPlan.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import Foundation

struct MealPlan {
    let dayOfWeek: DayOfWeek
    var meals: [Meal]
}

struct Meal {
    let title: String
    let description: String?
    let timeToMake: Double
    let imageName: String?
    let instructions: [String]
    let ingredients: [Ingredient]
    let equipment: [String]
    let mealType: MealType
}

struct Ingredient {
    let name: String
    let quantity: String
}

enum MealType: String {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snack = "Snack"
}

enum DayOfWeek: String {
    case sunday = "Sunday"
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
}



//enum Equipment: String {
//    case knife = "Knife"
//    case pan = "Pan"
//    case pot = "Pot"
//    case blender = "Blender"
//    case oven = "Oven"
//    case stove = "Stove"
//    case whisk = "Whisk"
//}

