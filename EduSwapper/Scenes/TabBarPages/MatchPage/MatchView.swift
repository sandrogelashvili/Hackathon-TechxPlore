//
//  MatchView.swift
//  EduSwapper
//
//  Created by Sandro Gelashvili on 05.07.24.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0.6002492309, green: 0.4447047114, blue: 0.7150582671, alpha: 1)),Color(#colorLiteral(red: 0.5631446242, green: 0.5931319594, blue: 0.9755433202, alpha: 1))],
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    MatchView()
}
