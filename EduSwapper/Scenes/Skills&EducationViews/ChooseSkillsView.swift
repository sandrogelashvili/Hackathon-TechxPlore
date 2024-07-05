//
//  ChooseSkillsView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct ChooseSkillsView: View {
    @State private var pressedButtons: Set<UUID> = []
    @State private var showAlert = false
    
    let skills = [
        Skill(name: "Software Engenier"),
        Skill(name: "Data Science"),
        Skill(name: "Cybersecurity"),
        Skill(name: "Cloud Computing"),
        Skill(name: "Machine Learning"),
        Skill(name: "Blockchain")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                titleText
                
                Spacer()
                
                skillsGrid
                
                Spacer()
                
                NavigationLink(destination: {
                    UserInfoCardView()
                }, label: {
                    continueText
                })
                
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 30)
            .padding(.top, 30)
            .navigationBarBackButtonHidden()
            .onAppear {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Registration Successful"), message: Text("You have been registered successfully"), dismissButton: .default(Text("OK")))
            }
        }
        .background(
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.6002492309, green: 0.4447047114, blue: 0.7150582671, alpha: 1)),Color(#colorLiteral(red: 0.5631446242, green: 0.5931319594, blue: 0.9755433202, alpha: 1))],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    private var titleText: some View {
        Text("Choose skills you want to learn")
            .font(.title)
    }
    
    private var skillsGrid: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(skills) { skill in
                Button(action: {
                    if pressedButtons.contains(skill.id) {
                        pressedButtons.remove(skill.id)
                    } else {
                        pressedButtons.insert(skill.id)
                    }
                }) {
                    Text(skill.name)
                        .padding()
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    pressedButtons.contains(skill.id) ? Color(
                                        #colorLiteral(
                                            red: 0.5631446242,
                                            green: 0.5931319594,
                                            blue: 0.9755433202,
                                            alpha: 1
                                        )
                                    ) : Color.white)
                        )
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(.horizontal, 20)
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
    ChooseSkillsView()
}
