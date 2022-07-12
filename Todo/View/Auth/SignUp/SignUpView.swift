//
//  SignUpView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-09.
//

import SwiftUI

struct SignUpView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        LoadingView(isShowing: $authViewModel.isLoadingActive) {
            VStack(){
                Text("Sign Up")
                    .font(.system(size: 28))
                    .padding(.top, 100)
                    .font(Font.title.weight(.bold))
                    .padding(.bottom, 50)
        
                InputTextField(title: "First Name", val: $firstName)
                InputTextField(title: "Last Name", val: $lastName)
                InputTextField(title: "Email", val: $email)
                InputPasswordField(title: "Password", val: $password)
                InputPasswordField(title: "Confirm Password", val: $confirmPassword)
                Text(authViewModel.errorMsg)
                    .font(.system(size: 14))
                    .foregroundColor(.pink)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
        
                Button(action: {
                    authViewModel.signUp(
                        user: UserDetails(
                            firstName: firstName,
                            lastName: lastName,
                            email: email
                        ),
                        password: password,
                        confirmPassword: confirmPassword);
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
        .navigationBarTitle(Text("Sign Up"), displayMode: .inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
