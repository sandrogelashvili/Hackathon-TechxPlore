//
//  MatchView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct MatchView: View {
    @State private var persons: [UserModel] = [
        UserModel(name: "Dumbledore", age: 116, skill: "Transfiguration", imageName: "Dumbldore"),
        UserModel(name: "Voldemort", age: 71, skill: "Dark arts", imageName: "Voldemort"),
        UserModel(name: "Severus Snape", age: 38, skill: "Potions Master", imageName: "Snape"),
        UserModel(name: "Dolores Umbridge", age: 60, skill: "Defence Against the Dark Arts", imageName: "PinkLady")
    ]
    
    @State private var topCardIndex = 0
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.6002492309, green: 0.4447047114, blue: 0.7150582671, alpha: 1)),Color(#colorLiteral(red: 0.5631446242, green: 0.5931319594, blue: 0.9755433202, alpha: 1))],
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            ZStack {
                ForEach(persons.indices.reversed(), id: \.self) { index in
                    UserCardView(person: persons[index])
                        .offset(x: index == topCardIndex ? offset.width : 0, y: 0)
                        .rotationEffect(.degrees(index == topCardIndex ? Double(offset.width / 10) : 0))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if index == topCardIndex {
                                        self.offset = gesture.translation
                                    }
                                }
                                .onEnded { _ in
                                    if abs(self.offset.width) > 100 {
                                        if self.offset.width > 0 {
                                            print("Swiped right")
                                        } else {
                                            print("Swiped left")
                                        }
                                        withAnimation {
                                            self.topCardIndex = (self.topCardIndex + 1) % self.persons.count
                                            self.offset = .zero
                                        }
                                    } else {
                                        withAnimation {
                                            self.offset = .zero
                                        }
                                    }
                                }
                        )
                        .animation(.spring(), value: offset)
                        .zIndex(index == topCardIndex ? 1 : 0) // Ensure the top card is always on top
                }
            }
        }
    }
}


#Preview {
    MatchView()
}
