//
//  UILabel+Extensions.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation
import UIKit


extension UILabel {
  
  public func setLineSpacing(lineSpacing: CGFloat) {
    if let text = text {
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.lineSpacing = lineSpacing
      let attrString = NSMutableAttributedString(string: text)
      attrString.addAttribute(
        NSAttributedString.Key.paragraphStyle,
        value: paragraphStyle,
        range: NSMakeRange(0, attrString.length)
      )
      self.attributedText = attrString
    }
  }
  
}
