//
//  ContentView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 04.07.24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                appLogo
                
                VStack {
                    appName
                    slogan
                }
                
                CustomTextField(placeholder: "Username",
                                text: $username)
                
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
                
                HStack {
                    Spacer()
                    forgotPasswordButton
                }
                .padding(.horizontal, 20)
                
                NavigationLink {
                    TabBarContentView()
                } label: {
                    loginText
                }
                
                Spacer()
                
                HStack {
                    signUpText
                    NavigationLink {
                        
                        SignUpView()
                        
                    } label: {
                        Text("Sign up")
                            .foregroundStyle(
                                Color(#colorLiteral(
                                    red: 0,
                                    green: 0.3017924726,
                                    blue: 0.838564992,
                                    alpha: 1
                                )))
                    }
                }
                .padding(.bottom, 25)
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
    
    private var appName: some View {
        Text("SkillSwap")
            .font(.title)
            .fontWeight(.medium)
    }
    
    private var slogan: some View {
        Text("Swap Skills, Build Futures")
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
    
    private var forgotPasswordButton: some View {
        Button(action: {
            print("Forgot pressed")
        },
               label: {
            Text("Forgot Password?")
                .foregroundStyle(
                    Color(#colorLiteral(
                        red: 0,
                        green: 0.3017924726,
                        blue: 0.838564992,
                        alpha: 1
                    )))
        })
    }
    
    private var loginText: some View {
            Text("Login")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    
    private var signUpText: some View {
        Text("Don't have an account?")
    }
}

#Preview {
    LoginView()
}
