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
                .font(.custom("SUIT-Bold", size: 24))

            Text("Heading2 테스트해본다 폰트")
                .font(.custom("SUIT-Bold", size: 20))

            Text("Heading3 테스트해본다 폰트")
                .font(.custom("SUIT-Bold", size: 14))

            Text("Subtitle1 테스트해본다 폰트")
                .font(.custom("SUIT-SemiBold", size: 18))

            Text("Subtitle2 테스트해본다 폰트")
                .font(.custom("SUIT-SemiBold", size: 16))

            Text("Subtitle3 테스트해본다 폰트")
                .font(.custom("SUIT-SemiBold", size: 14))

            Text("Heading1 suit 폰트로 적용")
                .font(.suit(.bold, size: 24))

            Text("Heading2 suit 폰트로 적용")
                .font(.suit(.bold, size: 20))

            Text("Heading3 suit 폰트로 적용")
                .font(.suit(.bold, size: 14))
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
