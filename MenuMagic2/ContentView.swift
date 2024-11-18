//
//  ContentView.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
   
    var body: some View {
            ZStack {
                Color.black
                .ignoresSafeArea()
            if showSplash {
                SplashScreen()
                    .ignoresSafeArea()
            } else {
                DashboardView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
