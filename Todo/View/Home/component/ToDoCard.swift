//
//  ToDoCard.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-09.
//

import SwiftUI

struct ToDoCard: View {
    var data: ToDoItem
    var body: some View {
        HStack {
            HStack {
                AsyncImage(url: URL(string: data.image))
                { image in image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFill()
                            .padding(.trailing)
                } placeholder: {
                    ProgressView()
                            .frame(width: 100, height: 100)
                            .background(.gray.opacity(0.1))
                            .padding(.trailing)
                }
                        
                VStack(alignment: .leading) {
                    Text(data.title)
                        .font(.callout)
                        .lineLimit(1)
                    Text(data.description)
                        .font(.system(size: 12))
                        .lineLimit(3)
                }
                
                Spacer()
                if(data.isCompleted){
                    Image(systemName: "checkmark.square")
                        .padding(.trailing, 10)
                } else {
                    Image(systemName: "square")
                        .padding(.trailing, 10)
                }
                
            }
            .padding(.vertical)
            .frame(height: 100)
            .background(Rectangle().fill(Color.white))
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.5), radius: 3, x: 2, y: 2)
        }.padding(.horizontal)
    }
}

struct ToDoCard_Previews: PreviewProvider {
    static var previews: some View {
        ToDoCard(data: ToDoItem(
            title: "Meet Eddie for lunch",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            image: "",
            isCompleted: true
        ))
    }
}
