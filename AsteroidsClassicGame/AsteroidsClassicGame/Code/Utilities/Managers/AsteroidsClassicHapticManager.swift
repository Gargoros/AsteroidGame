//
//  AsteroidsClassicHapticManager.swift
//  AsteroidsClassicGame  AsteroidsClassic
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

final class AsteroidsClassicHapticManager {
    static let shared = AsteroidsClassicHapticManager()
    private var sensoryGenerator: UIImpactFeedbackGenerator?
    private init() {
        organizeGenerator()
    }
    private func organizeGenerator() {
        sensoryGenerator = UIImpactFeedbackGenerator(style: .soft)
        sensoryGenerator?.prepare()
    }
    func makeTouch(with style: UIImpactFeedbackGenerator.FeedbackStyle) {
        guard AsteroidsClassicUserDefaults.isHapticOn else { return }
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
