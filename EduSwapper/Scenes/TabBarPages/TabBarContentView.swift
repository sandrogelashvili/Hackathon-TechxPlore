//
//  TabBarContentView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct TabBarContentView: View {
    init() {
        let standardAppearance = UITabBarAppearance()
        standardAppearance.configureWithDefaultBackground()
        standardAppearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        standardAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        let scrollEdgeAppearance = UITabBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        scrollEdgeAppearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        scrollEdgeAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        UITabBar.appearance().standardAppearance = standardAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
        }
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            MatchView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            ListOfInterestedView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }

            ChatView()
                .tabItem {
                    Label("Chats", systemImage: "message")
                }

            ProfileSettingsView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .accentColor(Color(#colorLiteral(red: 0.5631446242, green: 0.5931319594, blue: 0.9755433202, alpha: 1)))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarContentView()
}
