//
//  UIColor+Extensions.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation
import UIKit


extension UIColor {
  
  public convenience init(hexString: String, alpha: CGFloat = 1.0) {
    var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    if hexFormatted.hasPrefix("#") {
      hexFormatted = String(hexFormatted.dropFirst())
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
    
    self.init(
      red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
      alpha: alpha
    )
  }
  
  public convenience init(hex: Int, alpha: CGFloat = 1.0) {
    self.init(
      red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
      blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
      alpha: alpha
    )
  }
  
  public func toImage() -> UIImage? {
    return toImageWithSize(size: CGSize(width: 1, height: 1))
  }
  
  public func toImageWithSize(size: CGSize) -> UIImage? {
    UIGraphicsBeginImageContext(size)
    
    if let ctx = UIGraphicsGetCurrentContext() {
      let rectangle = CGRect(x: 0, y: 0, width: size.width, height: size.height)
      ctx.setFillColor(self.cgColor)
      ctx.addRect(rectangle)
      ctx.drawPath(using: .fill)
      let colorImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return colorImage
    } else {
      return nil
    }
  }
  
  public static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}
