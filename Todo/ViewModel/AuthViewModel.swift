//
//  AuthViewModel.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.
//

import Firebase
import Combine

class AuthViewModel: ObservableObject{
    @Published var isLoadingActive = false
    @Published var isErrorActive = false
    @Published var errorMsg = ""
    @Published var isUserLogedIn = false
    
    var currentUser: FirebaseAuth.User? = Auth.auth().currentUser
    var handle: AuthStateDidChangeListenerHandle!
    
    private let authService:AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService()) {
        self.authService = authService
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                print("User is signed in.")
                self.isUserLogedIn = true
            } else {
                print("User is signed out.")
                self.isUserLogedIn = false
            }
        }
    }
    
    func signIn(email: String, password:String){
        isErrorActive = false
        isLoadingActive = true
        authService.signIn(
            email: email,
            password: password) {result in
                switch result {
                    case .success:
                        self.isLoadingActive = false
                        self.isUserLogedIn = true
                    case let .failure(error):
                        print(error)
                        self.isLoadingActive = false
                        self.errorMsg = error.localizedDescription
                        self.isErrorActive = true
                }
            }
    }
    
    func signUp(user: UserDetails, password:String, confirmPassword:String){
        isErrorActive = false
        errorMsg = ""
        isLoadingActive = true
        
        authService.signUp(
            user: user,
            password: password) {result in
                switch result {
                    case .success:
                        self.isLoadingActive = false
                        self.isUserLogedIn = true
                    case let .failure(error):
                        print(error)
                        self.isLoadingActive = false
                        self.errorMsg = error.localizedDescription
                        self.isErrorActive = true
                }
            }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            isUserLogedIn = false
        }
        catch { print("already logged out") }
    }
}
