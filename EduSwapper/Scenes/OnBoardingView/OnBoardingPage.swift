//
//  WelcomePage.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 04.07.24.
//

import SwiftUI

struct OnBoardingPage: View {
    var totalPages = 4
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        if currentPage > totalPages {
            LoginView()
        } else {
            ZStack {
                LinearGradient(
                    colors: [Color(#colorLiteral(red: 0.6002492309, green: 0.4447047114, blue: 0.7150582671, alpha: 1)),Color(#colorLiteral(red: 0.5631446242, green: 0.5931319594, blue: 0.9755433202, alpha: 1))],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                if currentPage == 1 {
                    OnBoardingReusablePage(
                        titleForOBPage: "Welcome to UpSwap",
                        imageForOBPage: "StartingImage",
                        descriptionForOBPage: "Unlock a world of knowledge exchange. Swap your skills, learn from others, and grow together!",
                        totalPages: totalPages,
                        currentPage: $currentPage,
                        isLastPage: false
                    )
                }
                
                if currentPage == 2 {
                    OnBoardingReusablePage(
                        titleForOBPage: "Create Your Profile",
                        imageForOBPage: "Skills",
                        descriptionForOBPage: "Tell us about the skills you have and the knowledge you’re looking for. This helps us find the best matches for you.",
                        totalPages: totalPages,
                        currentPage: $currentPage,
                        isLastPage: false
                    )
                }
                
                if currentPage == 3 {
                    OnBoardingReusablePage(
                        titleForOBPage: "Swipe to Match",
                        imageForOBPage: "SwapBooks",
                        descriptionForOBPage: "Swipe right to connect with users who have the skills you need or who need your skills. Swipe left to pass.",
                        totalPages: totalPages,
                        currentPage: $currentPage,
                        isLastPage: false
                    )
                }
                
                if currentPage == 4 {
                    OnBoardingReusablePage(
                        titleForOBPage: "Chat and Learn",
                        imageForOBPage: "ChatAndLearn",
                        descriptionForOBPage: "Once you match, start chatting and share your knowledge. Set up virtual meetings, exchange resources, and grow your skills.",
                        totalPages: totalPages,
                        currentPage: $currentPage,
                        isLastPage: true
                    )
                }
            }
        }
    }
}


#Preview {
    OnBoardingPage()
}
