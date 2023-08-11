//
//  UIView+Extensions.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation
import UIKit


extension UIView {
  
  public class func loadNibFromModule<T: UIView>(from bundle: Bundle) -> T {
    return bundle.loadNibNamed(
      String(describing: T.self),
      owner: nil,
      options: nil
    )![0] as! T
  }
  
  public static func makeCircleView(
    size: CGFloat,
    backgroundColor bgColor: UIColor = .yellow
  ) -> UIView {
    let view = UIView(frame: .init(x: 0, y: 0, width: size, height: size))
    view.backgroundColor = bgColor
    view.layer.cornerRadius = size / 2
    return view
  }
  
  // MARK: - ⌘
  
  public func addShadow(
    color: UIColor,
    size: CGSize,
    radius: CGFloat,
    opacity: Float = 1
  ) {
    self.layer.shadowColor = color.cgColor
    self.layer.shadowOffset = size
    self.layer.shadowRadius = radius
    self.layer.shadowOpacity = opacity
  }
  
  public func applyMenuCardShadow(color: UIColor = .black) {
    layer.shadowColor = color.cgColor
    layer.shadowRadius = 2
    layer.shadowOffset = .init(width: 0, height: 1.3)
    layer.shadowOpacity = 0.75
  }
  
  public func applyShadowSmooth() {
    layer.shadowColor = UIColor.lightGray.cgColor
    layer.shadowRadius = 15
    layer.shadowOffset = .init(width: 0, height: 1.5)
    layer.shadowOpacity = 0.3
    layer.masksToBounds = false
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }
  
  // MARK: - ⌘ View Composition
  
  public func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }
  
  public func clearSubviews(completion: @escaping () -> Void = {}) {
    if subviews.isEmpty { return }
    subviews.forEach { $0.removeFromSuperview() }
    completion()
  }
  
  public func findSubview<T: UIView>() -> T? {
    for view in subviews {
      if let childView = view as? T {
        return childView
      }
    }
    return nil
  }
  
}
