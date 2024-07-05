//
//  CustomTextField.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .padding()
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(minWidth: 0, maxWidth: .infinity)
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}
