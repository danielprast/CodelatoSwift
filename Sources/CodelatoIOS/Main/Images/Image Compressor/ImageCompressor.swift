//
//  ImageCompressor.swift
//  Created by Daniel Prastiwa on 12/12/22.
//

import Foundation
import UIKit
import Combine
import CodelatoSwift


public protocol ImageCompressor {
  func compressImage(
    from data: Data,
    targetSize size: CGSize
  ) -> AnyPublisher<Data, NError>
}
