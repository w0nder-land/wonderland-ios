//
//  MainTab.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/25.
//

import SwiftUI

enum MainTab: Int {

    case home
    case search
    case calendar
    case my
}

extension MainTab {

    var localizedStringKey: LocalizedStringKey {
        switch self {
        case .home:
            return "mainTabHome"
        case .search:
            return "mainTabSearch"
        case .calendar:
            return "mainTabCalendar"
        case .my:
            return "mainTabMy"
        }
    }

    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .calendar:
            return "calendar"
        case .my:
            return "person"
        }
    }
}
