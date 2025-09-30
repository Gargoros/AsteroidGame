//
//  AsteroidsClassicUIView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicUIView: View {
    //MARK: - Properties
    private let image: Image
    private let width: CGFloat
    //MARK: - Init
    init(image: Image, width: CGFloat) {
        self.image = image
        self.width = width
    }
    //MARK: - Views
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: width)
    }
}

#Preview {
    AsteroidsClassicUIView(image: Image(.asteroid1), width: 200)
}
