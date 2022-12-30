//
//  ExamView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 11.12.2022.
//

import SwiftUI

struct ExamView: View {
    @StateObject private var viewModel: ExamViewModel = .init()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Exams")
                    .font(.system(size: 35, weight: .semibold))
                    .padding(.vertical, 25)
                
                ForEach(viewModel.exams, id: \.id) { exam in
                    ExamCardView(exam: exam)
                        .padding([.bottom, .horizontal], 20)
                }
            }
        }.onAppear {
            viewModel.getExams()
        }
    }
}

struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        ExamView()
    }
}
