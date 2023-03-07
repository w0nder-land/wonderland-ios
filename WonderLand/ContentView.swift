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

    var body: some View {
        VStack(spacing: 10) {
            Text("Heading1 테스트해본다 폰트")
                .typography(.heading1)

            Text("Heading2 테스트해본다 폰트")
                .typography(.heading2)

            Text("Heading3 테스트해본다 폰트")
                .typography(.heading3)

            Button {
                kakaoService.handleKakaoLogin()
            } label: {
                Text("카카오 로그인")
                    .typography(.heading3)
            }

            Button {
                kakaoService.kakaoLogout()
            } label: {
                Text("카카오 로그아웃")
                    .typography(.subtitle1)
            }

            Text("Subtitle1 테스트해본다 폰트")
                .typography(.subtitle1)

            Text("Subtitle2 테스트해본다 폰트")
                .typography(.subtitle2)

            Text("Subtitle3 테스트해본다 폰트")
                .typography(.subtitle3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
