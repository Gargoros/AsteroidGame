//
//  AsteroidsClassicLoadingView.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//

import SwiftUI

struct AsteroidsClassicLoadingView: View {
    //MARK: - Properties
    @Binding private var showLoading: Bool
    @State private var offsetX: Array<CGFloat> = [0, 0, 0, 0, 0]
    @State private var offsetY: Array<CGFloat> = [0, 0, 0, 0, 0]
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //MARK: - Init
    init(showLoading: Binding<Bool>) {
        self._showLoading = showLoading
    }
    //MARK: - View
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            AsteroidsClassicBGView()
            ZStack {
                AsteroidsClassicUIView(image: Image(.asteroid1), width: width * 0.15)
                    .offset(x: width * 0.25, y: height * 0.5)
                    .offset(x: offsetX[0], y: offsetY[0])
                AsteroidsClassicUIView(image: Image(.asteroid2), width: width * 0.1)
                    .offset(x: width * 0.2, y: height * 0.1)
                    .offset(x: offsetX[1], y: offsetY[1])
                AsteroidsClassicUIView(image: Image(.asteroid3), width: width * 0.25)
                    .offset(x: -width * 0.3, y: height * 0.2)
                    .offset(x: offsetX[2], y: offsetY[2])
                AsteroidsClassicUIView(image: Image(.asteroid4), width: width * 0.17)
                    .offset(x: width * 0.05, y: height * 0.3)
                    .offset(x: offsetX[3], y: offsetY[3])
                AsteroidsClassicUIView(image: Image(.asteroid5), width: width * 0.17)
                    .offset(x: width * 0.1, y: -height * 0.2)
                    .offset(x: offsetX[4], y: offsetY[4])
                VStack{
                    Spacer()
                    Text("Loading...")
                        .textSetting(textSize: width * 0.1)
                    
                }
                .position(x: width * 0.5, y: height * 0.5)
                .padding(.horizontal, width * 0.05)
                .padding(.vertical, height > 755 ? height * 0.055 : height * 0.03)
                
            }
            .onReceive(timer) { _ in
                if showLoading {
                    withAnimation(.easeIn(duration: 20)){
                        for i in 0..<offsetX.count {
                            offsetX[i] = Double.random(in: -300...300)
                        }
                        for i in 0..<offsetY.count {
                            offsetY[i] = Double.random(in: -300...300)
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    AsteroidsClassicLoadingView(showLoading: .constant(true))
}
