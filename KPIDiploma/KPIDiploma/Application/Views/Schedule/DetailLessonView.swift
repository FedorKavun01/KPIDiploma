//
//  DetailLessonView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.10.2022.
//

import SwiftUI

struct DetailLessonView: View {
    @StateObject private var viewModel: DetailLessonViewModel
    
    init(lessonId: String) {
        self._viewModel = StateObject(wrappedValue: .init(lessonId: lessonId))
        viewModel.getLesson()
    }
    
    var body: some View {
        LessonView(lesson: viewModel.lesson ?? .mockData)
    }
}

struct DetailLessonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailLessonView(lessonId: "")
    }
}
