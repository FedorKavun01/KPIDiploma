//
//  ExamCardView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 11.12.2022.
//

import SwiftUI

struct ExamCardView: View {
    let exam: Exam
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(exam.name)
                    .font(.system(size: 25, weight: .medium))
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            
            HStack {
                Text("\(exam.startTime.getFormattedString(dateFormat: .usual)) \n\(exam.endTime.getFormattedString(dateFormat: .usual))")
                
                Spacer()
                
                Text("Mark")
            }
            .font(.system(size: 15))
            .foregroundColor(.gray)
        }
        .padding()
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        }
        .shadow(color: Color.gray.opacity(0.08), radius: 32, x: 0, y: 24)
        .shadow(color: Color.gray.opacity(0.08), radius: 16, x: 0, y: 16)
    }
}

struct ExamCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExamCardView(exam: .init(id: "",
                                 groupId: "",
                                 name: "Exam",
                                 startTime: .init(),
                                 endTime: .init(),
                                 teacher: "Teacher"))
    }
}
