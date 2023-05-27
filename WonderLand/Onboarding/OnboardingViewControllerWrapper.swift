//
//  OnboardingViewControllerWrapper.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/05/22.
//

import SwiftUI

import SnapKit

struct OnboardingViewControllerWrapper: UIViewControllerRepresentable {

    @Binding var currentPage: Int

    init(currentPage: Binding<Int>) {
        self._currentPage = currentPage
    }

    func makeUIViewController(context: Context) -> OnboardingViewController {
        let onboardingViewController = OnboardingViewController(currentPage: $currentPage)
        return onboardingViewController
    }

    func updateUIViewController(_ viewController: OnboardingViewController, context: Context) {}
}

struct OnboardingViewControllerWrapper_Previews: PreviewProvider {

    static var previews: some View {
        OnboardingViewControllerWrapper(currentPage: .constant(1))
            .ignoresSafeArea()
    }
}

class OnboardingViewController: UIViewController {

    @Binding var currentPagePage: Int
    private let scrollView: UIScrollView = .init()
    private let pageControl: UIPageControl = .init()
    private var onboardingImage01: UIImageView = UIImageView(image: .init(named: "OnboardingCard01"))
    private var onboardingImage02: UIImageView = UIImageView(image: .init(named: "OnboardingCard02"))
    private var onboardingImage03: UIImageView = UIImageView(image: .init(named: "OnboardingCard03"))
    private var onboardingImage04: UIImageView = UIImageView(image: .init(named: "OnboardingCard04"))
    private let backgroundImageView: UIImageView = UIImageView(image: .init(named: "OnboardingScreenBackground"))
    private var pages: [Int] = [0, 1, 2, 3]

    // UIButton Configuration
    private var startButtonConfiguration = UIButton.Configuration.plain()
    private var signUpWithKakaoButtonConfiguration = UIButton.Configuration.plain()
    private let startButton: UIButton = .init()
    private let signUpWithKakaoButton: UIButton = .init()
    private let skipButton: UIButton = .init()

    private let leading1: CGFloat = (UIScreen.main.bounds.height / 812) * 375 / 375 * 40
    private let leading2: CGFloat = (UIScreen.main.bounds.height / 812) * 375 / 375 * 296

    let cardHeight: CGFloat = (UIScreen.main.bounds.height / 812) * 310
    private let cardRatio: CGFloat = 212 / 310
    let cardWidth: CGFloat = ((UIScreen.main.bounds.height / 812) * 310) * 212 / 310

    // 온보딩 이미지 아이템간 스페이싱
    private let itemSpacing: CGFloat = (UIScreen.main.bounds.height / 812) * 375 / 375 * 30

    private let topPadding1: CGFloat = (UIScreen.main.bounds.height / 812) * 166
    private let topPadding2: CGFloat = (UIScreen.main.bounds.height / 812) * 300

    private let pageControlBottomPadding: CGFloat = (UIScreen.main.bounds.height / 812) * 135

    private var isSkip: Bool = false

    init(currentPage: Binding<Int>) {
        self._currentPagePage = currentPage
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImageView.frame = UIScreen.main.bounds
        self.view.addSubview(backgroundImageView)
        configureScrollView()
        configurePageControl()
        configureButtonConfiguration()
        configureButtons()
    }

    private func configureScrollView() {
        let frame = UIScreen.main.bounds
        scrollView.frame = frame
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        configureConstraintToSuperView(for: scrollView)

        scrollView.contentSize = CGSize(width: frame.width * CGFloat(pages.count), height: frame.height)
        scrollView.addSubview(onboardingImage01)
        scrollView.addSubview(onboardingImage02)
        scrollView.addSubview(onboardingImage03)
        scrollView.addSubview(onboardingImage04)

        // 초기상태 blur 처리
        self.onboardingImage02.image = onboardingImage02.image?.applyBlur(radius: 5)
        self.onboardingImage03.image = onboardingImage03.image?.applyBlur(radius: 5)
        self.onboardingImage04.image = onboardingImage04.image?.applyBlur(radius: 5)

        onboardingImage01.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topPadding1)
            make.leading.equalToSuperview().offset(leading1)
            make.width.equalTo(cardHeight * cardRatio)
            make.height.equalTo(cardHeight)
        }

        onboardingImage02.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topPadding2)
            make.leading.equalToSuperview().offset(leading2)
            make.width.equalTo(cardHeight * cardRatio)
            make.height.equalTo(cardHeight)
        }

        onboardingImage03.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topPadding1)
            make.leading.equalToSuperview().offset(frame.width + leading2)
            make.width.equalTo(cardHeight * cardRatio)
            make.height.equalTo(cardHeight)
        }

        onboardingImage04.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topPadding2)
            make.leading.equalToSuperview().offset(frame.width * 2 + leading2)
            make.width.equalTo(cardHeight * cardRatio)
            make.height.equalTo(cardHeight)
        }
    }

    private func configurePageControl() {
        pageControl.currentPageIndicatorTintColor = UIColor(red: 90/256, green: 97/256, blue: 102/256, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor(red: 197/256, green: 200/256, blue: 206/256, alpha: 1)
        pageControl.numberOfPages = pages.count - 1
        pageControl.hidesForSinglePage = true
        pageControl.frame.size = .init(width: 69, height: 11)
        pageControl.isUserInteractionEnabled = false
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-pageControlBottomPadding)
        }
    }

    private func configureButtonConfiguration() {
        startButtonConfiguration.contentInsets = NSDirectionalEdgeInsets.init(top: 15, leading: 130, bottom: 15, trailing: 20)
        startButtonConfiguration.background.cornerRadius = 28
        startButtonConfiguration.background.strokeColor = .black
        startButtonConfiguration.background.strokeWidth = 1
        startButtonConfiguration.baseForegroundColor = .black
        startButtonConfiguration.cornerStyle = .capsule
        startButtonConfiguration.imagePlacement = .trailing
        startButtonConfiguration.imagePadding = 77
        startButtonConfiguration.titleAlignment = .center

        signUpWithKakaoButtonConfiguration.contentInsets = NSDirectionalEdgeInsets.init(top: 15, leading: 20, bottom: 15, trailing: 20)
        signUpWithKakaoButtonConfiguration.background.cornerRadius = 28
        signUpWithKakaoButtonConfiguration.background.strokeColor = .black
        signUpWithKakaoButtonConfiguration.background.strokeWidth = 1
        signUpWithKakaoButtonConfiguration.baseForegroundColor = .black
        signUpWithKakaoButtonConfiguration.cornerStyle = .capsule
        signUpWithKakaoButtonConfiguration.titleAlignment = .center
    }

    private func configureButtons() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("start".localized(), for: .normal)
        startButton.setImage(UIImage(named: "ArrowRight"), for: .normal)
        startButton.addTarget(self, action: #selector(goLastOnboardingPage), for: .touchUpInside)
        startButton.configuration = startButtonConfiguration

        view.addSubview(startButton)

        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            // TODO: 상수 비율로 값주기
            make.top.equalTo(pageControl.snp.bottom).offset(40)
            make.width.equalTo(326)
            make.height.equalTo(58)
        }

        signUpWithKakaoButton.translatesAutoresizingMaskIntoConstraints = false
        signUpWithKakaoButton.setTitle("signUpWithKakao".localized(), for: .normal)
        signUpWithKakaoButton.addTarget(self, action: #selector(signUpWithKakao), for: .touchUpInside)
        signUpWithKakaoButton.configuration = signUpWithKakaoButtonConfiguration
        signUpWithKakaoButton.isHidden = true

        view.addSubview(signUpWithKakaoButton)

        signUpWithKakaoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            // TODO: 상수 비율로 값주기
            make.top.equalTo(onboardingImage04.snp.bottom).offset(104)
            make.width.equalTo(326)
            make.height.equalTo(58)
        }

        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitle("takeATour".localized(), for: .normal)
        skipButton.setTitleColor(.black, for: .normal)
        skipButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        skipButton.isHidden = true

        view.addSubview(skipButton)

        skipButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            // TODO: 상수 비율로 값주기
            make.top.equalTo(signUpWithKakaoButton.snp.bottom).offset(28)
            make.width.equalTo(116)
            make.height.equalTo(24)
        }
    }

    @objc private func goLastOnboardingPage() {
        self.isSkip = true
        self.scrollView.contentOffset.x = UIScreen.main.bounds.width * 3
        self.isSkip = false
    }

    @objc private func signUpWithKakao() {
        // TODO: 카카오 로그인
    }

    @objc private func goHome() {
        // TODO: 홈 화면보여주기
    }
}

extension OnboardingViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        debugPrint("@@ scrollView.contentOffset.x: \(scrollView.contentOffset.x)")
        let offsetX = scrollView.contentOffset.x
        let scrollViewWidth = scrollView.frame.width
        let currentPageForIndicator: Int = Int(round(offsetX / scrollViewWidth))
        let currentPage: Int = Int(offsetX / scrollViewWidth)

        // 1번 이미지가 페이지가 전환될때 실제로 이동되야 하는 거리
        let distance1: CGFloat = itemSpacing
        let ratio1 = distance1 / scrollViewWidth
        let weight1 = offsetX * ratio1

        // 2번 이미지가 페이지가 전환될때 실제로 이동되야 하는 거리
        let distance2: CGFloat = scrollViewWidth + leading1 - leading2
        // 2번 이미지가 한 페이지가 전환되는동안 실제로 움직인 값의 비율
        let ratio2 = distance2 / scrollViewWidth
        // 2번 이미지가 한 페이지 전활될때 기준으로 움직여야 하는 가중치
        let weight2 = offsetX * ratio2
        let weight3 = (offsetX - scrollViewWidth) * ratio2

        let distance4: CGFloat = scrollViewWidth + 36 - leading2
        let ratio4 = distance4 / scrollViewWidth
        let weight4 = (offsetX - (scrollViewWidth * 2)) * ratio4

        guard !isSkip else {

            let weight1 = (offsetX / 3) * ratio1

            // 2번 이미지가 페이지가 전환될때 실제로 이동되야 하는 거리
            let distance2: CGFloat = scrollViewWidth + leading1 - leading2
            // 2번 이미지가 한 페이지가 전환되는동안 실제로 움직인 값의 비율
            let ratio2 = distance2 / scrollViewWidth
            // 2번 이미지가 한 페이지 전활될때 기준으로 움직여야 하는 가중치
            let weight2 = (offsetX / 3) * ratio2
            let weight3 = ((offsetX / 3 * 2) - scrollViewWidth) * ratio2



            // 시작하기 누른경우
            onboardingImage01.snp.updateConstraints { make in
                make.leading.equalToSuperview().offset(leading1 + weight1)
            }
            onboardingImage02.snp.updateConstraints { make in
                make.leading.equalToSuperview().offset(leading2 + weight2)
            }
            onboardingImage03.snp.updateConstraints { make in
                make.leading.equalToSuperview().offset(scrollViewWidth + leading2 + weight3)
            }
            self.onboardingImage02.image = .init(named: "OnboardingCard02")

            let resultHeight: CGFloat = (UIScreen.main.bounds.height / 812) * 418
            let resultWidth: CGFloat = resultHeight / (418 / 310)
            let percent = (1 - (distance4 - weight4) / distance4)
            onboardingImage04.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(topPadding2 - ((topPadding2 - topPadding1) * percent))
                make.leading.equalToSuperview().offset((scrollViewWidth * 2) + leading2 + weight4)
                make.width.equalTo(cardWidth + ((resultWidth - cardWidth) * percent))
                make.height.equalTo(cardHeight + ((resultHeight - cardHeight) * percent))
            }
            self.onboardingImage03.image = .init(named: "OnboardingCard03")
            self.onboardingImage04.image = .init(named: "OnboardingCard04")

            startButton.isHidden = true
            signUpWithKakaoButton.isHidden = false
            skipButton.isHidden = false

            pageControl.currentPage = currentPageForIndicator
            if pages.count >= 2 && currentPage >= pages.count - 2 {
                pageControl.alpha = 1 - (offsetX / scrollViewWidth - 2)
            }
            return
        }



        if currentPage == 0 {
            onboardingImage01.snp.updateConstraints { make in
                make.leading.equalToSuperview().offset(leading1 + weight1)
            }
            onboardingImage02.snp.updateConstraints { make in
                make.leading.equalToSuperview().offset(leading2 + weight2)
            }

            startButton.isHidden = false
            signUpWithKakaoButton.isHidden = true
            skipButton.isHidden = true
        }
        if currentPage == 1 {
            onboardingImage03.snp.updateConstraints { make in
                make.leading.equalToSuperview().offset(scrollViewWidth + leading2 + weight3)
            }
            self.onboardingImage02.image = .init(named: "OnboardingCard02")

            startButton.isHidden = false
            signUpWithKakaoButton.isHidden = true
            skipButton.isHidden = true
        }
        if currentPage == 2 {
            // 작은 카드 너비: 225, 높이: 310
            // 커진 카드 너비: 302, 높이: 418

            let resultHeight: CGFloat = (UIScreen.main.bounds.height / 812) * 418
            let resultWidth: CGFloat = resultHeight / (418 / 310)
            let percent = (1 - (distance4 - weight4) / distance4)
            onboardingImage04.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(topPadding2 - ((topPadding2 - topPadding1) * percent))
                make.leading.equalToSuperview().offset((scrollViewWidth * 2) + leading2 + weight4)
                make.width.equalTo(cardWidth + ((resultWidth - cardWidth) * percent))
                make.height.equalTo(cardHeight + ((resultHeight - cardHeight) * percent))
            }
            self.onboardingImage03.image = .init(named: "OnboardingCard03")

            startButton.isHidden = false
            signUpWithKakaoButton.isHidden = true
            skipButton.isHidden = true
        }

        if currentPage == 3 {
            self.onboardingImage04.image = .init(named: "OnboardingCard04")
            startButton.isHidden = true
            signUpWithKakaoButton.isHidden = false
            skipButton.isHidden = false
        }

        // TODO: 삭제
        self.currentPagePage = currentPageForIndicator

        pageControl.currentPage = currentPageForIndicator
        if pages.count >= 2 && currentPage >= pages.count - 2 {
            pageControl.alpha = 1 - (offsetX / scrollViewWidth - 2)
        }
    }
}
