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
                .frame(width: 350, height: 550)
                .clipped()
                .overlay {
                    LinearGradient(
                                    gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.9)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                                .frame(width: 350, height: 550)
                }
            HStack {
                VStack(alignment: .leading) {
                    HStack (alignment: .center){
                        Text("\(person.name),")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("\(person.age)")
                            .font(.system(size: 24, weight: .light))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom)
                    
                    Text(person.skill)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    HStack {
                        Spacer()
                        
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 45))
                            .background(.white)
                            .clipShape(Circle())
                            .padding(.trailing)
                        
                        Image(systemName: "book.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 45))
                            .background(.white)
                            .clipShape(Circle())
        
                        Spacer()
                    }
                    .padding(5)
                }
                .padding()
                
                Spacer()
            }
        }
        .frame(width: 350, height: 550)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .clipped()
    }
}

#Preview {
    UserCardView(person: UserModel(name: "Severus", age: 25, skill: "Transfiguration", imageName: "Snape"))
}
