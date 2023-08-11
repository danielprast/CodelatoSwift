//
//  DIProtocol.swift
//  Created by Daniel Prastiwa on 05/01/23.
//

import Foundation

public typealias FactoryClosure = (DIC) -> AnyObject

public protocol DICProtocol {
  func register<Service>(type: Service.Type, factoryClosure: @escaping FactoryClosure)
  func resolve<Service>(type: Service.Type) -> Service?
}

public class DIC: DICProtocol {
  
  var services = Dictionary<String, FactoryClosure>()
  
  public static let shared: DICProtocol = DIC()
  
  private init(){ }
  
  public func register<Service>(type: Service.Type, factoryClosure: @escaping FactoryClosure) {
    services["\(type)"] = factoryClosure
  }
  
  public func resolve<Service>(type: Service.Type) -> Service? {
    return services["\(type)"]?(self) as? Service
  }
  
}
