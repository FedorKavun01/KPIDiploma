//
//  MarksView.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 03.12.2022.
//

import SwiftUI

struct MarksView: View {
    @StateObject private var viewModel: MarksViewModel = .init()
    @State private var marks: [Mark] = [
        .init(id: "1",
              studentId: "",
              name: "Mark1",
              mark: 100,
              teacher: "Teacher"),
        .init(id: "2",
              studentId: "",
              name: "Mark1",
              mark: 94,
              teacher: "Teacher"),
        .init(id: "3",
              studentId: "",
              name: "Mark1",
              mark: 100,
              teacher: "Teacher")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Marks")
                    .font(.system(size: 35, weight: .semibold))
                    .padding(.vertical, 25)
                
                ForEach(viewModel.marks) { mark in
                    MarkCardView(mark: mark)
                        .padding([.bottom, .horizontal], 20)
                }
                
            }
        }.onAppear {
            viewModel.getMarks()
        }
    }
}

struct MarksView_Previews: PreviewProvider {
    static var previews: some View {
        MarksView()
    }
}
