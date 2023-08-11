public struct CodelatoSwift {
  public private(set) var text = "Hello, World!"
  
  public init() {
  }
}


public func shout(_ key: String, value: Any) {
  guard DevelopmentMode.shared.isActive else { return }
  print("◉ \(key) ⇢ \(value)")
}
