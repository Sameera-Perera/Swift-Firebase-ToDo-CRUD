//
//  SignInView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-08.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        LoadingView(isShowing: $authViewModel.isLoadingActive) {
            VStack(){
                Text("Sign In")
                    .font(.system(size: 28))
                    .padding(.top, 100)
                    .font(Font.title.weight(.bold))
                    .padding(.bottom, 50)
                
                InputTextField(title: "Email", val: $email)
                InputPasswordField(title: "Password", val: $password)
                Text(authViewModel.errorMsg)
                    .font(.system(size: 14))
                    .foregroundColor(.pink)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                Button(action: {
                    authViewModel.signIn(email: email, password: password)
                   }) {
                       Text("Continue")
                           .frame(minWidth: 0, maxWidth: 200)
                           .font(.system(size: 18))
                           .padding()
                           .foregroundColor(.white)
                           .overlay(
                               RoundedRectangle(cornerRadius: 12)
                                   .stroke(Color.white, lineWidth: 2)
                       )
                   }
                   .background(Color.green) // If you have this
                   .cornerRadius(12)
                   .padding(.top)
                
                Spacer()
            }
        }
        .padding(.horizontal)
        .navigationBarTitle(Text("Sign In"), displayMode: .inline)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
