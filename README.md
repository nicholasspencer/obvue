# obvue

CLI for generating obfuscated keys based on http://www.splinter.com.au/2019/05/05/obfuscating-keys/

## Installation

Add obvue to your package description

```swift
let package = Package(
    name: "AppDependencies",
    products: [
        .library(name: "Dependencies", targets: ["Dependencies"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nicholasspencer/obvue.git", from: "0.0.0"),
    ],
    targets: [
        .target(name: "Dependencies", dependencies: ["ObvueCore"]),
    ]
)
```

## Usage

#### Generate obfuscated data

```bash
> swift run obvue "xyz"
[77, 45, 171, 53, 84, 209]
```

#### Deobfuscate

```swift
import Foundation
import ObvueCore

class Application: NSApplication {
    let secret: [UInt8] = [77, 45, 171, 53, 84, 209]

    lazy var authenticator: Authenticator? = {
        guard let secret: String = Obfuscator.deobfuscate(obfuscated: secret) else {
                return nil
        }
        return Authenticator(secret: secret)
    }()
}
```
