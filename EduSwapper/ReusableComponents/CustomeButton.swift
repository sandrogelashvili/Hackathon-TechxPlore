//
//  CustomeButton.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var backgroundColor: Color = .black
    var foregroundColor: Color = .white
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(foregroundColor)
                .frame(height: 50)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}
