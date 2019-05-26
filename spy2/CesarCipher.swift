//
//  CesarCipher.swift

//
//  Created by Rohit Nair on 3/25/19.
//  Copyright © 2019 Rohit Nair. All rights reserved.
//

import Foundation
//a plain text is encrypted by incrementing its value by the input in secret number. It is decrypted by decrementing it by the
//secret number .
//*************************************************************************//

struct CesarCipher : CipherProtcol {
    func encrypt(plainText: String, secret : String) -> String {
        guard let secretInt = UInt32(secret) else {
            return "Enter a Secret Number"
        }
        var encoded = ""
        for character in plainText{
            guard let firstUnicodeScalar = character.unicodeScalars.first else{continue
                
            }
            let unicode = firstUnicodeScalar.value
            let shiftedcode = unicode + secretInt
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedcode)))
            encoded += shiftedCharacter
        }
        return encoded
        
    }
    func decrypt(encodedText: String, secret : String) -> String{
        guard let secretInt = UInt32(secret) else {
            return "Enter a secret number"
        }
        var decoded = ""
        for character in encodedText{
            guard let firstUnicodeScalar = character.unicodeScalars.first else{continue
                
            }
            let unicode = firstUnicodeScalar.value
            let shiftedcode = unicode - secretInt
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedcode)))
            decoded += shiftedCharacter
        }
        return decoded
        
    }
}

//***************************************************************//
