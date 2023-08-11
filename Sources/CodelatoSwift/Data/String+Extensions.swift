//
//  String+Extensions.swift
//  Created by Daniel Prastiwa on 07/01/23.
//

import Foundation
import CryptoSwift


// MARK: - ⌘ Date Things

extension String {
  
  public func dateFormatting(format : String) -> String {
    let DateString : String = self
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss"
    df.locale = Locale(identifier: "id")
    let date = df.date(from: DateString)
    df.dateFormat = format
    return df.string(from: date!)
  }
  
  public func convertDateToString(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> String {
    let df = DateFormatter()
    guard let date = df.date(from: self) else {
      return ""
    }
    df.dateFormat = format
    return df.string(from: date)
  }
  
  public func convertToDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
    let df = DateFormatter()
    df.dateFormat = format
    return df.date(from: self) ?? Date()
  }
  
}


// MARK: - ⌘ Validation

extension String {
  
  public func isValidEmail() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: self)
  }
  
  public var isWhiteSpace: Bool {
    guard !isEmpty else { return true }
    let whiteSpaceChars = NSCharacterSet.whitespacesAndNewlines
    return self.unicodeScalars
      .filter { !whiteSpaceChars.contains($0) }
      .count == 0
  }
  
}


extension Optional where Wrapped == String {
  public var isNullOfWhiteSpace: Bool {
    return self?.isWhiteSpace ?? true
  }
}


// MARK: - ⌘ Encoding Decoding

extension String {
  
  public var decodedEmoji: String? {
    let data = self.data(using: String.Encoding.utf8,allowLossyConversion: false);
    let decodedStr = NSString(
      data: data!,
      encoding: String.Encoding.nonLossyASCII.rawValue
    )
    if decodedStr != nil{
      return decodedStr as String?
    }
    return self
  }
  
  public func replacingWhiteSpace() -> String {
    let str = self
    let newStr : String = str.replacingOccurrences(of: " ", with: "%20")
    return newStr
  }
  
  public func trimWhiteSpaces() -> String {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
  }
  
  public func removeHtmlTag() -> String {
    return self.replacingOccurrences(
      of: "<[^>]+>",
      with: "" ,
      options: .regularExpression,
      range: nil
    )
  }
  
  public func toUTF8EncodedData() -> Data? {
    return self.data(using: .utf8)
  }
  
  public func decodeUTF8nonLossyASCII() -> String? {
    let data = self.data(using: .utf8)!
    return String(data: data, encoding: .nonLossyASCII)
  }
  
}


// MARK: - ⌘ Encryption

extension String {
  
  public func aesEncrypt() -> String {
    let str = self
    let pass : [UInt8] = [UInt8]("AM1PR!@".data(using: .utf8)!)
    let key: [UInt8] = Digest.sha256(pass)
    let iv : [UInt8] = [0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00]
    let encrypted = try! AES(
      key: key,
      blockMode: CBC(iv: iv),
      padding: .pkcs7
    ).encrypt(
      [UInt8](str.data(using: .utf8)!)
    )
    let encryptedData = Data(encrypted)
    return encryptedData.base64EncodedString()
  }
  
}


// MARK: - ⌘ Currency

extension String {
  
  public func formatRupiah(withComma: Bool = true) -> String {
    if let value = Double(self) {
      let formatter = NumberFormatter()
      formatter.locale = Locale(identifier: "id_ID")
      formatter.groupingSeparator = "."
      formatter.numberStyle = .decimal
      formatter.maximumFractionDigits = 2
      if let str = formatter.string(for: value) {
        let suffix = withComma ? ",00" : ""
        return "Rp. \(str)\(suffix)"
      }
    }
    return ""
  }
  
}
