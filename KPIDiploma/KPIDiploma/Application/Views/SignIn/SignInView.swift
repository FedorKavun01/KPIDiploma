//
//  SignInView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 01.12.2022.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel: SignInViewModel = .init()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                Text("Sign In")
                    .font(.system(size: 32, weight: .medium))
                    .padding(.vertical, 50)
                
                KPITextField(value: $viewModel.login, placeholder: "Login")
                
                KPIPasswordField(value: $viewModel.password, placeholder: "Password")
                    .padding(.bottom, 50)
                
                MainButtonView(text: "Sign In") {
                    viewModel.signIn()
                }
                
                NavigationLink("", isActive: $viewModel.isSignedIn) {
                    HomeView()
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
            }
            .padding(.horizontal)
        }
        .alert("Wrong credentials", isPresented: $viewModel.shouldShowErrorAlert, actions: {
            Button("Ok", role: .cancel, action: {  })
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
