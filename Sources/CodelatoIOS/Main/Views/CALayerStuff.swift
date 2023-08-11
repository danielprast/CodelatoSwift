//
//  CALayers.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation
import UIKit


public struct CALayerStuff {
  
  public static func setupSimpleGradientColor(
    colors: [CGColor],
    width: CGFloat,
    height: CGFloat
  ) -> CAGradientLayer {
    let gradient = CAGradientLayer()
    gradient.colors = colors
    gradient.locations = [0.0, 1.0]
    gradient.startPoint = CGPoint(x: 0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1, y: 0.5)
    gradient.frame = CGRect(
      x: 0,
      y: 0,
      width: width,
      height: height
    )
    return gradient
  }
  
}
