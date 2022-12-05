//
//  KPIPasswordField.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import SwiftUI

struct KPIPasswordField: View {
    @Binding var value: String
    let placeholder: String
    
    var body: some View {
        SecureField(placeholder, text: $value)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            }
    }
}

struct KPIPasswordField_Previews: PreviewProvider {
    static var previews: some View {
        KPIPasswordField(value: .constant("password"), placeholder: "Password")
    }
}
