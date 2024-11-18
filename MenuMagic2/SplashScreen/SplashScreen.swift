//
//  SplashScreen.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI


struct SplashScreen: View {
    @State private var stars: [StarProperties] = []
    @State private var angle: Angle = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(
                        AngularGradient(gradient: Gradient(colors: [ .blue, .black, .blue]), center: .top, angle: angle)
                    )
                    .ignoresSafeArea()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .blur(radius: 24)
                    .opacity(0.9)
                    .animation(Animation.easeInOut(duration: 5.0).repeatForever(), value: angle)
                
                let randomFrame = CGFloat.random(in: 0...50)
                ForEach(stars) { star in
                    Star()
                        .fill(Color.mint)
                        .frame(width: randomFrame, height: randomFrame)
                        .scaleEffect(star.scale)
                        .opacity(star.opacity)
                        .position(star.position)
                        .hueRotation(star.hue)
                        .blur(radius: star.opacity)
                        .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                }
            }
            .ignoresSafeArea()
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.5))
                {
                    self.angle = .degrees(360)
                }
                startAnimatingStars(in: geometry.size)
            }
        }
    }
    func startAnimatingStars(in size: CGSize) {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {_ in
            let randomX  = CGFloat.random(in: 0..<size.width)
            let randomY  = CGFloat.random(in: 0..<size.height)
            let randomHue = Angle(degrees: Double(CGFloat.random(in: 0...360)))
            
            let newStar = StarProperties(position: CGPoint(x: randomX, y: randomY))
            stars.append(newStar)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if let index = stars.firstIndex(where: { $0.id == newStar.id}) {
                    stars[index].scale = 2.0
                    stars[index].opacity = 0.0
                    stars[index].hue = randomHue
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                stars.removeAll(where: { $0.id == newStar.id })
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
            timer.invalidate()
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
                SplashScreen()
            .preferredColorScheme(.dark)
    }
}
