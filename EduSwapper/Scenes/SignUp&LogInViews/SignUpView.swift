//
//  SignUpView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                appLogo
                
                textForTitle
                
                CustomTextField(placeholder: "Username",
                                text: $username)
                
                CustomTextField(placeholder: "Email",
                                text: $email)
                
                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        CustomTextField(placeholder: "Password",
                                        text: $password)
                    } else {
                        CustomTextField(placeholder: "Password",
                                        text: $password,
                                        isSecure: true)
                    }
                    eyeButton
                        .padding(.trailing, 15)
                }
                
                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        CustomTextField(placeholder: "Confirm Password",
                                        text: $password)
                    } else {
                        CustomTextField(placeholder: "Confirm Password",
                                        text: $password,
                                        isSecure: true)
                    }
                    eyeButton
                        .padding(.trailing, 15)
                }
                NavigationLink {
                    ChooseSkillsView()
                } label: {
                    signUpText
                }
                
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                    
                    loginButton
                }
            }
            .padding()
            .background(
                LinearGradient(
                    colors: [Color(#colorLiteral(red: 0.6002492309, green: 0.4447047114, blue: 0.7150582671, alpha: 1)),Color(#colorLiteral(red: 0.5631446242, green: 0.5931319594, blue: 0.9755433202, alpha: 1))],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    private var appLogo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
    
    private var textForTitle: some View {
        VStack {
            Text("UpSwap")
                .font(.title)
                .fontWeight(.medium)
            
            Text("Create an Account")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
    
    private var eyeButton: some View {
        Button(action: {
            isPasswordVisible.toggle()
        }) {
            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                .foregroundColor(.black)
                .padding(.trailing, 15)
        }
    }
    
    private var signUpText: some View {
        Text("Sign Up")
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.top, 20)
    }
    
    private var loginButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Log In")
                .foregroundStyle(
                    Color(#colorLiteral(
                        red: 0,
                        green: 0.3017924726,
                        blue: 0.838564992,
                        alpha: 1)))
        }
    }
}

#Preview {
    SignUpView()
}
