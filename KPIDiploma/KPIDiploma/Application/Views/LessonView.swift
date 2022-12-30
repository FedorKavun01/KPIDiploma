//
//  CurrentLessonView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import SwiftUI

struct LessonView: View {
    let lesson: Lesson
    @State private var shouldShowAlert: Bool = false
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(lesson.name)
                    .font(.system(size: 36, weight: .medium))
                    .padding(.top, 50)
                    .padding(.bottom)
                
                ForEach(LessonRow.allCases, id: \.self) { lessonRow in
                    HStack(alignment: .top) {
                        Image(lessonRow.image)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFill()
                        
                        Text(getText(lessonRow: lessonRow))
                            .font(.system(size: 22))
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                }
            }
            .padding(.bottom, 40)
        }
        .overlay(alignment: .bottom) {
            MainButtonView(text: "Join", isDisabled: lesson.link == nil) {
                guard let link = lesson.link,
                      let url = URL(string: link) else { shouldShowAlert = true; return }
                openUrl(url)
            }
        }
        .alert("No link available", isPresented: $shouldShowAlert, actions: {
            Button("Ok", role: .cancel, action: {  })
        })
        .padding(.horizontal)
    }
    
    private func getText(lessonRow: LessonRow) -> String {
        switch lessonRow {
        case .teacher:
            return ": \(lesson.teacher)"
        case .time:
            return ": \(lesson.startTime.getFormattedString(dateFormat: .usual)) - \(lesson.endTime.getFormattedString(dateFormat: .usual))"
        case .theme:
            return ": \(lesson.theme)"
        case .homework:
            return ": \(lesson.homework)"
        }
    }
    
    enum LessonRow: CaseIterable {
        case teacher
        case time
        case theme
        case homework
        
        var image: String {
            switch self {
            case .teacher:
                return "Teacher"
            case .time:
                return "Time"
            case .theme:
                return "Theme"
            case .homework:
                return "Homework"
            }
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: .init(id: "",
                                        groupId: "",
                                        name: "Name",
                                        startTime: .init(),
                                        endTime: .init(),
                                        teacher: "Teacher",
                                        theme: "Theme",
                                        homework: "Homework"))
    }
}
