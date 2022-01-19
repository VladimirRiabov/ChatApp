//
//  SettingsView.swift
//  ChatApp
//
//  Created by Владимир Рябов on 18.01.2022.
//

import SwiftUI

struct SettingsView: View {
    private let user: User

    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                NavigationLink(
                    destination: EditProfileView(user: user),
                    label: { SettingsHeaderView(user: user)})
                
                VStack(spacing: 1) {
                    //запускается столоько раз сколько кейсов в энам и использует его для отображения каждой из строк
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                        SettingsCell(viewModel: viewModel)
                    }
                }
                
                Button(action: {
                    AuthViewModel.shared.signout()
                }, label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(Color.white)
                })
                
                Spacer()
            }
        }
        
            
    }
}
