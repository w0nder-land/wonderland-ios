//
//  SUIT.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/02/26.
//

import SwiftUI

enum SUIT: String {

    /// 400
    case regular = "SUIT-Regular"
    /// 600
    case semiBold = "SUIT-SemiBold"
    /// 700
    case bold = "SUIT-Bold"

    var name: String {
        rawValue
    }

    var weight: Font.Weight {
        switch self {
        case .regular:
            return .regular
        case .semiBold:
            return .semibold
        case .bold:
            return .bold
        }
    }
}

extension Font {

    static func suit(_ suit: SUIT, size: CGFloat) -> Font {
        return custom(suit.name, size: size)
    }

    static func suit(_ suit: SUIT, fixedSize: CGFloat) -> Font {
        return custom(suit.name, fixedSize: fixedSize)
    }
}

extension UIFont {

    static func suit(_ suit: SUIT, size: CGFloat) -> UIFont {
        return UIFont(name: suit.name, size: size)!
    }
}
