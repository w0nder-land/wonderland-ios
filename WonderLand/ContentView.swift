//
//  ContentView.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/02/26.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @StateObject var kakaoService: KakaoLoginService = .init()

    @State private var kakaoLoginStatusString: String = ""

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MainTabView()
            }

            OnboardingViewControllerWrapper(currentPage: .constant(0), action: { action in
                switch action {
                case .kakaoLogin:
                    // TODO: Task
                    // kakaoService.handleKakaoLogin()
                    return
                case .takeATour:
                    // TODO: AppStorage
                    return
                }
            })
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
