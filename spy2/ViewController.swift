//
//  ViewController.swift
//
//  Created by Rohit Nair on 3/1/19.
//  Copyright © 2019 Rohit Nair. All rights reserved.
//


    
    import UIKit
    
    protocol CipherProtcol {
        func encrypt(plainText: String, secret : String) -> String
        func decrypt(encodedText: String, secret : String) -> String
}

 //*************************************************************//
    class ViewController: UIViewController {
        
        @IBOutlet weak var InputField: UITextField!
        
        @IBOutlet weak var SecretField: UITextField!
        
        @IBOutlet weak var output: UILabel!
        
        var cipher: CipherProtcol 
                            = AlphaNumericCipher()
        var ciphers :[String: CipherProtcol] = [
            "Ceasar": CesarCipher(),
            "Alphanumeric": AlphaNumericCipher(),
            "Atbash" : AtbashCipher(),
            "Rot13" : Rot13Cipher()
        ]
        var IntegerSecret: UInt32 {
            guard let secretString = SecretField.text else{
                return 0
            }
            if let SecretInt = UInt32(secretString){
                return SecretInt
            } else {
                return 0
            }
        }
        
        
        @IBAction func encryptButtonPressed(_ sender: UIButton) {
            guard
                 let plainText = InputField.text,
                let secretString = SecretField.text
                else {
                    output.text  = "no values"
                    return
               }
            output.text = cipher.encrypt(plainText: plainText, secret: secretString)
        }
        
        
        @IBAction func decyptButtonPressed(_ sender: UIButton) {
            guard
                let plainText = InputField.text,
                let secretString = SecretField.text
                else {
                    output.text  = "no values"
                    return
            }
            output.text = cipher.decrypt(encodedText: plainText, secret: secretString)
        }
        
        
        @IBAction func cipherSelected(_ sender: UIButton) {
            guard let buttonTitle = sender.titleLabel?.text else{
                return
            }
            guard let selectedCipher = ciphers[buttonTitle] else {
                return
                
             }
            cipher = selectedCipher
        }
    }
    




