//
//  LazyFactory.swift
//  Created by Daniel Prastiwa on 06/01/23.
//

import Foundation


public final class LazyFactory<T> {
  
  private var factory: () -> T
  private var cache: T? = nil
  
  public var dependency: T {
    get {
      if let cache {
        return cache
      }
      let dependency = factory()
      self.cache = dependency
      return dependency
    }
  }
  
  public init(_ factory: @escaping () -> T) {
    self.factory = factory
  }
  
}
