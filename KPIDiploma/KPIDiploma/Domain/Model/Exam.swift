//
//  Exam.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import Foundation

struct Exam {
    public var id: String
    public var groupId: String
    public var name: String
    public var startTime: Date
    public var endTime: Date
    public var teacher: String
    public var link: String?
    
    static let mockData: Self = .init(id: "", groupId: "", name: "", startTime: .now, endTime: .now, teacher: "")
}
