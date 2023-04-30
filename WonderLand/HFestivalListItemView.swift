//
//  HFestivalListItemView.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/30.
//

import SwiftUI

// HorizontalList에 들어가는 FestivalItemView
struct HFestivalListItemView: View {

    let festival: MockFestivalViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: festival.posterImageURL, content: { _ in
                Color.red
            }, placeholder: {
                Color.blue
            })
            .frame(width: 120, height: 160)
            .cornerRadius(6)

            VStack(alignment: .leading, spacing: 0) {
                Text(festival.title)
                    .typography(.subtitle3)
                    .foregroundColor(.gray)

                Text(festival.description)
                    .typography(.subtitle3)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct HFestivalListItemView_Previews: PreviewProvider {

    static var previews: some View {
        HFestivalListItemView(festival: .init(posterImageURL: nil,
                                              title: "서울재즈페스티벌",
                                              description: "2023"))
    }
}
