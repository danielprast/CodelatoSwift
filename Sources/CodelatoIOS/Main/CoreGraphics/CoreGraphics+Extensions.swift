//
//  CoreGraphics+Extensions.swift
//  Created by Daniel Prastiwa on 18/01/23.
//

import Foundation
import UIKit


public func calculateLandscapeRatio(from size: CGSize) -> CGFloat {
  return size.width / size.height
}


public func calculatePortraitRatio(from size: CGSize) -> CGFloat {
  return size.height / size.width
}
