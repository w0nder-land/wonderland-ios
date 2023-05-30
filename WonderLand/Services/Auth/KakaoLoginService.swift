//
//  KakaoLoginService.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/03/07.
//

import Foundation

import Combine
import KakaoSDKUser

class KakaoLoginService: ObservableObject {

    @Published var isLoggedIn: Bool = false
    @Published var accessToken: String?

    // 카카오톡 설치 여부를 확인하여 앱, 웹뷰로 로그인 처리 메서드
    @MainActor
    func handleKakaoLogin() {
        Task {
            // 카카오톡 실행 가능 여부 확인
            if (UserApi.isKakaoTalkLoginAvailable()) {
                // 카카오 설치되어있는 경우
                isLoggedIn = await handleLoginWithKakaoTalkApp()
            } else {
                // 카카오 미설치 경우
                isLoggedIn = await handleLoginWithKakaoAccount()
            }
        }
    }

    // 카카오톡 앱을 통해 로그인
    func handleLoginWithKakaoTalkApp() async -> Bool {

        await withCheckedContinuation({ continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    self.accessToken = oauthToken?.accessToken
                    continuation.resume(returning: true)
                }
            }
        })
    }

    // 카카오 웹뷰를 열어서 계정정보 입력을 통한 로그인
    func handleLoginWithKakaoAccount() async -> Bool {

        await withCheckedContinuation({ continuation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                    self.accessToken = oauthToken?.accessToken
                    continuation.resume(returning: true)
                }
            }
        })
    }

    // 내부 handleKakaoLogout를 호출하여 실제로 로그아웃 처리 메서드
    @MainActor
    func kakaoLogout() {
        // async await 함수는 Task 블럭안에서 실행해야함
        Task {
            if await handleKakaoLogout() {
                isLoggedIn = false
            }
        }
    }

    // 로그아웃을 처리하는 async await 메서드
    func handleKakaoLogout() async -> Bool {

        await withCheckedContinuation({ continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning: true)
                }
            }
        })
    }
}
