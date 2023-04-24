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
        VStack(spacing: 0) {
            MainTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
