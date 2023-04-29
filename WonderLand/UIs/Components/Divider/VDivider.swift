//
//  VDivider.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/29.
//

import SwiftUI

struct VDivider: View {

    private let width: CGFloat
    private let color: Color

    init(width: CGFloat = 1, color: Color = .black) {
        self.width = width
        self.color = color
    }

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width)
            .frame(maxHeight: .infinity)
    }
}

struct VDivider_Previews: PreviewProvider {

    static var previews: some View {
        VDivider()
    }
}

