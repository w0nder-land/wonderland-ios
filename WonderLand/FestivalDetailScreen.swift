//
//  FestivalDetailScreen.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/29.
//

import SwiftUI

struct FestivalDetailScreen: View {

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    posterImage

                    VStack(spacing: 48) {
                        title
                            .padding(.horizontal, 20)

                        defaultInformation
                            .padding(.horizontal, 20)

                        ArtistListView()

                        FestivalDetailInformationView()

                        RecommendFestivalListView()
                    }
                    .padding(.bottom, 85)

                    Spacer()
                }
            }

            MainBottomButton()
        }
        .background(Color.black)
    }

    private var posterImage: some View {
        Image("poster")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .overlay(Color.white)
    }

    private var title: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Haus of Wonder")
                .typography(.init(suit: .bold, size: 32))
                .foregroundColor(.gray50)

            Text("국내외 최정상 뮤지션들이 참여하는 음악 페스티벌로 다양한 서비스를 선보이는 원더월이 개최하는 첫 음악 페스티벌이다.")
                .typography(.body1)
                .foregroundColor(.gray200)
        }
        .padding(.top, 32)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var defaultInformation: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("기본 정보")
                .typography(.heading2)
                .foregroundColor(.gray100)

            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 37) {
                        Text("기간")
                            .typography(.subtitle2)
                            .foregroundColor(.gray100)
                            .frame(width: 56, alignment: .leading)

                        Text("2022.08.06(토)~2022.08.07(일)")
                            .typography(.body1)
                            .foregroundColor(.gray200)
                    }

                    HStack(spacing: 37) {
                        Text("장소")
                            .typography(.subtitle2)
                            .foregroundColor(.gray100)
                            .frame(width: 56, alignment: .leading)

                        Text("일산 킨텍스 제2전시관 7,8홀")
                            .typography(.body1)
                            .foregroundColor(.gray200)
                    }

                    HStack(spacing: 37) {
                        Text("관람시간")
                            .typography(.subtitle2)
                            .foregroundColor(.gray100)
                            .frame(width: 56, alignment: .leading)

                        Text("600분(인터미션 245분)")
                            .typography(.body1)
                            .foregroundColor(.gray200)
                    }

                    HStack(spacing: 37) {
                        Text("관람연령")
                            .typography(.subtitle2)
                            .foregroundColor(.gray100)
                            .frame(width: 56, alignment: .leading)

                        Text("전체관람가)")
                            .typography(.body1)
                            .foregroundColor(.gray200)
                    }

                    // MARK: 여기만 예외처리
                    HStack(spacing: 37) {
                        Text("공식")
                            .typography(.subtitle2)
                            .foregroundColor(.gray100)
                            .frame(width: 56, alignment: .leading)

                        Text("홈페이지 ㅣ 인스타그램 ㅣ 유튜브")
                            .typography(.body1)
                            .foregroundColor(.gray200)
                    }
                }

                TicketView()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FestivalDetailScreen_Previews: PreviewProvider {

    static var previews: some View {
        FestivalDetailScreen()
    }
}

struct TicketView: View {

    // 디자인이 티켓 종류 3개에 대응해서 나왔으므로 .prefix 사용해주고, 종류 추가 시 디자이너에게 요청해야함
    @State var tickets: [String] = ["멜론 티켓", "인터파크 티켓", "네이버 예약"]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    HStack(spacing: 6) {
                        Text("티켓 오픈")
                            .typography(.subtitle2)
                            .foregroundColor(.gray100)

                        Text("D-24")
                            .typography(.caption1)
                            .foregroundColor(.primary500)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .stroke(Color.primary500)
                            )
                    }

                    Spacer()

                    Text("2023.03.17(금) 20:00")
                        .typography(.body2)
                        .foregroundColor(.gray100)
                }
                .frame(height: 60)
                .padding(.horizontal, 20)


                HStack(spacing: 0) {
                    ForEach(tickets, id:\.self) { ticket in
                        if tickets.first != ticket {
                            VDivider(color: .gray600)
                                .frame(height: 13)
                                .padding(.horizontal, 10)
                        }

                        HStack(spacing: 4) {
                            Text(ticket)
                                .typography(.body2)
                                .foregroundColor(.gray200)

                            Image(systemName: "arrow.up.forward")
                                .resizable()
                                .frame(width: 7, height: 7)
                                .frame(width: 16, height: 16)
                        }
                    }
                }
                .frame(height: 60)
            }

            Divider()
                .foregroundColor(.red)
                .padding(.horizontal, 20)
        }
        .frame(width: 335, height: 120)
        .background(Color.gray800.clipShape(TicketShape()))
        .cornerRadius(3)
    }
}

struct TicketShape: Shape {

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))

            path.move(to: CGPoint(x: 0, y: 0))
            path.addArc(center: CGPoint(x: 0, y: Double(rect.height / 2)),
                        radius: 7,
                        startAngle: .init(degrees: -90),
                        endAngle: .init(degrees: 90),
                        clockwise: false)
            path.move(to: CGPoint(x: rect.width, y: 0))
            path.addArc(center: CGPoint(x: rect.width, y: Double(rect.height / 2)),
                        radius: 7,
                        startAngle: .init(degrees: 90),
                        endAngle: .init(degrees: -90),
                        clockwise: false)
        }
    }
}

struct ArtistListView: View {

    @State var artists: [String] = ["다운", "톰미쉬", "콜드", "자이언티"]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("artists")
                .typography(.heading2)
                .foregroundColor(.gray100)
                .padding(.horizontal, 20)

            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(artists, id:\.self) { artist in
                        VStack(spacing: 9) {
                            Color.gray
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())

                            Text(artist)
                                .typography(.body2)
                                .foregroundColor(.gray200)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct RecommendFestivalListView: View {

    @State var festivalItems: [MockFestivalViewModel] = [.init(posterImageURL: nil,
                                                               title: "서울재즈페스티벌",
                                                               description: "2023"),
                                                         .init(posterImageURL: nil,
                                                               title: "서울재즈페스티벌",
                                                               description: "2011"),
                                                         .init(posterImageURL: nil,
                                                               title: "서울재즈페스티벌",
                                                               description: "2023"),
                                                         .init(posterImageURL: nil,
                                                               title: "서울재즈페스티벌",
                                                               description: "2023")]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("recommendedFestival")
                .typography(.heading2)
                .foregroundColor(.gray100)
                .padding(.horizontal, 20)

            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(festivalItems) { festival in
                        HFestivalListItemView(festival: festival)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct FestivalDetailInformationView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("moreInformation")
                .typography(.heading2)
                .foregroundColor(.gray100)
                .padding(.horizontal, 20)

            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    Image("FestivalInfoDummyImage")
                        .resizable()
                        .frame(height: 808)

                    ZStack(alignment: .bottom) {
                        LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple.opacity(0)]),
                                       startPoint: .top,
                                       endPoint: .bottom)

                        Image(systemName: "arrow.down")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)

                            .padding(.horizontal, 20)
                            .padding(.bottom, 8)
                    }
                    .frame(height: 155)
                }

                HDivider(height: 8, color: .gray)
            }
        }
    }
}

// TODO: 네이밍 수정
private struct MainBottomButton: View {

    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Image(systemName: "heart")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)

                Text("12")
                    .typography(.caption1)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 7)
            .padding(.top, 3)
            .padding(.bottom, 1)

            Text("예매하기")
                .typography(.subtitle2)
                .foregroundColor(.gray900)
                .frame(width: 335, height: 48)
                .background {
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(Color.white)

                }

        }
        .padding(.horizontal, 20)
        .padding(.top, 14)
        .padding(.bottom, 8)
        .background(Color.gray900)
    }
}

struct MockFestivalViewModel: Identifiable {

    let id: UUID
    let posterImageURL: URL?
    let title: String
    let description: String
    let isEnded: Bool?

    init(id: UUID = UUID(),
         posterImageURL: URL?,
         title: String,
         description: String,
         isEnded: Bool? = nil) {
        self.id = id
        self.posterImageURL = posterImageURL
        self.title = title
        self.description = description
        self.isEnded = isEnded
    }
}
