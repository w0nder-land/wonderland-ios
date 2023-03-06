//
//  ContentView.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/02/26.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        VStack(spacing: 10) {
            Text("Heading1 테스트해본다 폰트")
                .typography(.heading1)

            Text("Heading2 테스트해본다 폰트")
                .typography(.heading2)

            Text("Heading3 테스트해본다 폰트")
                .typography(.heading3)

            Button {
                debugPrint("test")
            } label: {
                Text("카카오 로그인")
                    .typography(.heading3)
            }


            Text("Subtitle1 테스트해본다 폰트")
                .typography(.subtitle1)

            Text("Subtitle2 테스트해본다 폰트")
                .typography(.subtitle2)

            Text("Subtitle3 테스트해본다 폰트")
                .typography(.subtitle3)

            Text("Heading1 suit 폰트로 적용")
                .font(.suit(.bold, size: 24))

            Text("Heading2 suit 폰트로 적용")
                .font(.suit(.bold, size: 20))

            Text("Heading3 suit 폰트로 적용")
                .font(.suit(.bold, size: 14))
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
