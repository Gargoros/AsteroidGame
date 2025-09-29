//
//  AsteroidsClassicViewModifiers.swift
//  AsteroidsClassicGame  AsteroidsClassic
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicMainViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .ignoresSafeArea()
            .statusBarHidden(true)
    }
}

struct AsteroidsClassicTextViewModifiers: ViewModifier {
    //MARK: - Properties
    private let textColor: Color
    private let textSize: CGFloat
    private let shadowColor: Color
    //MARK: - Init
    init(textColor: Color, textSize: CGFloat, shadowColor: Color) {
        self.textColor = textColor
        self.textSize = textSize
        self.shadowColor = shadowColor
    }
    //MARK: - View
    func body(content: Content) -> some View {
        content
            .font(.custom(AsteroidsClassicAppConstants.fonts.regular, size: textSize))
            .foregroundStyle(textColor)
            .minimumScaleFactor(0.01)
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .shadow(color: shadowColor, radius: 0.1, x: 0.0, y: 2.0)
    }
}
