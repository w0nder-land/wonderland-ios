//
//  AppDelegate.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/03/06.
//

import UIKit

import KakaoSDKAuth
import KakaoSDKCommon

// TODO: UIKit과 함께가 아닌 온전하게 SceneDelegate만 사용하는 방법에 대해 공부하여 적용하기

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let kakaoAppKey = Bundle.main.infoDictionary?["KakaoNativeAppKey"] ?? ""
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }

        return false
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfiguration = UISceneConfiguration(name: nil,
                                                      sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = SceneDelegate.self

        return sceneConfiguration
    }
}


