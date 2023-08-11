//
//  UIButton+Extensions.swift
//  Created by Daniel Prastiwa on 07/01/23.
//

import Foundation
import UIKit


extension UIButton {
  
  public static func makeCircleImageButton(
    image: UIImage?,
    buttonSize: CGFloat = 44
  ) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle("", for: .normal)
    button.setImage(image, for: .normal)
    button.clipsToBounds = true
    button.contentMode = .scaleAspectFit
    button.layer.cornerRadius = buttonSize / 2
    return button
  }
  
}
