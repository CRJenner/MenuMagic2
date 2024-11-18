//
//  MealIdeasView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct MealIdeasView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meal Ideas")
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<10) { index in
                        MealCardView(imageName: "TacoImage", mealName: "Tacos", dayName: "Monday")
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


