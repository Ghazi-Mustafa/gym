//
//  L10n.swift
//  gymx
//
//  Created by Mustafa Ghazi on 05/01/26.
//

import SwiftUI


enum L10n {

    enum Onboarding {
        static let slide1Title = "slide1_title"
        static let slide1Desc  = "slide1_desc"
        
        static let slide2Title = "slide2_title"
        static let slide2Desc  = "slide2_desc"
        
        static let slide3Title = "slide3_title"
        static let slide3Desc  = "slide3_desc"
        
        static let slide4Title = "slide4_title"
        static let slide4Desc  = "slide4_desc"
        
        static let getStarted = "get_started"
    }

    enum Auth {
        static let register = "register"
        static let or = "or"
        static let login = "login"
        static let firstName = "first_name"
        static let lastName = "last_name"
        static let password = "password"
        static let email = "email"
        static let createAccount = "create_account"
        static let heyThere = "hey_there"
        static let byContinuingAccept = "by_continuing_accept"
        static let alreadyHaveAccount = "already_have_account"
        static let welcomeBack = "welcome_back"
        static let forgotYourPassword = "forgot_your_password"
        static let dontHaveAccountYet = "dont_have_account_yet"
    }

    enum Validation {
        static let passwordRequired = "password_required"

        static let passwordLowercaseCondition = "set_password_1_condition"
        static let passwordUppercaseCondition = "set_password_2_condition"
        static let passwordNumberCondition = "set_password_3_condition"
        static let passwordSpecialCharCondition = "set_password_4_condition"
        static let passwordLengthCondition = "set_password_5_condition"

        static let passwordLowercaseError = "set_password_1_condition_error"
        static let passwordUppercaseError = "set_password_2_condition_error"
        static let passwordNumberError = "set_password_3_condition_error"
        static let passwordSpecialCharError = "set_password_4_condition_error"
        static let passwordLengthError = "set_password_5_condition_error"

        static let confirmPassword = "confirm_password"
        static let confirmPasswordInvalid = "confirm_password_invalid"

        static let phoneRequired = "phone_required"
        static let phoneInvalid = "phone_invalid"

        static let nameRequired = "name_required"

        static let pinRequired = "pin_required"
        static let pinInvalid = "pin_invalid"

        static let profileImage = "profile_image"

        static let arabicName = "arabic_name"
        static let englishName = "english_name"

        static let emailRequired = "email_required"
        static let emailInvalid = "email_invalid"

        static let usernameRequired = "username_required"
        
        static let emailNotFound = "emain_not_found"
        static let userDisabled = "user_disabled"
        static let worongEmailOrPassword = "worong_email_or_password"
        static let userNotFound = "user_not_found"
        static let defultError = "generic_login_error"
        
        static let noGoogleToken = "no_google_token"
        static let userDoesntExist = "user_doesnt_exist"
        static let firstNameRequired = "first_name_required"
        static let lastNameRequired = "last_name_required"
    }
}
