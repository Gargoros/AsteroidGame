//
//  AsteroidsClassicButtonView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicButtonView: View {
    //MARK: - Properties
    @State private var scaleValue = 1.0
    private let bImage: Image
    private let action: () -> Void
    //MARK: - Init
    init(scaleValue: Double = 1.0, bImage: Image, action: @escaping () -> Void) {
        self.bImage = bImage
        self.action = action
    }
    //MARK: - Views
    var body: some View {
        Button {
        } label: {
            bImage
                .resizable()
                .scaledToFit()
                .scaleEffect(scaleValue)
                .animation(.easeInOut(duration: 0.07), value: scaleValue)
                .onLongPressGesture(minimumDuration: .infinity) {
                } onPressingChanged: { isStarted in
                    isStarted ? tapAction() : dragAction()
                }
        }
    }
    private func tapAction() {
        scaleValue = 0.94
    }
    private func dragAction() {
        AsteroidsClassicHapticManager.shared.makeTouch(with: .medium)
        AsteroidsClassicSoundManager.shared.defaultButtonFeedback()
        scaleValue = 1.0
        action()
    }
}

#Preview {
    AsteroidsClassicButtonView(bImage: Image(.bonus01Button), action: {})
}
