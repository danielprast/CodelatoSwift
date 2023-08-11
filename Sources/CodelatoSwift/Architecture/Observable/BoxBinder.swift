//
//  BoxBinder.swift
//  Created by Daniel Prastiwa on 21/02/22.
//

import Foundation

public final class BoxBinder<T> {
  
  public typealias Listener = (T) -> Void
  private var listener: Listener?
  
  public var value: T {
    didSet {
      listener?(value)
    }
  }
  
  public init(_ value: T) {
    self.value = value
  }
  
  public func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
  
}
