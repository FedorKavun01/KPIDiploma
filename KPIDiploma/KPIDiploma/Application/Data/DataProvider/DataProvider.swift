//
//  DataProvider.swift
//  KPIDiploma
//
//  Created by Fyodor Kavun on 04.12.2022.
//

import Foundation
import Combine
import Alamofire

class DataProvider: DataProviderProtocol {
    private let rest = RESTClient()
    
    func signIn(login: String, password: String) -> AnyPublisher<UserDTO, AFError> {
        return rest.execute(url: "http://localhost:5000/api/User/GetUser", method: .post, parameters: ["login": login, "password": password])
    }
    
    func getUser(userId: String) -> AnyPublisher<UserDTO, AFError> {
        return rest.execute(url: "http://localhost:5000/api/User/GetUser", method: .get, parameters: ["id": userId])
    }
    
    func getGroup(groupId: String) -> AnyPublisher<GroupDTO, AFError> {
        return rest.execute(url: "http://localhost:5000/api/Group/GetGroup", method: .get, parameters: ["id": groupId])
    }
    
    func getMarks(userId: String) -> AnyPublisher<[MarkDTO], AFError> {
        return rest.execute(url: "http://localhost:5000/api/Mark/GetMarks", method: .get, parameters: ["studentId": userId])
    }
    
    func getExams(userId: String) -> AnyPublisher<[ExamDTO], AFError> {
        return rest.execute(url: "http://localhost:5000/api/Exam/GetExams", method: .get, parameters: ["groupId": userId])
    }
    
    func getFinanceData(userId: String) -> AnyPublisher<FinanceDTO, AFError> {
        return rest.execute(url: "http://localhost:5000/api/Financial/GetFinancialData", method: .get, parameters: ["studentId": userId])
    }
    
    func getLesson(lessonId: String) -> AnyPublisher<LessonDTO, AFError> {
        return rest.execute(url: "http://localhost:5000/api/Lesson/GetLesson", method: .get, parameters: ["id": lessonId])
    }
    
    func getCurrentLesson(groupId: String) -> AnyPublisher<LessonDTO, AFError> {
        return rest.execute(url: "http://localhost:5000/api/Lesson/GetCurrentLesson", method: .get, parameters: ["groupId": groupId])
    }
    
    func getLessons(groupId: String) -> AnyPublisher<[ScheduleDayDTO], AFError> {
        return rest.execute(url: "http://localhost:5000/api/Lesson/GetLessons", method: .get, parameters: ["groupId": groupId])
    }
    
    
}
