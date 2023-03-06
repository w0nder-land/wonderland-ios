//
//  Typography.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/02/28.
//

import SwiftUI

// 프로젝트 내부에서 SUIT 폰트를 이용하여 사용할 Typography

struct Typography {

    let suit: SUIT
    let size: CGFloat
}

extension Typography {

    static var heading1: Typography {
        .init(suit: .bold, size: 24)
    }

    static var heading2: Typography {
        .init(suit: .bold, size: 20)
    }

    static var heading3: Typography {
        .init(suit: .bold, size: 14)
    }

    static var subtitle1: Typography {
        .init(suit: .semiBold, size: 18)
    }

    static var subtitle2: Typography {
        .init(suit: .semiBold, size: 16)
    }

    static var subtitle3: Typography {
        .init(suit: .semiBold, size: 14)
    }

    // TODO: 폰트 케이스 추가
}

extension View {

    func typography(_ typography: Typography) -> some View {
        self.font(.suit(typography.suit, size: typography.size))
    }
}
