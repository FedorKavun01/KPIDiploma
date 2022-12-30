//
//  LessonDTO.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 02.12.2022.
//

import Foundation

struct LessonDTO: Codable {
    public var id: String
    public var groupID: String
    public var name: String
    public var startTime: String
    public var endTime: String
    public var teacher: String
    public var link: String?
    public var theme: String
    public var homework: String
}
