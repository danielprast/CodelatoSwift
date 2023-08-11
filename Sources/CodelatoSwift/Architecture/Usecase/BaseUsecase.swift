//
//  BaseUsecase.swift
//  Created by Daniel Prastiwa on 05/01/23.
//

import Foundation


public protocol Usecase {
  associatedtype ResultType
  associatedtype Param
  associatedtype ErrorResult: Error
  
  func execute(
    param: Param,
    completion: @escaping(Result<ResultType, ErrorResult>) -> Void
  )
}

extension Usecase {
  func execute(
    param: Param,
    completion: @escaping(Result<ResultType, ErrorResult>) -> Void
  ) {}
}


public protocol UsecaseParam {}


public struct NoParam {
  public init() {}
}


public struct NoResult {
  public init() {}
}


public protocol CancelableUsecase: Usecase {
  func cancel()
}

extension CancelableUsecase {
  func cancel() {}
}
