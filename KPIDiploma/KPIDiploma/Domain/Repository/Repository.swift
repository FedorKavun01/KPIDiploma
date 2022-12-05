//
//  Repository.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 29.11.2022.
//

import Foundation
import Combine
import Alamofire

protocol Repository {
    func signIn(login: String, password: String) -> AnyPublisher<User, AFError>
    func getUser(userId: String) -> AnyPublisher<User, AFError>
    func getGroup(groupId: String) -> AnyPublisher<Group, AFError>
    func getMarks(userId: String) -> AnyPublisher<[Mark], AFError>
    func getExams(userId: String) -> AnyPublisher<[Exam], AFError>
    func getFinanceData(userId: String) -> AnyPublisher<Finance, AFError>
    func getLesson(lessonId: String) -> AnyPublisher<Lesson, AFError>
    func getCurrentLesson(groupId: String) -> AnyPublisher<Lesson, AFError>
    func getLessons(groupId: String) -> AnyPublisher<[ScheduleDay], AFError>
}
