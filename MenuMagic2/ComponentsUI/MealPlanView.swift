//
//  MealPlanView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct MealPlanView: View {
    var mealPlans: [MealPlan] = [
           MealPlan(dayOfWeek: .monday, meals: [
               Meal(title: "Pancakes", description: "Fluffy pancakes", timeToMake: 15, imageName: "pancakes", instructions: [], ingredients: [], equipment: [], mealType: .breakfast),
               Meal(title: "Grilled Chicken", description: "Juicy grilled chicken with veggies", timeToMake: 30, imageName: "grilled_chicken", instructions: [], ingredients: [], equipment: [], mealType: .lunch),
               Meal(title: "Spaghetti", description: "Classic spaghetti with marinara sauce", timeToMake: 25, imageName: "spaghetti", instructions: [], ingredients: [], equipment: [], mealType: .dinner),
               Meal(title: "Fruit Salad", description: "Fresh fruit salad", timeToMake: 10, imageName: "fruit_salad", instructions: [], ingredients: [], equipment: [], mealType: .snack)
           ]),
           MealPlan(dayOfWeek: .tuesday, meals: []),
           MealPlan(dayOfWeek: .wednesday, meals: [
               Meal(title: "Grilled Chicken", description: "Juicy grilled chicken with veggies", timeToMake: 30, imageName: "grilled_chicken", instructions: [], ingredients: [], equipment: [], mealType: .lunch)
           ]),
           MealPlan(dayOfWeek: .thursday, meals: []),
           MealPlan(dayOfWeek: .friday, meals: [
               Meal(title: "Spaghetti", description: "Classic spaghetti with marinara sauce", timeToMake: 25, imageName: "spaghetti", instructions: [], ingredients: [], equipment: [], mealType: .dinner)
           ]),
           MealPlan(dayOfWeek: .saturday, meals: []),
           MealPlan(dayOfWeek: .sunday, meals: [
               Meal(title: "Fruit Salad", description: "Fresh fruit salad", timeToMake: 10, imageName: "fruit_salad", instructions: [], ingredients: [], equipment: [], mealType: .snack)
           ])
       ]

    @State private var currentMealIndices: [DayOfWeek: Int] = [:]
    @State private var timer: Timer? = nil

    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(mealPlans, id: \.dayOfWeek) { plan in
                        let currentMealIndex = currentMealIndices[plan.dayOfWeek] ?? 0
                        let currentMeal = plan.meals.isEmpty ? nil : plan.meals[currentMealIndex]
                        
                        MealCardView(
                            imageName: currentMeal?.imageName ?? "default_image", // Default if no meals
                            mealName: currentMeal?.title ?? "No Meals",          // Default if no meals
                            dayName: plan.dayOfWeek.rawValue
                        )
                    }
                }
                .padding()
            }
            .frame(height: 200)
            .onAppear {
                startMealCycle()
            }
            .onDisappear {
                timer?.invalidate()
            }
        }

        private func startMealCycle() {
            timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
                withAnimation {
                    for plan in mealPlans where !plan.meals.isEmpty {
                        let currentIndex = currentMealIndices[plan.dayOfWeek] ?? 0
                        let nextIndex = (currentIndex + 1) % plan.meals.count
                        currentMealIndices[plan.dayOfWeek] = nextIndex
                    }
                }
            }
        }
    }

#Preview {
    MealPlanView()
}

