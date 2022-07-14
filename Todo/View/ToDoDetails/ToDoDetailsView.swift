//
//  ToDoDetailsView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-09.
//

import SwiftUI

struct ToDoDetailsView: View {
    var data: ToDoItem
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: data.image))
            { image in image
                        .resizable()
                        .frame(height: 250)
                        .scaledToFit()
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 250)
                    .background(.gray.opacity(0.1))
            }
            Text(data.title)
                .font(.system(size: 22, weight: .bold))
                .padding(.leading)
                .padding(.bottom)
            Text(data.description)
                .font(.system(size: 12, weight: .thin))
                .padding(.leading)
            Spacer()
            Button(action: {
               }) {
                   if(data.isCompleted){
                       Text("Completed")
                           .frame(maxWidth: .infinity)
                           .font(.system(size: 18))
                           .padding()
                           .foregroundColor(.white)
                           .overlay(
                               RoundedRectangle(cornerRadius: 12)
                                   .stroke(Color.white, lineWidth: 2)
                       )
                   } else {
                       Text("Not Completed")
                           .frame(maxWidth: .infinity)
                           .font(.system(size: 18))
                           .padding()
                           .foregroundColor(.green)
                           .background(.white)
                           .overlay(
                               RoundedRectangle(cornerRadius: 12)
                                   .stroke(Color.green, lineWidth: 2)
                           )
                   }
               }
               .background(Color.green) // If you have this
               .cornerRadius(12)
               .padding()
        }
        .navigationTitle("ToDo Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: NavigationLink(destination: ToDoEditView(
            title: data.title, description: data.description)){
            //                Button(action: {}) {
                                  Image(systemName: "square.and.pencil")
                                    .imageScale(.large)
                                    .frame(width: 44, height: 44, alignment: .trailing)
            //                }
                    }
                )
    }
}

struct ToDoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailsView(data: ToDoItem(
            title: "Meet Eddie for lunch",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "",
            isCompleted: false
        ))
    }
}
