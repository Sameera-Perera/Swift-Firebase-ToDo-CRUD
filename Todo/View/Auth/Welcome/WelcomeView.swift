//
//  WelcomeView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-08.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        ZStack{
            VStack(){
                Image("WelcomeImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding(.top, 0)
                    .padding(.bottom, 30)
                
                if(authViewModel.isUserLogedIn){
                    NavigationLink(destination: HomeView()){
                        Text("Continue")
                            .frame(minWidth: 0, maxWidth: 200)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                           .background(Color.green) // If you have this
                           .cornerRadius(12)
                           .padding(.top, 50)
                    }
                } else {
                    VStack(){
                        NavigationLink(destination: SignUpView()){
                            Text("Sign Up")
                                .frame(minWidth: 0, maxWidth: 200)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                               .background(Color.green) // If you have this
                               .cornerRadius(12)
                        }
                        
                        NavigationLink(destination: SignInView()){
                            Text("Sign In")
                                .frame(minWidth: 0, maxWidth: 200)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.green)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
