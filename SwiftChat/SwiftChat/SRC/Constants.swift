//
//  Constants.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 24/5/22.
//

import Foundation


struct K {
    static let appName = "🏎 SwiftChat"
    static let register = "Register"
    static let logIn = "Log In"
    static let logOut = "Log Out"
    static let nibName = "MessageCell"
    static let cellIndentifierXib = "ReusableCell"
    
    struct Placeholders {
        static let emailPlaceholderRegister = "Your Email"
        static let emailPlaceHolderLogIn = "Email"
        static let passwordPlaceholderRegister = "Create Password"
        static let passwordPlaceholderLogIn = "Password"
    }
    
    struct BrandColors {
        static let blue = "BrandBlue"
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let lightBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "message"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct Errors {
        static let signOutError = "Error signing out: %@"
        static let rigisterError = ""
        static let otherError = "Error"
        
    }
    
    struct Answers {
        static let yes = "Yes"
        static let no = "No"
    }
    
}
