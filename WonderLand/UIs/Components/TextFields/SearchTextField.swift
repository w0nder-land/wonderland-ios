//
//  SearchTextField.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/25.
//

import SwiftUI

// TODO: onEditing, onCommit
struct SearchTextField: View {

    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 0) {
            TextField("searchFestivals", text: $text)
                .typography(.subtitle3)

            if text.isEmpty {
                Image(systemName: "magnifyingglass")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            } else {
                Image(systemName: "x.circle")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .contentShape(Rectangle())
                    .onTapGesture(perform: clear)
            }
        }
        .frame(height: 24)
        .modifier(SearchTextFieldModifier())
    }

    private func clear() {
        text = ""
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(text: .constant("힙합 축제"))
    }
}
