//
//  String+Extension.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/04/25.
//

import Foundation

extension String {

    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
