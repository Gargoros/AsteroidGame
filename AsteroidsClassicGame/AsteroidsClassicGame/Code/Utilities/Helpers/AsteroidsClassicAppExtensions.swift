//
//  AsteroidsClassicAppExtensions.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

extension View {
    //MARK: - SafeArea + Status bar
    func mainModifier() -> some View{
        self
            .modifier(AsteroidsClassicMainViewModifier())
    }
}
