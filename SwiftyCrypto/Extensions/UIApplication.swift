//
//  UIApplication.swift
//  SwiftyCrypto
//
//  Created by Vadym Boiko on 02.01.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

