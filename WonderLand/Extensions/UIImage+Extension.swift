//
//  UIImage+Extension.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/05/06.
//

import UIKit

extension UIImage {

    func applyBlur(radius: CGFloat) -> UIImage {
        let context = CIContext()
        guard let ciImage = CIImage(image: self),
              let clampFilter = CIFilter(name: "CIAffineClamp"),
              let blurFilter = CIFilter(name: "CIGaussianBlur") else {
            return self
        }

        clampFilter.setValue(ciImage, forKey: kCIInputImageKey)

        blurFilter.setValue(clampFilter.outputImage, forKey: kCIInputImageKey)
        blurFilter.setValue(radius, forKey: kCIInputRadiusKey)
        guard let output = blurFilter.outputImage,
              let cgImage = context.createCGImage(output, from: ciImage.extent) else {
            return self
        }
        return UIImage(cgImage: cgImage)
    }
}
