// CLI for generating obfuscated keys
// http://www.splinter.com.au/2019/05/05/obfuscating-keys/

import Commander
import ObvueCore

command { (key: String) in 
    print(Obfuscator(key).obfuscated)
}.run()
