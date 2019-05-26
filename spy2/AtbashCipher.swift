//
//  AtbashCipher.swift

//
//  Created by Rohit Nair on 4/9/19.
//  Copyright © 2019 Rohit Nair. All rights reserved.
//

import Foundation
//atbash takes only alphabet input and maps a t0 z ..., b to y AND A to Z and B to Y ...and vice versa
//no secret ineteger is needed
struct AtbashCipher: CipherProtcol{
    
    
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
                shiftedcode = Unicode.Scalar(155)!.value - unicode
            } else if (shiftedcode >= 97 && shiftedcode <= 123){
                shiftedcode = Unicode.Scalar(219)!.value - unicode
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
                shiftedcode = Unicode.Scalar(155)!.value - unicode
            } else if (shiftedcode >= 97 && shiftedcode <= 123){
                shiftedcode = Unicode.Scalar(219)!.value - unicode
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedcode)))
            decoded += shiftedCharacter
        }
        return decoded
    }
}

//***************************************************************
