//
//  InputPasswordField.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-08.
//

import SwiftUI

struct InputPasswordField: View {
    var title:String
    @Binding var val:String
    
    var body: some View {
        SecureField(title,
                    text: $val)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color(UIColor.separator), style: StrokeStyle(lineWidth: 1.0)))
        .autocapitalization(.none)
        .disableAutocorrection(true)
    }
}

struct InputPasswordField_Previews: PreviewProvider {
    @State static var password:String = ""
    static var previews: some View {
        InputPasswordField(
            title: "Input Password Field",
            val: $password
        )
    }
}
