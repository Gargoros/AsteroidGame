//
//  AsteroidsClassicSettingsView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicSettingsView: View {
    //MARK: - Properties
    @Binding private var showSettings: Bool
    @State private var isSoundOn: Bool = AsteroidsClassicUserDefaults.isSoundOn
    @State private var isHapticOn: Bool = AsteroidsClassicUserDefaults.isHapticOn
    @State private var isMusicOn: Bool = AsteroidsClassicUserDefaults.isMusicOn
    @State private var statusOpacity: CGFloat = 1.0
    @State private var statusScale: CGFloat = 1.0
    //MARK: - Init
    init(showSettings: Binding<Bool>) {
        self._showSettings = showSettings
        self.isSoundOn = isSoundOn
        self.isMusicOn = isMusicOn
        self.isHapticOn = isHapticOn
    }
    //MARK: - View
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            AsteroidsClassicBGView()
            VStack{
                HStack{
                    AsteroidsClassicButtonView(bImage: Image(.backwardButton)) { goToMenu() }
                        .frame(height: height * 0.07)
                    Spacer()
                }
                Spacer()
                AsteroidsClassicUIView(image: Image(.window02), width: width * 0.75)
                    .overlay {
                        VStack{
                            Text(AsteroidsClassicAppConstants.appString.settingsTitle)
                                .textNameSettings(textSize: width * 0.07)
                            Spacer()
                            VStack(spacing: height * 0.02){
                                HStack{
                                    Text(AsteroidsClassicAppConstants.appString.soundsTitle)
                                    Spacer()
                                    AsteroidsClassicButtonView(bImage: Image(.soundButton)) { soundsToggle() }
                                    .frame(height: width * 0.1)
                                    .opacity(statusValue(isSoundOn))
                                    .scaleEffect(statusValue(isSoundOn))
                                }
                                HStack{
                                    Text(AsteroidsClassicAppConstants.appString.musicTitle)
                                    Spacer()
                                    AsteroidsClassicButtonView(bImage: Image(.soundButton)) { musicToggle() }
                                    .frame(height: width * 0.1)
                                    .opacity(statusValue(isMusicOn))
                                    .scaleEffect(statusValue(isMusicOn))
                                }
                                HStack{
                                    Text(AsteroidsClassicAppConstants.appString.hapticsTitle)
                                    Spacer()
                                    AsteroidsClassicButtonView(bImage: Image(.vibrationButton)) { hapticsToggle() }
                                    .frame(height: width * 0.1)
                                    .opacity(statusValue(isHapticOn))
                                    .scaleEffect(statusValue(isHapticOn))
                                }
                            }
                            .textNameSettings(textSize: width * 0.09)
                            .padding(.horizontal, width * 0.05)
                            Spacer()
                        }
                        .padding(width * 0.025)
                    }
                Spacer()
            }
            .padding(width * 0.05)
            .position(x: width * 0.5, y: height * 0.5)
        }
    }
    private func goToMenu(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            showSettings = false
        }
    }
    private func statusValue(_ status: Bool) -> CGFloat {
        return status ? 1.0 : 0.85
    }
    private func soundsToggle(){
        isSoundOn.toggle()
        AsteroidsClassicUserDefaults.isSoundOn = isSoundOn
    }
    private func musicToggle(){
        isMusicOn.toggle()
        AsteroidsClassicUserDefaults.isMusicOn = isMusicOn
    }
    private func hapticsToggle(){
        isHapticOn.toggle()
        AsteroidsClassicUserDefaults.isHapticOn = isHapticOn
    }
}

#Preview {
    AsteroidsClassicSettingsView(showSettings: .constant(true))
}
