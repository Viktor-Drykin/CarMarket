//
//  Headline.swift
//  CarMarket
//
//  Created by Viktor Drykin on 20.12.2024.
//
import SwiftUI

struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.weight(.bold))
    }
}
