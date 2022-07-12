//
//  ProfileView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-12.
//

import SwiftUI

struct ProfileView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: "https://media.istockphoto.com/photos/portrait-of-handsome-smiling-young-man-with-crossed-arms-picture-id1200677760?k=20&m=1200677760&s=612x612&w=0&h=JCqytPoHb6bQqU9bq6gsWT2EX1G5chlW5aNK81Kh4Lg="))
            { image in image
                        .resizable()
                        .frame(width: 150, height: 150)
                        .scaledToFill()
                        .clipShape(Circle())
                        .padding(.bottom)
            } placeholder: {
                ProgressView()
                        .frame(width: 150, height: 150)
                        .background(.gray.opacity(0.1))
                        .clipShape(Circle())
                        .padding(.bottom)
            }
            InputTextField(title: "First Name", val: $firstName)
            InputTextField(title: "Last Name", val: $lastName)
            InputTextField(title: "Email", val: $email)
            HStack(){
                Button(action: {
                    authViewModel.signOut();
                }){
                    Text("Logout")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.green)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.green, lineWidth: 1)
                        )
                }
                
                NavigationLink(destination: SignUpView()){
                    Text("Update")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white, lineWidth: 2)
                    ).background(Color.green) // If you have this
                        .cornerRadius(12)
                       
                }
                
            }.padding(.top)
            Spacer()
        }
        .padding(.top, 50)
        .padding(.horizontal)
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
