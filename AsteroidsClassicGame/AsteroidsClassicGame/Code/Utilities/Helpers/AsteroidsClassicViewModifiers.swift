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
