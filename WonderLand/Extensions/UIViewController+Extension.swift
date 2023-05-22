//
//  UIViewController+Extension.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/05/06.
//

import UIKit

import SnapKit

extension UIViewController {

    func configureConstraintToSuperView(for view: UIView) {
        self.view.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configureConstraintToSafeArea(for view: UIView) {
        self.view.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
