//
//  HeaderView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hello Jenner Family!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Here are your meal ideas for the week so far.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                // Navigate to Profile//settings stuff
            }) {
                Image(systemName: "person.circle")
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    HeaderView()
}
