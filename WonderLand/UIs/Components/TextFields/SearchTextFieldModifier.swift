//
//  SearchTextFieldModifier.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/25.
//

import SwiftUI

struct SearchTextFieldModifier: ViewModifier {

    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    let backgroundColor: Color
    // 커서 컬러
    let accentColor: Color
    let cornerRadius: CGFloat

    init(verticalPadding: CGFloat = 9,
         horizontalPadding: CGFloat = 16,
         backgroundColor: Color = Color.gray,
         accentColor: Color = Color.red,
         cornerRadius: CGFloat = 20) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.cornerRadius = cornerRadius
    }

    func body(content: Content) -> some View {
        content
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .accentColor(accentColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
}
