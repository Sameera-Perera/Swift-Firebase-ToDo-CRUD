//
//  ToDoCreateView.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-10.
//

import SwiftUI

struct ToDoCreateView: View {
    @State var title = ""
    @State var description = ""
    @State var isImageShow = false
    @State var inputImage:UIImage?
    
    @StateObject var toDoViewModel = ToDoViewModel()
    
    var body: some View {
        LoadingView(isShowing: $toDoViewModel.isLoadingActive) {
            VStack(){
                Spacer()
                InputTextField(title: "Title", val: $title)
                InputTextField(title: "Description", val: $description)
                HStack(){
                    Text("Image")
                        .foregroundColor(.gray.opacity(0.7))
                    Spacer()
                    if(inputImage != nil){
                        Image(uiImage: inputImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 25)
                    }
                    Button(action: {
                        isImageShow = true
                    }){
                        if(inputImage != nil){
                            Text("Change")
                        } else {
                            Text("Add")
                        }
                    }
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0)))
                
                Button(action: {
                    if(title.isEmpty){
                        toDoViewModel.infoMsg = "Please enter title"
                        toDoViewModel.isInfoActive = true
                    }
                    else if(description.isEmpty){
                        toDoViewModel.infoMsg = "Please enter description"
                        toDoViewModel.isInfoActive = true
                    }
                    else if(inputImage == nil){
                        toDoViewModel.infoMsg = "Please select image"
                        toDoViewModel.isInfoActive = true
                    } else {
                        toDoViewModel.createToDo(title: title, description: description, image: inputImage!)
                    }
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
                
                Spacer()
            }
        }
        .navigationTitle("Carete ToDo")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .sheet(isPresented: $isImageShow){
            ImagePicker(image: $inputImage)
        }
        .alert(toDoViewModel.infoMsg, isPresented: $toDoViewModel.isInfoActive) {
                    Button("OK", role: .cancel) {
                        
                    }
                }
    }
}

struct ToDoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoCreateView()
    }
}
