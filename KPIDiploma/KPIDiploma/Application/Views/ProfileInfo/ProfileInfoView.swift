//
//  ProfileInfoView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import SwiftUI

struct ProfileInfoView: View {
//    var user: User = .init(id: "",
//                           groupId: "",
//                           firstName: "Fedir",
//                           lastName: "Kavun")
    @StateObject private var viewModel: InfoViewModel = .init()
    
    var body: some View {
        VStack {
            HStack {
                Text("Hi, \(viewModel.user?.firstName ?? "") \(viewModel.user?.lastName ?? "")")
                    .font(.system(size: 32, weight: .medium))
                
                Spacer()
            }.padding(.vertical, 50)
                .padding(.horizontal)
            
            ForEach(ProfileInfoRow.allCases, id: \.self) { profileInfo in
                Button(action: {}) {
                    HStack {
                        Text(profileInfo.name)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 10)
                
                Divider()
                    .frame(height: 4)
                    .foregroundColor(.black)
            }
            
            Spacer()
        }
        
    }
    
    enum ProfileInfoRow: CaseIterable {
        case marks
        case finance
        case exams
        case admin
        
        var name: String {
            switch self {
            case .marks:
                return "Marks"
            case .finance:
                return "Finance"
            case .exams:
                return "Exams"
            case .admin:
                return "Admin"
            }
        }
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}
