//
//  MealCardView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct MealCardView: View {
    var imageName: String
    var mealName: String
    var dayName: String
    
    var body: some View {
        ZStack {
            // Background Image
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 180)
                .clipped()
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
            LinearGradient(
                           gradient: Gradient(colors: [Color.black.opacity(0.8), Color.clear]),
                           startPoint: .bottom,
                           endPoint: .top
                       )
                       .cornerRadius(12)
            
            // Overlay Text
            VStack {
                Spacer()
                Text(mealName)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .lineLimit(1)
                    .padding(.bottom, 1)
                Text(dayName.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
            }
            .padding(5)
        }
        .frame(width: 130, height: 180)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    MealCardView(imageName: "tacos", mealName: "Tacos", dayName: "Monday")
}

