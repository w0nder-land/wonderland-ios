//
//  VFestivalListItemView.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/30.
//

import SwiftUI

struct VFestivalListItemView: View {

    let festival: MockFestivalViewModel
    
    var body: some View {
        HStack(spacing: 17) {
            AsyncImage(url: festival.posterImageURL, content: { _ in
                Color.red
            }, placeholder: {
                Color.blue
            })
            .frame(width: 70, height: 92)
            .cornerRadius(6)

            VStack(alignment: .leading, spacing: 2) {
                if let festivalIsEnded = festival.isEnded,
                   festivalIsEnded {
                    Text("festivalIsEnd")
                        .typography(.caption1)
                        .foregroundColor(.gray)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 6)
                        .background(Color.blue)
                        .cornerRadius(4)
                }
                Text(festival.title)
                    .typography(.subtitle1)
                    .foregroundColor(.white)

                Text(festival.description)
                    .typography(.body2)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct VFestivalListItemView_Previews: PreviewProvider {

    static var previews: some View {
        VFestivalListItemView(festival: .init(posterImageURL: nil,
                                              title: "서울재즈페스티벌",
                                              description: "2023",
                                              isEnded: true))
        .background(Color.black)
    }
}
