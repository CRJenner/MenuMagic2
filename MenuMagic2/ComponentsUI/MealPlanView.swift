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


        @State private var currentMealIndex: Int = 0
        @State private var timer: Timer? = nil

    private var today: DayOfWeek {
            let weekday = Calendar.current.component(.weekday, from: Date())
        switch weekday {
            case 1: return .sunday
            case 2: return .monday
            case 3: return .tuesday
            case 4: return .wednesday
            case 5: return .thursday
            case 6: return .friday
            case 7: return .saturday
            default: return .monday 
            }
        }

        private var todayMealPlan: MealPlan? {
            mealPlans.first(where: { $0.dayOfWeek == today })
        }

        private var otherDaysMealPlans: [MealPlan] {
            mealPlans.filter { $0.dayOfWeek != today }
        }

        var body: some View {
            VStack {
                // Highlight today's meals
                if let todayPlan = todayMealPlan, !todayPlan.meals.isEmpty {
                    VStack {
                        Text("Today's Meals")
                            .font(.title)
                            .padding(.bottom)

                        let currentMeal = todayPlan.meals[currentMealIndex]
                        MealCardView(
                            imageName: currentMeal.imageName ?? "default_image",
                            mealName: currentMeal.title,
                            dayName: today.rawValue.description
                        )
                        .frame(height: 300)
                        .onAppear {
                            startTodayMealCycle(todayPlan)
                        }
                        .onDisappear {
                            timer?.invalidate()
                        }
                    }
                } else {
                    Text("No meals planned for today.")
                        .font(.headline)
                        .padding()
                }

                // Horizontal scroll for other days
                Text("This Week's Meals")
                    .font(.headline)
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(otherDaysMealPlans, id: \.dayOfWeek) { plan in
                            MealCardView(
                                imageName: plan.meals.first?.imageName ?? "default_image",
                                mealName: plan.meals.first?.title ?? "No Meals",
                                dayName: plan.dayOfWeek.rawValue.description
                            )
                        }
                    }
                    .padding()
                }
            }
        }

        private func startTodayMealCycle(_ plan: MealPlan) {
            timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
                withAnimation {
                    currentMealIndex = (currentMealIndex + 1) % plan.meals.count
                }
            }
        }
    }

    #Preview {
        MealPlanView()
    }
