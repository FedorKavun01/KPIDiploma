//
//  ScheduleDayDTO.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import Foundation

struct ScheduleDayDTO: Codable {
    public var id: String
    public var date: String
    public var lessons: [LessonDTO]
}
