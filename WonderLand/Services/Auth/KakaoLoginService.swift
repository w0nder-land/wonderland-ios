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
//class KakaoLoginService {


    func handleKakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오 설치되어있는 경우

            // 카카오톡 앱을 통해 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        } else {
            // 카카오 미설치 경우
            // 카카오 웹뷰를 열어서 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
    }
}
