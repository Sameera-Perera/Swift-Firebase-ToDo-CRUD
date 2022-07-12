//
//  HomeView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-09.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    @State var isToDoDetailsActive = false
    
    private var todoItems = [
        ToDoItem(
            title: "Meet Eddie for lunch",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "",
            isCompleted: true
        ),
        ToDoItem(
            title: "Meet Eddie for lunch",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "",
            isCompleted: true
        ),
        ToDoItem(
            title: "Meet Eddie for lunch",
            description: "description",
            image: "",
            isCompleted: false
        ),
    ]
    
    var body: some View {
        VStack(){
            SearchBarField(text: $searchText)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach (todoItems, id: \.id) { val in
                    NavigationLink(destination: ToDoDetailsView(data: val)) {
                        ToDoCard(data: val)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
            }.padding(.top)
            
            Spacer()
            
        }.navigationBarBackButtonHidden(true)
            .navigationTitle("Home")
            .navigationBarItems(trailing: HStack(){
                NavigationLink(destination: ProfileView()){
                    Image(systemName: "person.crop.square")
                }
                NavigationLink(destination: ToDoCreateView()){
                    Image(systemName: "plus.square")
                }
            }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
