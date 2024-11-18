//
//  Home.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var mealPlanModel: MealPlanModel

    var body: some View {
        NavigationView {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            HeaderView()
                            MealPlanView()
                                .padding(.horizontal)
                            MealIdeasView()
                            NavigationLink(destination: RecipeBookView()) {
                                Text("View Recipe Book")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)

                            ShoppingListView()
                        }
                    }
                    .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
                }
            }
        }

#Preview {
    
}
