//
//  NetworkConnectionChecker.swift
//  Created by Daniel Prastiwa on 05/01/23.
//

import Foundation


public protocol NetworkConnectionChecker {
  var isConnected: Bool { get }
}


public struct NetworkConnectionChecker_V1: NetworkConnectionChecker {
  public init() {}
  public var isConnected: Bool {
    return ConnectionHelper.isInternetAvailable()
  }
}
