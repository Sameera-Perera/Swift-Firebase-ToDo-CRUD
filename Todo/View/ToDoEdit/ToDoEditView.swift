//
//  ToDoEditView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.
//

import SwiftUI

struct ToDoEditView: View {
    @State var title = ""
    @State var description = ""
    @State var isImageShow = false
    @State var inputImage:UIImage?
    
    var body: some View {
        VStack(){
            InputTextField(title: "Title", val: $title)
            InputTextField(title: "Description", val: $description)
            HStack(){
                Text("Image")
                    .foregroundColor(.gray.opacity(0.7))
                Spacer()
                Button(action: {
                    isImageShow = true
                }){
                    Text("Add")
                }
            }.padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0)))
            
            HStack(){
                Button(action: {
                   }) {
                       Text("Delete")
                           .frame(maxWidth: .infinity)
                           .font(.system(size: 18))
                           .padding()
                           .foregroundColor(.green)
                           .overlay(
                               RoundedRectangle(cornerRadius: 12)
                                   .stroke(Color.green, lineWidth: 2)
                           )
                   }
                   .background(Color.white)
                   .cornerRadius(12)
                   .padding(.top)
                Button(action: {
                   }) {
                       Text("Update")
                           .frame(maxWidth: .infinity)
                           .font(.system(size: 18))
                           .padding()
                           .foregroundColor(.white)
                           .overlay(
                               RoundedRectangle(cornerRadius: 12)
                                   .stroke(Color.white, lineWidth: 2)
                       )
                   }
                   .background(Color.green)
                   .cornerRadius(12)
                   .padding(.top)
            }
        }
        .navigationTitle("Edit ToDo")
        .padding(.horizontal)
        .sheet(isPresented: $isImageShow){
            ImagePicker(image: $inputImage)
        }
    }
}

struct ToDoEditView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoEditView()
    }
}
