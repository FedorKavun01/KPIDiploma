//
//  KPITextField.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 01.12.2022.
//

import SwiftUI

struct KPITextField: View {
    @Binding var value: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $value)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            }
    }
}

struct KPITextField_Previews: PreviewProvider {
    static var previews: some View {
        KPITextField(value: .constant("Text"), placeholder: "Placeholder")
    }
}
