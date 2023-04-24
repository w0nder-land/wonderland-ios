//
//  MainTabView.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/25.
//

import SwiftUI

struct MainTabView: View {

    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
        TabView {
            HomeScreen()
                .tabItem { tabItemLabel(tab: .home) }

            SearchScreen()
                .tabItem { tabItemLabel(tab: .search) }

            CalendarScreen()
                .tabItem { tabItemLabel(tab: .calendar) }

            MyScreen()
                .tabItem { tabItemLabel(tab: .my) }
        }
        .accentColor(Color.white)
    }

    @ViewBuilder
    private func tabItemLabel(tab: MainTab) -> some View {
        Label(tab.localizedStringKey, systemImage: tab.systemImageName)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
