//
//  MainButtonView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 01.12.2022.
//

import SwiftUI

struct MainButtonView: View {
    let text: String
    let isDisabled: Bool
    let action: () -> Void
    
    init(text: String, isDisabled: Bool = false, action: @escaping () -> Void) {
        self.text = text
        self.isDisabled = isDisabled
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            VStack {
                Text(text)
                    .font(.system(size: 16))
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(!isDisabled ? Color.lochinvar : Color.lochinvar.opacity(0.5))
            .cornerRadius(40)
        }
        .disabled(isDisabled)
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView(text: "Text", isDisabled: true, action: {})
    }
}
