//
//  ToDoCreateView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.
//

import SwiftUI

struct ToDoCreateView: View {
    @State var title = ""
    @State var isImageShow = false
    @State var inputImage:UIImage?
    
    var body: some View {
        VStack(){
            InputTextField(title: "Title", val: $title)
            InputTextField(title: "Description", val: $title)
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
            
            Button(action: {
               }) {
                   Text("Save")
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
            
        }
        .navigationTitle("Carete ToDo")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .sheet(isPresented: $isImageShow){
            ImagePicker(image: $inputImage)
        }
    }
}

struct ToDoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoCreateView()
    }
}
