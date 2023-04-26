//
//  SearchScreen.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/25.
//

import SwiftUI

enum ContentViewState {

    case initial
    case onCommit
}

struct SearchScreen: View {

    // MARK: Need State
    /*
     contentState: ContentViewState (.initial, onCommit)
     검색어
     이전 검색 내역 (갯수제한)
     페스티벌 카테고리
     검색된 페스티벌 목록
     검색결과 없는경우 추천 축제들
     */

    // MARK: Need Action
    /*
     onCommit query
     onEditing query
     select item (which item?) case by case
     */

    // MARK: Need Buisness logic
    /*
     검색 api 호출
     페이지 네이션
     검색 결과가 있을 경우 검색 내역 저장
     */

    @State private var contentViewState: ContentViewState = .initial
    @State private var hasSearchedFestival: Bool = false
    @State private var text: String = ""

    var body: some View {
        VStack(spacing: 0) {
            SearchTextField(text: $text)

            ScrollView {
                switch contentViewState {
                case .initial:
                    hotSearches()
                        .padding(.top, 20)
                case .onCommit:
                    searchedFestivals()
                }
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.black)
    }

    // MARK: HotSearches

    private func hotSearches() -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("실시간 인기 검색어")
                .typography(.subtitle2)
                .foregroundColor(.gray)

            // TODO: ForEach
            LazyVStack(spacing: 16) {
                hotSearchItem(rank: 1, hotSearchQuery: "서울뮤직페스티벌")

                hotSearchItem(rank: 2, hotSearchQuery: "워터밤 서울")

                hotSearchItem(rank: 3, hotSearchQuery: "서울재즈페스티벌")

                hotSearchItem(rank: 4, hotSearchQuery: "뷰티풀 민트 라이프")
            }
        }
    }

    private func hotSearchItem(rank: Int, hotSearchQuery: String) -> some View {
        HStack(spacing: 15) {
            Text("\(rank)")
                .typography(.subtitle2)
                .foregroundColor(.pink)

            Text(hotSearchQuery)
                .typography(.body1)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 34)
        .contentShape(Rectangle())
    }

    // MARK: SearchedFestivals

    private func searchedFestivals() -> some View {
        VStack(alignment: .leading, spacing: 18) {
            // Tabs
            HStack(spacing: 0) {
                Color.white
                    .frame(width: 28, height: 42)

                Color.blue
                    .frame(width: 28, height: 42)

                Color.red
                    .frame(width: 28, height: 42)
            }

            // TODO: ForEach
            LazyVStack(spacing: 16) {
                hotSearchItem(rank: 1, hotSearchQuery: "서울뮤직페스티벌")

                hotSearchItem(rank: 2, hotSearchQuery: "워터밤 서울")

                hotSearchItem(rank: 3, hotSearchQuery: "서울재즈페스티벌")

                hotSearchItem(rank: 4, hotSearchQuery: "뷰티풀 민트 라이프")
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {

    static var previews: some View {
        SearchScreen()
    }
}
