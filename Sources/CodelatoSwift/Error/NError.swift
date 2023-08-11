//
//  NetworkError.swift
//  Created by Daniel Prastiwa on 18/03/22.
//

import Foundation


public enum NError: LocalizedError {
  case custom(String)
  case responseError(String)
  case unauthorized           //Status code 401
  case forbidden              //Status code 403
  case notFound               //Status code 404
  case internalServerError    //Status code 500
  case connectionProblem
  case unknownError
  case badRequest
  case parsingError
  case emptyResult
  case invalidUrl(String)
}

// MARK: - ⌘ Message Description

extension NError {
  
  public var description: String {
    switch self {
    case let .custom(msg):
      return msg
    case .unauthorized:
      //return "Ups! Your session has been expired. You'll be logged out."
      return "Maaf sesi anda telah habis. Silakan login kembali."
    case let .responseError(message):
      return message
    case .notFound:
      //return "Sorry Source Not Found"
      return "Maaf, konten tidak ditemukan."
    case .internalServerError:
      //return "Internal Server Error, Please try again later."
      return "Terjadi kesalahan. Silakan coba kembali."
    case .unknownError, .parsingError, .forbidden, .badRequest:
      //return "Something went wrong"
      return "Terjadi kesalahan. Silakan coba kembali."
    case .connectionProblem:
      //return "Please check your network connection"
      return "Anda sedang offline. Silakan periksa pengaturan jaringan anda."
    case .emptyResult:
      return "Data tidak ditemukan"
    case .invalidUrl(let url):
      //return "Invalid URL format: \(url)"
      return "Format URL tidak valid: \(url)"
    }
  }
}

// MARK: - ⌘ Message Description

extension NError: Equatable {
  
  public static func ==(lhs: NError, rhs: NError) -> Bool {
    switch (lhs, rhs){
    case (unauthorized, unauthorized):
      return true
    case (internalServerError, internalServerError):
      return true
    case (badRequest, badRequest):
      return true
    case (forbidden, forbidden):
      return true
    case (notFound, notFound):
      return true
    case (connectionProblem, connectionProblem):
      return true
    case (unknownError, unknownError):
      return true
    case (emptyResult, emptyResult):
      return true
    case (parsingError, parsingError):
      return true
    case (responseError, responseError):
      return true
    case (invalidUrl, invalidUrl):
      return true
    default:
      return false
    }
  }
}
