//
//  UIImage+Extensions.swift
//  Created by Daniel Prastiwa on 18/01/23.
//

import Foundation
import UIKit


extension UIImage {
  
  public func scaleWithRatio(targetSize: CGSize) -> UIImage {
    let widthRatio = targetSize.width / size.width
    let heightRatio = targetSize.height / size.height
    let scaleFactor = min(widthRatio, heightRatio)
    let scaledImageSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
    let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
    let scaledImage = renderer.image(
      actions: { _ in
        self.draw(in: CGRect(origin: .zero, size: scaledImageSize))
      }
    )
    return scaledImage
  }
  
}
