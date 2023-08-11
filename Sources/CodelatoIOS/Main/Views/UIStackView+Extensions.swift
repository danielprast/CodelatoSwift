//
//  UIStackView+Extensions.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation
import UIKit


extension UIStackView {
  
  public convenience init(
    subviews: [UIView] = [],
    axis: NSLayoutConstraint.Axis = .vertical,
    spacing: CGFloat = 2,
    alignment: UIStackView.Alignment = .fill,
    distribution: UIStackView.Distribution = .fill
  ) {
    self.init()
    
    self.axis = axis
    self.spacing = spacing
    self.alignment = alignment
    self.distribution = distribution
    self.translatesAutoresizingMaskIntoConstraints = false
    
    if subviews.isEmpty { return }
    subviews.forEach { subview in
      self.addArrangedSubview(subview)
    }
  }
  
  public var calculatedHeight: CGFloat {
    if axis == .horizontal {
      return bounds.height
    }
    return arrangedSubviews
      .map { $0.bounds.size.height }
      .reduce(0,+)
  }
  
  public class func makeVStack() -> UIStackView {
    return UIStackView(
      subviews: [],
      axis: .vertical,
      spacing: 0,
      alignment: .fill,
      distribution: .fill
    )
  }
  
  public class func makeHStack(subviews: [UIView] = []) -> UIStackView {
    return UIStackView(
      subviews: subviews,
      axis: .horizontal,
      spacing: 0,
      alignment: .fill,
      distribution: .fill
    )
  }
  
}
