//
//  AsteroidsClassicMainView.swift
//  AsteroidsClassicGame AsteroidsClassic
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicMainView: View {
    //MARK: - Properties
    @Binding private var showMenu: Bool
    @State private var showInfo: Bool     = false
    @State private var showSettings: Bool = false
    @State private var showStore: Bool    = false
    @State private var showAwards: Bool   = false
    @State private var showGame: Bool     = false
    //MARK: - Init
    init(showMenu: Binding<Bool>) {
        self._showMenu = showMenu
    }
    //MARK: - View
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            AsteroidsClassicBGView()
            VStack(spacing: height * 0.05){
                HStack{
                    AsteroidsClassicButtonView(bImage: Image(.infoButton)) { showInfo.toggle() }
                    Spacer()
                    AsteroidsClassicButtonView(bImage: Image(.settingsButton)) { showSettings.toggle() }
                }
                .frame(height: height * 0.07)
                Text("Asteroid Game")
                    .textNameSettings(textSize: width * 0.1)
                Spacer()
                VStack{
                    AsteroidsClassicButtonView(bImage: Image(.startButton)) { showGame.toggle() }
                        .frame(width: width * 0.7)
                    HStack{
                        AsteroidsClassicButtonView(bImage: Image(.ratingButton)) { showAwards.toggle() }
                        Spacer()
                        AsteroidsClassicButtonView(bImage: Image(.shopButton)) { showStore.toggle() }
                    }
                    .frame(height: height * 0.07)
                    .padding(.horizontal, width * 0.2)
                }
                Spacer()
            }
            .padding(width * 0.05)
            .position(x: width * 0.5, y: height * 0.5)
        }
    }
    //TODO: - Added score info and gems info
}

#Preview {
    AsteroidsClassicMainView(showMenu: .constant(true))
}
