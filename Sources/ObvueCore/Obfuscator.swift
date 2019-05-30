import Foundation

public struct Obfuscator {
    let unobfuscated: [UInt8]

    var random: [UInt8] {
        return (0..<unobfuscated.count).map { _ in UInt8(arc4random_uniform(256)) }
    }
    
    public var obfuscated: [UInt8] {
        let random = self.random
        return zip(unobfuscated, random).map(^) + random
    }

    public static func deobfuscate(obfuscated: [UInt8]) -> [UInt8] {
        return obfuscated.unobfuscated
    }

    public static func deobfuscate(obfuscated: [UInt8]) -> String? {
        return String(bytes: obfuscated.unobfuscated, encoding: .utf8)
    }

    public init(_ unobfuscated: [UInt8]) {
        self.unobfuscated = unobfuscated
    }

    public init(_ unobfuscated: String) {
        self.init(unobfuscated.utf8.map { UInt8($0) })
    }
}

fileprivate extension Array where Element == UInt8 {
    var unobfuscated: [UInt8] {
        return zip(prefix(count / 2), suffix(count / 2)).map(^)
    }
}
