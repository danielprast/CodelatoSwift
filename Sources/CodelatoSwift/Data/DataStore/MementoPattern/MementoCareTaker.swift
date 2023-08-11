//
//  MementoCareTaker.swift
//  Created by Daniel Prastiwa on 02/01/23.
//

import Foundation


public protocol MementoCareTaker {
  func save<T: Codable>(_ object: T, to key: String) throws
  func load<T: Codable>(_ object: T.Type, from key: String) throws -> T
  func retrive<T: Codable>(for key: String) throws -> T
}


public protocol MementoEntityCareTaker {
  
  associatedtype Originator: MementoOriginator
  
  func save(_ entity: Originator, for key: String) throws
  func load(for key: String) throws -> Originator
  
}


public protocol MementoOriginator: Codable {
  associatedtype OriginatorState: DataEntity & Codable
  var state: OriginatorState { set get }
  func update(state: OriginatorState)
}
