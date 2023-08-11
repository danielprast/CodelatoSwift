//
//  NErrorMessageFactory.swift
//  Created by Daniel Prastiwa on 02/01/23.
//

import Foundation


public protocol NErrorMessageFactory {
  func getErrorDescription(of error: NError) -> String
}

// MARK: - Implementations

public struct NErrorMessageFactory_V1: NErrorMessageFactory {
  
  public func getErrorDescription(of error: NError) -> String {
    switch error {
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
