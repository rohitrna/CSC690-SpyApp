//
//  AlphaNumericCipher.swift

//
//  Created by Rohit Nair on 4/9/19.
//  Copyright © 2019 Rohit Nair. All rights reserved.
//
// Alphanumeric cipher takes in only alphanumeric inputs. It uses a secret number to encrypt or decrypt the input. Outputs are A-Z AND 0-9.
import Foundation
struct AlphaNumericCipher: CipherProtcol{
    func encrypt(plainText: String, secret: String) -> String {
        guard let secretInt = UInt32(secret) else {
            return "Enter a secret number"
        }
        var encoded = ""
        
        if plainText.range(of:
            "[^a-zA-Z0-9]", options: .regularExpression) != nil && plainText != " " {
            encoded = "Input must be alpha numeric"
            return encoded
        }
        for character in plainText.uppercased(){
            guard let firstUnicodeScalar = character.unicodeScalars.first else{continue
            }
            let unicode = firstUnicodeScalar.value
            var shiftedcode = unicode
            for _ in 0 ..< secretInt{
                if shiftedcode == Unicode.Scalar("Z").value{
                    shiftedcode = Unicode.Scalar("0").value
                } else if shiftedcode == Unicode.Scalar("9").value{
                    shiftedcode = Unicode.Scalar("A").value
                    
                } else {
                    shiftedcode = shiftedcode + 1
                }
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedcode)))
            encoded += shiftedCharacter
        }
        return encoded
    }
    
    
    func decrypt(encodedText: String, secret : String) -> String{
        guard let secretInt = UInt32(secret) else {
            return "Enter a Secret number"
        }
        
        var decoded = ""
        
        if encodedText.range(of:
            "[^a-zA-Z0-9]", options: .regularExpression) != nil && encodedText != " " {
            decoded = "Input must be alpha numeric"
            return decoded
        }
        for character in encodedText.uppercased(){
            guard let firstUnicodeScalar = character.unicodeScalars.first else{continue
            }
            let unicode = firstUnicodeScalar.value
            var shiftedcode = unicode
            for _ in 0 ..< secretInt{
                if shiftedcode == Unicode.Scalar("0").value{
                    shiftedcode = Unicode.Scalar("Z").value
                } else if shiftedcode == Unicode.Scalar("A").value{
                    shiftedcode = Unicode.Scalar("9").value
                } else {
                    shiftedcode = shiftedcode - 1
                }
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedcode)))
            decoded += shiftedCharacter
        }
        return decoded
    }
}
//************************************************************//
