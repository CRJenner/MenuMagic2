//
//  StarsModel.swift
//  MenuMagic2
//
//  Created by Chloe Jenner on 18/11/2024.
//
import SwiftUI

struct StarProperties: Identifiable {
    let id = UUID()
    let position: CGPoint
    var scale: CGFloat = 1.0
    var opacity: Double = 1.0
    var hue: Angle = .zero
}

