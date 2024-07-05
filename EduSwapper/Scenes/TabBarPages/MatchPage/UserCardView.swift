//
//  UserCardView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct UserCardView: View {
    let person: UserModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(person.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 500)
                .clipped()
                .overlay {
                    LinearGradient(
                                    gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.6)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                                .frame(width: 300, height: 500)
                }
                        
            VStack(alignment: .leading) {
                Spacer()
                Text(person.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                HStack(spacing: 100) {
                    Text("Age: \(person.age)")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    
                    Text(person.skill)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 10)
            }
            .padding()
        }
        .frame(width: 300, height: 500)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .clipped()
    }
}

#Preview {
    UserCardView(person: UserModel(name: "Severus", age: 25, skill: "Transfiguration", imageName: "Snape"))
}
