//
//  View+Extension.swift
//  gymx
//
//  Created by Mustafa Ghazi on 24/11/25.
//


import SwiftUI


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

