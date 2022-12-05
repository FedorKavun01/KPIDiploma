//
//  ScheduleView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import SwiftUI

struct ScheduleView: View {
//    var schedule: [ScheduleDay] = [.init(id: "1",
//                                         date: .init(timeIntervalSinceNow: 0),
//                                         lessons: [.init(id: "100", groupId: "1", name: "Programming", startTime: .now, endTime: .now, teacher: "TeacherName2", theme: "Theme1", homework: "Homework1"),
//                                                   .init(id: "200", groupId: "2", name: "Design", startTime: .now.addingTimeInterval(1600), endTime: .now.addingTimeInterval(3000), teacher: "TeacherName3", theme: "Theme3", homework: "Homework3")]),
//                                   .init(id: "2",
//                                         date: .now.addingTimeInterval(100000),
//                                         lessons: [.init(id: "300", groupId: "1", name: "Database", startTime: .now.addingTimeInterval(101000), endTime: .now.addingTimeInterval(102000), teacher: "TeacherName2", theme: "Theme1", homework: "Homework1")])]
    @State private var shouldShowLesson: Bool = false
    @StateObject private var viewModel: ScheduleViewModel = .init()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.scheduleDays, id: \.id) { scheduleDay in
                    getDay(scheduleDay: scheduleDay)
                    
                    ForEach(scheduleDay.lessons, id: \.id) { lesson in
                        VStack {
                            NavigationLink {
                                LessonView(lesson: lesson)
                            } label: {
                                ScheduleCardView(lesson: lesson)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }
            }
        }
        
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func getDay(scheduleDay: ScheduleDay) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text(scheduleDay.date.getFormattedString(dateFormat: .usual))
                    .font(.system(size: 32))
                
                Spacer()
            }
            .padding()
            
            ForEach(scheduleDay.lessons) { lesson in
                ScheduleCardView(lesson: lesson)
            }
        }
        
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
