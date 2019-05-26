//
//  Rot13Cipher.swift

//
//  Created by Rohit Nair on 4/17/19.
//  Copyright © 2019 Rohit Nair. All rights reserved.
//

import Foundation
//Every letter is shifted 13 places to encrypt or to decrypt the message.
//so ABCDEFGHIJKLM MAPS To NOPQRSTUVWXYZ  AND abcdefghijklm maps to nopqrstuvwxyz
//no secret integer is needed
struct Rot13Cipher: CipherProtcol{
    func encrypt(plainText: String, secret: String) -> String {
        var encoded = ""
        
        if plainText.range(of:
            "[^a-zA-Z]", options: .regularExpression) != nil && plainText != " " {
            encoded = "Input must be alphabets only"
            return encoded
        }
        
        for character in plainText{
            let unicode = character.unicodeScalars.first!.value
            var shiftedcode = unicode
            if (shiftedcode >= 65 && shiftedcode <= 91)
            {
                shiftedcode = (Unicode.Scalar(13)!.value + unicode - Unicode.Scalar(65)!.value) % Unicode.Scalar(26)!.value + Unicode.Scalar(65)!.value
            } else if (shiftedcode >= 97 && shiftedcode <= 123){
                shiftedcode = (Unicode.Scalar(13)!.value + unicode - Unicode.Scalar(97)!.value) % Unicode.Scalar(26)!.value + Unicode.Scalar(97)!.value
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedcode)))
            encoded += shiftedCharacter
        }
        return encoded
    }
    
    
    func decrypt(encodedText: String, secret: String) -> String {
        var decoded = ""
        if encodedText.range(of:
            "[^a-zA-Z]", options: .regularExpression) != nil && encodedText != " " {
            decoded = "Input must be alphabets only"
            return decoded
        }
        
        for character in encodedText{
            let unicode = character.unicodeScalars.first!.value
            var shiftedcode = unicode
            if (shiftedcode >= 65 && shiftedcode <= 91)
            {
                shiftedcode = (Unicode.Scalar(13)!.value + unicode - Unicode.Scalar(65)!.value) % Unicode.Scalar(26)!.value + Unicode.Scalar(65)!.value
                
            } else if (shiftedcode >= 97 && shiftedcode <= 123){
                shiftedcode = (Unicode.Scalar(13)!.value + unicode - Unicode.Scalar(97)!.value) % Unicode.Scalar(26)!.value + Unicode.Scalar(97)!.value
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedcode)))
            decoded += shiftedCharacter
        }
        return decoded
    }
}
