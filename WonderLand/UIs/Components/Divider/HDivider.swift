//
//  HDivider.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/29.
//

import SwiftUI

struct HDivider: View {

    private let height: CGFloat
    private let color: Color

    init(height: CGFloat = 1, color: Color = .black) {
        self.height = height
        self.color = color
    }

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .frame(maxWidth: .infinity)
    }
}

struct HDivider_Previews: PreviewProvider {

    static var previews: some View {
        HDivider()
    }
}
