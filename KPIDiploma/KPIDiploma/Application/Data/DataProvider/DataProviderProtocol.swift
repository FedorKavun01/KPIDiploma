//
//  DataProviderProtocol.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 04.12.2022.
//

import Foundation
import Combine
import Alamofire

protocol DataProviderProtocol {
    func signIn(dto: SignInEntityDTO) -> AnyPublisher<UserDTO, AFError>
    func getUser(userId: String) -> AnyPublisher<UserDTO, AFError>
    func getGroup(groupId: String) -> AnyPublisher<GroupDTO, AFError>
    func getMarks(userId: String) -> AnyPublisher<[MarkDTO], AFError>
    func getExams(userId: String) -> AnyPublisher<[ExamDTO], AFError>
    func getFinanceData(userId: String) -> AnyPublisher<FinanceDTO, AFError>
    func getLesson(lessonId: String) -> AnyPublisher<LessonDTO, AFError>
    func getCurrentLesson(groupId: String) -> AnyPublisher<LessonDTO, AFError>
    func getLessons(groupId: String) -> AnyPublisher<[ScheduleDayDTO], AFError>
}
