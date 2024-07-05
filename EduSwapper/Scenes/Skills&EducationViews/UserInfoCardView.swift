//
//  UserInfoCardView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct UserInfoCardView: View {
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var age: String = ""
    @State private var selectedSkill: String = ""
    @State private var description: String = ""
    
    let skills = ["iOS Developement",
                  "Data Science",
                  "Cybersecurity",
                  "Cloud Computing",
                  "Machine Learning",
                  "Blockchain"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("User Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(spacing: 15) {
                    UserInputField(placeholder: "Name", text: $name)
                    UserInputField(placeholder: "Surname", text: $surname)
                    UserInputField(placeholder: "Age", text: $age, keyboardType: .numberPad)
                    
                    skillPicker
                    
                    textEditoForDescription
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 5))
                .padding()
                
                Spacer()
                
                NavigationLink {
                    TabBarContentView()
                } label: {
                    continueText
                }

            }
            .padding(.top, 50)
            .padding()
            .background(
                LinearGradient(
                    colors: [Color(#colorLiteral(red: 0.6002492309, green: 0.4447047114, blue: 0.7150582671, alpha: 1)), Color(#colorLiteral(red: 0.5631446242, green: 0.5931319594, blue: 0.9755433202, alpha: 1))],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private struct UserInputField: View {
        var placeholder: String
        @Binding var text: String
        var keyboardType: UIKeyboardType = .default
        
        var body: some View {
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 10)
        }
    }
    
    private var skillPicker: some View {
        Picker("Select a skill", selection: $selectedSkill) {
            ForEach(skills, id: \.self) { skill in
                Text(skill).tag(skill)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .padding(.horizontal, 10)
    }
    
    private var textEditoForDescription: some View {
        TextEditor(text: $description)
            .frame(height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal, 10)
    }
    
    private var continueText: some View {
        Text("Continue")
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.top, 20)
    }
}

#Preview {
    UserInfoCardView()
}
