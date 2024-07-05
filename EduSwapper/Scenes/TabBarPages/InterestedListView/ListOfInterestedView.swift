//
//  ListOfInterestedView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct ListOfInterestedView: View {
    let matches = [
        Match(name: "Dolores Umbridge",
              canTeach: "Defence Against the Dark Arts",
              wantsToLearn: "iOS Development",
              imageName: "PinkLady")
    ]
    
    var body: some View {
            
            VStack(alignment: .leading) {
                Text("You have 1 Match")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                List(matches) { match in
                    VStack {
                        HStack {
                            Image(match.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 5)
                            
                            VStack(alignment: .leading) {
                                Text(match.name)
                                    .font(.headline)
                                
                                Text("Can teach: \(match.canTeach)")
                                    .font(.subheadline)
                                
                                Text("Wants to learn: \(match.wantsToLearn)")
                                    .font(.subheadline)
                            }
                            .padding(.leading, 10)
                        }
                        .padding(.vertical, 10)
                        
                        HStack {
                            Button(action: {
                                print("Dolores was removed")
                            }, label: {
                                
                                Text("Decline")
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 20)
                                    .background(.red)
                            })
                            
                            Button(action: {
                                print("God be with you")
                            }, label: {
                                Text("Chat")
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 30)
                                    .background(.green)
                            })
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .background(Color.clear)
            }
    }
}

#Preview {
    ListOfInterestedView()
}
