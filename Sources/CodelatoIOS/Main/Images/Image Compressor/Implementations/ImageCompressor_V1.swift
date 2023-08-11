//
//  ImageCompressor_V1.swift
//  Created by Daniel Prastiwa on 12/12/22.
//

import Foundation
import UIKit
import Combine
import CodelatoSwift


public struct ImageCompressor_V1: ImageCompressor {
  
  public init() {}
  
  public func compressImage(
    from data: Data,
    targetSize size: CGSize = .init(width: 200, height: 200)
  ) -> AnyPublisher<Data, NError> {
    return Just(data)
      .setFailureType(to: NError.self)
      .eraseToAnyPublisher()
      .flatMap { data -> AnyPublisher<Data, NError> in
        let image = UIImage(data: data)!
        return Future<Data, NError> { promise in
          let compressedImage = image.scaleWithRatio(targetSize: size)
          guard let dataResult = compressedImage.pngData() else {
            promise(.failure(NError.custom("Failed to compress image")))
            return
          }
          promise(.success(dataResult))
        }
        .eraseToAnyPublisher()
      }
      .eraseToAnyPublisher()
  }
  
}
