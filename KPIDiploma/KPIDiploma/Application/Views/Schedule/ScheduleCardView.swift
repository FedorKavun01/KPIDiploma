//
//  ScheduleCardView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import SwiftUI

struct ScheduleCardView: View {
    let lesson: Lesson
    
    var body: some View {
        VStack {
            picture
                .padding(.bottom, 5)
            
            HStack {
                Text(lesson.homework)
                    .font(.system(size: 18))
                    .lineLimit(2)
                    .foregroundColor(.gray)
                    .padding([.horizontal, .bottom])
                
                Spacer()
            }
        }
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        }
    }
    
    private var picture: some View {
        Image(lesson.name)
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(Color.gray.opacity(0.5))
            .overlay(alignment: .bottom) {
                HStack {
                    Spacer()
                    
                    Text(lesson.name)
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(.white)
                        .padding()
                }
            }
    }
}

struct ScheduleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCardView(lesson: .init(id: "",
                                       groupId: "",
                                       name: "Programming",
                                       startTime: .init(),
                                       endTime: .init(),
                                       teacher: "Teacher",
                                       theme: "Theme",
                                       homework: "Homework"))
    }
}
