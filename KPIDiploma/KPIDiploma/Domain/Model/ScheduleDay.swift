//
//  ScheduleDay.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import Foundation

struct ScheduleDay: Identifiable {
    public var id: String
    public var date: Date
    public var lessons: [Lesson]
    
    static let mockData: Self = .init(id: "", date: .now, lessons: [])
}
