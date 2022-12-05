//
//  CurrentLessonView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import SwiftUI

struct CurrentLessonView: View {
//    let lesson: Lesson = .init(id: "",
//                               groupId: "",
//                               name: "Theory of algorithm",
//                               startTime: .init(),
//                               endTime: .init(),
//                               teacher: "TeacherName",
//                               link: "h", theme: "Sort algorithm",
//                               homework: "Make laboratory homework 1")
    @StateObject private var viewModel: CurrentLessonViewModel = .init()
    
    var body: some View {
        LessonView(lesson: viewModel.lesson ?? .mockData)
    }
}

struct CurrentLessonView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLessonView()
    }
}
