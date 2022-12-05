//
//  LessonDTO.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import Foundation

struct LessonDTO: Codable {
    public var id: String
    public var groupId: String
    public var name: String
    public var startTime: Date
    public var endTime: Date
    public var teacher: String
    public var link: String?
    public var theme: String
    public var homework: String
}
